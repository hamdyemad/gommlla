<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Category;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\InstamojoController;
use App\Http\Controllers\ClubPointController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\PublicSslCommerzPaymentController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AffiliateController;
use App\Http\Controllers\PaytmController;
use App\Order;
use App\BusinessSetting;
use App\Coupon;
use App\CouponUsage;
use App\User;
use App\Address;
use App\Country;
use App\Language;
use App\Mail\OrderStatus;
use App\Shipping;
use App\shipping_commission;
use Session;
use App\Utility\PayhereUtility;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{

    public function __construct()
    {
        //
    }

    //check the selected payment gateway and redirect to that controller accordingly
    public function checkout(Request $request)
    {
        if ($request->payment_option != null) {
            $orderController = new OrderController;
            $orderController->store($request);
            $request->session()->put('payment_type', 'cart_payment');
            if ($request->session()->get('order_id') != null) {
                if ($request->payment_option == 'paypal') {
                    $paypal = new PaypalController;
                    return $paypal->getCheckout();
                } elseif ($request->payment_option == 'stripe') {
                    $stripe = new StripePaymentController;
                    return $stripe->stripe();
                } elseif ($request->payment_option == 'sslcommerz') {
                    $sslcommerz = new PublicSslCommerzPaymentController;
                    return $sslcommerz->index($request);
                } elseif ($request->payment_option == 'instamojo') {
                    $instamojo = new InstamojoController;
                    return $instamojo->pay($request);
                } elseif ($request->payment_option == 'razorpay') {
                    $razorpay = new RazorpayController;
                    return $razorpay->payWithRazorpay($request);
                } elseif ($request->payment_option == 'paystack') {
                    $paystack = new PaystackController;
                    return $paystack->redirectToGateway($request);
                } elseif ($request->payment_option == 'voguepay') {
                    $voguePay = new VoguePayController;
                    return $voguePay->customer_showForm();
                } elseif ($request->payment_option == 'twocheckout') {
                    $twocheckout = new TwoCheckoutController;
                    return $twocheckout->index($request);
                } elseif ($request->payment_option == 'payhere') {
                    $order = Order::findOrFail($request->session()->get('order_id'));

                    $order_id = $order->id;
                    $amount = $order->grand_total;
                    $first_name = $order->name;
                    $last_name = 'X';
                    $phone = $order->phone;
                    $email = $order->email;
                    $address = $order->address;
                    $city = $order->city;

                    return PayhereUtility::create_checkout_form($order_id, $amount, $first_name, $last_name, $phone, $email, $address, $city);
                } else if ($request->payment_option == 'ngenius') {
                    $ngenius = new NgeniusController();
                    return $ngenius->pay();
                } else if ($request->payment_option == 'flutterwave') {
                    $flutterwave = new FlutterwaveController();
                    return $flutterwave->pay();
                } else if ($request->payment_option == 'mpesa') {
                    $mpesa = new MpesaController();
                    return $mpesa->pay();
                } elseif ($request->payment_option == 'paytm') {
                    $paytm = new PaytmController;
                    return $paytm->index();
                } elseif ($request->payment_option == 'cash_on_delivery') {
                    $request->session()->forget('owner_id');
                    $request->session()->forget('cart');
                    $request->session()->forget('delivery_info');
                    $request->session()->forget('coupon_id');
                    $request->session()->forget('coupon_discount');

                    flash(translate("Your order has been placed successfully"))->success();
                    return redirect()->route('order_confirmed');
                } elseif ($request->payment_option == 'wallet') {
                    $user = Auth::user();
                    $order = Order::findOrFail($request->session()->get('order_id'));
                    if($user->balance >= $order->grand_total){
                        $user->balance -= $order->grand_total;
                        $user->save();
                        $request->session()->forget('owner_id');
                        $request->session()->forget('cart');
                        $request->session()->forget('delivery_info');
                        $request->session()->forget('coupon_id');
                        $request->session()->forget('coupon_discount');

                        flash(translate("Your order has been placed successfully"))->success();
                        return redirect()->route('order_confirmed');
                        // return $this->checkout_done($request->session()->get('order_id'), null);
                    }
                } else {
                    $order = Order::findOrFail($request->session()->get('order_id'));
                    $order->manual_payment = 1;
                    $order->save();
                    $request->session()->forget('cart');
                    $request->session()->forget('owner_id');
                    $request->session()->forget('delivery_info');
                    $request->session()->forget('coupon_id');
                    $request->session()->forget('coupon_discount');

                    flash(translate('Your order has been placed successfully. Please submit payment information from purchase history'))->success();
                    return redirect()->route('order_confirmed');
                }
            }
        } else {
            flash(translate('Select Payment Option.'))->warning();
            return back();
        }
    }

    //redirects to this method after a successfull checkout
    public function checkout_done($order_id, $payment)
    {
        $order = Order::findOrFail($order_id);
        $order->payment_status = '???? ??????????';
        $order->payment_details = $payment;
        $order->save();

        if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
            $affiliateController = new AffiliateController;
            $affiliateController->processAffiliatePoints($order);
        }

        if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
            $clubpointController = new ClubPointController;
            $clubpointController->processClubPoints($order);
        }
        if (\App\Addon::where('unique_identifier', 'seller_subscription')->first() == null || !\App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated) {
            if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
                $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = '???? ??????????';
                    $orderDetail->save();
                    if ($orderDetail->product->user->user_type == 'seller') {
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price * (100 - $commission_percentage)) / 100 + $orderDetail->tax + $orderDetail->shipping_cost;
                        $seller->save();
                    }
                }
            } else {
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = '???? ??????????';
                    $orderDetail->save();
                    if ($orderDetail->product->user->user_type == 'seller') {
                        $commission_percentage = $orderDetail->product->category->commision_rate;
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price * (100 - $commission_percentage)) / 100 + $orderDetail->tax + $orderDetail->shipping_cost;
                        $seller->save();
                    }
                }
            }
        } else {
            foreach ($order->orderDetails as $key => $orderDetail) {
                $orderDetail->payment_status = '???? ??????????';
                $orderDetail->save();
                if ($orderDetail->product->user->user_type == 'seller') {
                    $seller = $orderDetail->product->user->seller;
                    $seller->admin_to_pay = $seller->admin_to_pay + $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                    $seller->save();
                }
            }
        }

        $order->commission_calculated = 1;
        $order->save();

        Session::put('cart', Session::get('cart')->where('owner_id', '!=', Session::get('owner_id')));
        Session::forget('owner_id');
        Session::forget('payment_type');
        Session::forget('delivery_info');
        Session::forget('coupon_id');
        Session::forget('coupon_discount');


        flash(translate('Payment completed'))->success();
        return view('frontend.order_confirmed', compact('order'));
    }

    public function get_shipping_info(Request $request)
    {
        $countries = Country::whereIn('id', \App\Shipping::pluck('country_id'))->get();
        if(count($countries) > 0) {
            if (Session::has('cart') && count(Session::get('cart')) > 0) {
                $categories = Category::all();
                return view('frontend.shipping_info', compact('categories', 'countries'));
            }
            flash(translate('Your cart is empty'))->success();
            return back();
        } else {
            flash(translate('Add Shipping First For Countries'))->error();
            return back();
        }
    }

    public function store_shipping_info(Request $request)
    {
        if (Auth::check()) {
            if(Auth::user()->user_type == 'affiliate') {
                $country = Country::find($request->country);
                $shipping = Shipping::find($request->city);
                if($country && $shipping) {
                    Address::create([
                        'user_id' => Auth::user()->id,
                        'client_name' => $request->name,
                        'address' => $request->address,
                        'zone' => $request->zone,
                        'country_id' => $request->country,
                        'city_id' => $request->city,
                        'phone' => $request->phone
                    ]);
                    $data['name'] = $request->name;
                    $data['address'] = $request->address;
                    $data['country'] = $country->name;
                    $data['city'] = $shipping->city;
                    $data['city_id'] = $request->city;
                    $data['zone'] = $request->zone;
                    $data['phone'] = $request->phone;
                    $data['checkout_type'] = $request->checkout_type;
                } else {
                    flash(translate('there is something error'))->warning();
                    return redirect()->back();
                }
            } else {
                if ($request->address_id == null) {
                    flash(translate("Please add shipping address"))->warning();
                    return back();
                }
                $address = Address::findOrFail($request->address_id);
                $data['name'] = Auth::user()->name;
                $data['email'] = Auth::user()->email;
                $data['address'] = $address->address;
                $data['country'] = $address->country->name;
                $data['city'] = $address->city->city;
                $data['city_id'] = $address->city_id;
                $data['zone'] = $address->zone;
                $data['phone'] = $address->phone;
                $data['checkout_type'] = $request->checkout_type;
                $shipping = Shipping::find($address->city_id);
            }
        } else {
            $shipping = Shipping::where('city', $request->city)->first();
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['address'] = $request->address;
            $data['country'] = $request->country;
            $data['city'] = $request->city;
            $data['city_id'] = $shipping->id;
            $data['zone'] = $request->zone;
            $data['phone'] = $request->phone;
            $data['checkout_type'] = $request->checkout_type;
        }

        $shipping_info = $data;
        $request->session()->put('shipping_info', $shipping_info);
        // Store Delivery Info
        $request->session()->put('owner_id', $request->owner_id);
        if (Session::has('cart') && count(Session::get('cart')) > 0) {
            $request->session()->put('shipping_info', $shipping_info);
            return redirect(route('checkout.payment_info'));
        } else {
            flash(translate('Your Cart was empty'))->warning();
            return redirect()->route('home');
        }
    }

    public function store_delivery_info(Request $request)
    {
        $shipping_info = $request->session()->get('shipping_info');
        $shipping = Shipping::where('city', 'like', '%' . $shipping_info['city'] .'%')->first();
        $request->session()->put('owner_id', $request->owner_id);
        if (Session::has('cart') && count(Session::get('cart')) > 0) {
            $cart = $request->session()->get('cart', collect([]));
            $cart = $cart->map(function ($object, $key) use ($request) {
                if (\App\Product::find($object['id'])->user_id == $request->owner_id) {
                    if ($request['shipping_type_' . $request->owner_id] == 'home_delivery') {
                        $object['shipping_type'] = 'home_delivery';
                    } else {
                        $object['shipping_type'] = 'pickup_point';
                        $object['pickup_point'] = $request['pickup_point_id_' . $request->owner_id];
                    }
                }
                return $object;
            });
            $request->session()->put('cart', $cart);

            $subtotal = 0;
            $tax = 0;
            foreach (Session::get('cart') as $key => $cartItem) {
                $subtotal += $cartItem['price'] * $cartItem['quantity'];
            }
            $total = $subtotal + $tax + $shipping->cost;
            if (Session::has('coupon_discount')) {
                $total -= Session::get('coupon_discount');
            }
            return view('frontend.payment_select', compact('total', 'shipping'));
        } else {
            flash(translate('Your Cart was empty'))->warning();
            return redirect()->route('home');
        }
    }

    public function get_payment_info(Request $request)
    {
        $shipping_info = $request->session()->get('shipping_info');
        $shipping = Shipping::find($shipping_info['city_id']);
        if (Session::has('cart') && count(Session::get('cart')) > 0) {
            $cart = $request->session()->get('cart', collect([]));
            $request->session()->put('cart', $cart);
            $grand_total =  array_reduce(array_map(function($sub_cart) {
                return $sub_cart['price'] * $sub_cart['quantity'];
            }, $cart->toArray()), function($current, $acc) {
                return $current + $acc;
            });
            $shipping_commission = shipping_commission::where('total_price', '<=', $grand_total)->orderBy('total_price', 'DESC')->first();
            if($shipping_commission) {
                $shipping_commission = $shipping_commission->commission;
            } else {
                $shipping_commission = 0;
            }
            $shipping_info['shipping_commission'] = $shipping_commission;
            $request->session()->put('shipping_info', $shipping_info);
            $subtotal = 0;
            foreach (Session::get('cart') as $key => $cartItem) {
                $subtotal += $cartItem['price'] * $cartItem['quantity'];
            }
            $total = $subtotal + $shipping->cost + $shipping_commission;
            if (Session::has('coupon_discount')) {
                $total -= Session::get('coupon_discount');
            }
            return view('frontend.payment_select', compact('total', 'shipping', 'shipping_commission', 'subtotal'));
        } else {
            flash(translate('Your Cart was empty'))->warning();
            return redirect()->route('home');
        }
    }

    public function apply_coupon_code(Request $request)
    {
        //dd($request->all());
        $coupon = Coupon::where('code', $request->code)->first();

        if ($coupon != null) {
            if (strtotime(date('d-m-Y')) >= $coupon->start_date && strtotime(date('d-m-Y')) <= $coupon->end_date) {
                if (CouponUsage::where('user_id', Auth::user()->id)->where('coupon_id', $coupon->id)->first() == null) {
                    $coupon_details = json_decode($coupon->details);

                    if ($coupon->type == 'cart_base') {
                        $subtotal = 0;
                        $tax = 0;
                        $shipping = 0;
                        foreach (Session::get('cart') as $key => $cartItem) {
                            $subtotal += $cartItem['price'] * $cartItem['quantity'];
                            $tax += $cartItem['tax'] * $cartItem['quantity'];
                            $shipping += $cartItem['shipping'] * $cartItem['quantity'];
                        }
                        $sum = $subtotal + $tax + $shipping;

                        if ($sum >= $coupon_details->min_buy) {
                            if ($coupon->discount_type == 'percent') {
                                $coupon_discount = ($sum * $coupon->discount) / 100;
                                if ($coupon_discount > $coupon_details->max_discount) {
                                    $coupon_discount = $coupon_details->max_discount;
                                }
                            } elseif ($coupon->discount_type == 'amount') {
                                $coupon_discount = $coupon->discount;
                            }
                            $request->session()->put('coupon_id', $coupon->id);
                            $request->session()->put('coupon_discount', $coupon_discount);
                            flash(translate('Coupon has been applied'))->success();
                        }
                    } elseif ($coupon->type == 'product_base') {
                        $coupon_discount = 0;
                        foreach (Session::get('cart') as $key => $cartItem) {
                            foreach ($coupon_details as $key => $coupon_detail) {
                                if ($coupon_detail->product_id == $cartItem['id']) {
                                    if ($coupon->discount_type == 'percent') {
                                        $coupon_discount += $cartItem['price'] * $coupon->discount / 100;
                                    } elseif ($coupon->discount_type == 'amount') {
                                        $coupon_discount += $coupon->discount;
                                    }
                                }
                            }
                        }
                        $request->session()->put('coupon_id', $coupon->id);
                        $request->session()->put('coupon_discount', $coupon_discount);
                        flash(translate('Coupon has been applied'))->success();
                    }
                } else {
                    flash(translate('You already used this coupon!'))->warning();
                }
            } else {
                flash(translate('Coupon expired!'))->warning();
            }
        } else {
            flash(translate('Invalid coupon!'))->warning();
        }
        return back();
    }

    public function remove_coupon_code(Request $request)
    {
        $request->session()->forget('coupon_id');
        $request->session()->forget('coupon_discount');
        return back();
    }

    public function order_confirmed()
    {
        $shipping_info = Session::get('shipping_info');
        $shipping = Shipping::where('city', 'like', '%' . $shipping_info['city'] .'%')->first()->cost;
        $order = Order::findOrFail(Session::get('order_id'));
        return view('frontend.order_confirmed', compact('order', 'shipping'));
    }
}
