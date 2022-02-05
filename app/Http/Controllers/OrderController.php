<?php

namespace App\Http\Controllers;

use App\AffiliateOption;
use Illuminate\Http\Request;
use App\Http\Controllers\OTPVerificationController;
use App\Http\Controllers\ClubPointController;
use App\Http\Controllers\AffiliateController;
use App\Order;
use App\Product;
use App\ProductStock;
use App\Color;
use App\OrderDetail;
use App\CouponUsage;
use App\OtpConfiguration;
use App\User;
use App\BusinessSetting;
use App\ClubPoint;
use App\ClubPointDetail;
use App\Country;
use App\Distribution;
use App\Language;
use Auth;
use Session;
use DB;
use PDF;
use App\Mail\InvoiceEmailManager;
use App\Mail\OrderStatus;
use App\Mail\SupportMailManager;
use App\orders_should_payments;
use App\OrdersStatusHistory;
use App\PickupPoint;
use App\Staff;
use App\Shipping;
use App\Status;
use App\unit;
use App\Wallet;
use App\wallet_history;
use CoreComponentRepository;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource to seller.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $statuses = Status::whereIn('status_name', [
            'معلق',
            'تم أستلام الطلب',
            'جارى التوصيل',
            'تم التسليم'
        ])->get();
        $cities = Shipping::all();
        $paidStatuses = Status::whereIn('status_name', ['تم الدفع', 'غير مدفوع'])->get();
        $cities = Shipping::all();
        $orders = Order::whereHas('orderDetails',function($query) {
            return $query->where('seller_id', Auth::user()->id);
        })->with('orderDetails')->latest();
        if($request->code !== null) {
            $orders = $orders->where('code', 'like', '%'. $request->code .'%');
        }
        if($request->status_name !== null) {
            $orders =  $orders->whereHas('orderDetails', function($query) use($request) {
                $query->where('delivery_status', $request->status_name);
            });
        }
        if($request->city !== null) {
            $orders = $orders->where('city_id', $request->city);
        }
        if($request->customer !== null) {
            $orders = $orders->where('name', 'like', '%'. $request->customer .'%');
        }
        if($request->from && $request->to) {
            $orders = $orders->whereBetween('created_at', [$request->from, $request->to]);
        }
        $orders = $orders->paginate(15);
        foreach ($orders as $order) {
            foreach ($order->orderDetails as $orderDetail) {
                $order = \App\Order::find($orderDetail->order_id);
                $order->viewed = 1;
                $order->save();
            }
        }

        return view('frontend.user.seller.orders', compact('orders','paidStatuses','statuses','cities'));
    }

    // All Orders
    public function all_orders(Request $request)
    {
        $this->authorize('3');
        $payments_permessions_ids =  array_map(function($obj) {
            if(str_starts_with($obj, 'p-')) {
                return explode('-', $obj)[1];
            }
        }, json_decode(Auth::user()->staff->role->permissions));
        $statuses_permessions_ids =  array_map(function($obj) {
            if(str_starts_with($obj, 's-')) {
                return explode('-', $obj)[1];
            }
        }, json_decode(Auth::user()->staff->role->permissions));
        //  CoreComponentRepository::instantiateShopRepository();
         $statuses = Status::whereNotIn('status_name', ['تم رد المنتج', 'تم التجهيز'])
         ->whereIn('id', $statuses_permessions_ids)->latest()->get();
         $sellerStatuses = Status::where('status_name', 'تم التجهيز')
         ->whereIn('id', $statuses_permessions_ids)->latest()->get();
         $adminStatuses = Status::whereIn('status_name', ['تم التحصيل', 'تم رد المنتج'])->latest()->get();
        if(Auth::user()->staff->role->name == 'shipping') {
            $orders =  Order::whereHas('orderDetails', function($query) {
                $query->where('delivery_id', Auth::user()->id);
            })->latest();
            $cities =  Shipping::whereIn('id', Order::whereHas('orderDetails', function($query) {
                $query->where('delivery_id', Auth::user()->id);
            })->pluck('city_id'))->get();
            if($request->delivery_status !== null) {
                $orders =  Order::whereHas('orderDetails', function($query) use($request) {
                    $query->where('delivery_id', Auth::user()->id);
                    $query->where('delivery_status', $request->delivery_status);
                })->latest();
            }
        } else {
            $cities = Shipping::all();
            $orders = Order::with('orderDetails')->latest();
            if($request->delivery_status !== null) {
                $orders =  Order::whereHas('orderDetails', function($query) use($request) {
                    $query->where('delivery_status', $request->delivery_status);
                })->latest();
            }
            if($request->admin_status !== null) {
                if($request->admin_status == '1') {
                    $orders =  Order::whereHas('orderDetails', function($query) use($request) {
                        $query->where('payment_status', 1);
                    })->latest();
                } else {
                    $orders =  Order::whereHas('orderDetails', function($query) use($request) {
                        $query->where('admin_status', $request->admin_status);
                    })->latest();
                }
            }
        }
        if($request->code !== null) {
            $orders = $orders->where('code', 'like', '%'. $request->code .'%');
        }
        if($request->city !== null) {
            $orders = $orders->where('city_id', $request->city);
        }
        if($request->customer !== null) {
            $user = User::where('name', 'like', '%'. $request->customer . '%')->first();
            if($user) {
                $orders = $orders->where('user_id', $user->id);
            } else {
                $orders = $orders->where('name', 'like', '%'. $request->customer .'%');
            }
        }
        if($request->seller !== null) {
            $user = User::where('name', 'like', '%'. $request->seller . '%')->first();
            $orders =  Order::whereHas('orderDetails', function($query) use($user) {
                $query->where('seller_id', $user->id);
            })->latest();
        }
        $orders = $orders->paginate(15);
        return view('backend.sales.all_orders.index', compact(
            'orders', 'cities', 'sellerStatuses','adminStatuses', 'statuses','statuses_permessions_ids', 'payments_permessions_ids'));
    }

    public function updateOrderStatus($order_id) {
        $orderDetail = OrderDetail::find($order_id);
        $currentLang = Language::where('code', Session::get('locale'))->first();
        $vendor_commission = BusinessSetting::where('type', 'vendor_commission')->first();
        $array = [
            'view' => 'emails.order-status',
            'from' => env('MAIL_DEFAULT'),
            'order' => $orderDetail->order,
            'lang' => $currentLang,
        ];
        if(request('seller_status')) {
            $distribution = Distribution::where('city_id', $orderDetail->order->city_id)->first();
            $status = Status::where('status_name', request('seller_status'))->first();
            if($status && $distribution) {
                $array['status'] = request('seller_status');
                $orderDetail->update([
                    'seller_status' => request('seller_status'),
                    'seller_reason' => request('seller_reason'),
                    'delivery_id' => $distribution->user_id,
                ]);
                if(request('seller_status') == 'تم التجهيز') {
                    if($orderDetail->delivery->email) {
                        Mail::to($orderDetail->delivery->email)->send(new OrderStatus($array));
                    }
                }
                flash(translate('Order has been updated successfully'))->success();
                return redirect()->back();
            }
        }
        if(request('admin_status')) {
            $status = Status::where('status_name', request('admin_status'))->first();
            $orderHistory = OrdersStatusHistory::where('status_id', $status->id)->where('order_id', $orderDetail->id)->first();
            if(!$orderHistory) {
                if(request('admin_status') == 'تم رد المنتج') {
                    if($orderDetail->refundable == 1) {
                        $orderDetail->admin_status = request('admin_status');
                        $orderDetail->admin_reason = request('admin_reason');
                        $ClubPoint=ClubPoint::where('order_id',$orderDetail->refund_request->order_id)->first();
                        if($ClubPoint) {
                            $clup_detil=ClubPointDetail::where(['club_point_id'=>$ClubPoint['id'],'product_id'=>$orderDetail['product_id']])->first();
                            if($clup_detil) {
                                $clup_detil->refund_status=1;
                                $clup_detil->save();
                                $ClubPoint->points -=$clup_detil['point'];
                                $ClubPoint->save();
                            }
                        }
                        $product=Product::find($orderDetail['product_id']);
                        if($orderDetail['variation'] != null){
                            $product_stock = $product->stocks->where('variant', $orderDetail['variation'])->first();
                            $product_stock->qty += $orderDetail['quantity'];
                            $product_stock->save();
                        }
                        else {
                            $product->current_stock += $orderDetail['quantity'];
                            $product_stock = $product->stocks->where('variant', null)->first();
                            $product_stock->qty += $orderDetail['quantity'];
                            $product_stock->save();
                            $product->save();
                        }
                        $orderDetail->refund_request->shipping_has_product = 0;
                        $orderDetail->refund_request->save();
                        $orderDetail->save();
                        OrdersStatusHistory::create([
                            'status_id' => $status->id,
                            'order_id' => $orderDetail->id,
                            'notes' => request('admin_reason')
                        ]);
                        flash(translate('status changed successfully!'))->success();
                        return redirect()->back();
                    } else {
                        flash(translate('Order Should Be Refundable first'))->error();
                        return redirect()->back();
                    }
                } else {
                    if($orderDetail->delivery_status == 'تم التسليم') {
                        if(request('admin_status') == 'تم التحصيل') {
                            $affiliateOption = AffiliateOption::where('status', 1)->first();
                            $delivery = User::find($orderDetail->delivery_id);
                            $purePrice = $orderDetail->price;
                            $commission = 0;
                            if($orderDetail->user->seller->commission_type) {
                                if($orderDetail->user->seller->commission_type == 'percent') {
                                    if($orderDetail->unit->id == 1) {
                                        $commission = (( $orderDetail->price * $orderDetail->user->seller->unit_commission) / 100);
                                    } else {
                                        $commission = (( $orderDetail->price * $orderDetail->user->seller->wholesale_commission) / 100);
                                    }
                                } else {
                                    if($orderDetail->unit->id == 1) {
                                        $commission =  $orderDetail->user->seller->unit_commission;
                                    } else {
                                        $commission =  $orderDetail->user->seller->wholesale_commission;
                                    }
                                }
                            } else {
                                $commission = (($orderDetail->price * $vendor_commission->value) / 100);
                            }
                            $commission = $commission * $orderDetail->quantity;
                            $affiliateCommission = 0;
                            // If The order got with user
                            if($orderDetail->order->user) {
                                // If The user of order is affiliiate
                                if($orderDetail->order->user->affiliate_user) {
                                    // خضم بالعمولة على كل صنف
                                    if($affiliateOption->type == 'category_wise_affiliate') {
                                        foreach (json_decode($affiliateOption->details) as $affiliateDetail) {
                                            if($orderDetail->product->category->id == $affiliateDetail->category_id) {
                                                if($affiliateDetail->commission_type == 'amount') {
                                                    $affiliateCommission = $affiliateDetail->commission;
                                                } else {
                                                    $affiliateCommission = (($orderDetail->price * $affiliateDetail->commission) / 100);
                                                }
                                                $affiliateCommission = $affiliateCommission * $orderDetail->quantity;
                                                if($orderDetail->order->user->balance < 0) {
                                                    if(($orderDetail->order->user->balance + $affiliateCommission) > 0) {
                                                        orders_should_payments::create([
                                                            'user_id' => $orderDetail->order->user->id,
                                                            'order_id' => $orderDetail->id,
                                                            'amount' => $orderDetail->order->user->balance + $affiliateCommission
                                                        ]);
                                                        Wallet::create([
                                                            'user_id' => $orderDetail->order->user->id,
                                                            'amount' => $orderDetail->order->user->balance + $affiliateCommission,
                                                            'payment_details' => $orderDetail->order->code
                                                        ]);
                                                    }
                                                } else {
                                                    orders_should_payments::create([
                                                        'user_id' => $orderDetail->order->user->id,
                                                        'order_id' => $orderDetail->id,
                                                        'amount' => $affiliateCommission
                                                    ]);
                                                    Wallet::create([
                                                        'user_id' => $orderDetail->order->user->id,
                                                        'amount' => $affiliateCommission,
                                                        'payment_details' => $orderDetail->order->code
                                                    ]);
                                                }
                                                $orderDetail->order->user->balance += $affiliateCommission;
                                                $orderDetail->order->user->save();
                                            }
                                        }
                                    }
                                }

                            }
                            $purePrice -=  $commission;
                            $purePrice -=  $affiliateCommission;
                            if(Auth::user()->user_type == 'admin') {
                                $admin = Auth::user();
                            } else {
                                $admin = User::where('user_type', 'admin')->first();
                            }
                            $admin->balance += $commission;
                            $orderDetail->user->balance += $purePrice;
                            if($orderDetail->user->seller->admin_to_pay < 0) {
                                if(($orderDetail->user->seller->admin_to_pay + $purePrice) > 0) {
                                    orders_should_payments::create([
                                        'seller_id' => $orderDetail->user->seller->id,
                                        'order_id' => $orderDetail->id,
                                        'amount' => $orderDetail->user->seller->admin_to_pay + $purePrice
                                    ]);
                                    Wallet::create([
                                        'user_id' => $orderDetail->seller_id,
                                        'amount' => $orderDetail->user->seller->admin_to_pay + $purePrice,
                                        'payment_details' => $orderDetail->order->code
                                    ]);
                                }
                            } else {
                                orders_should_payments::create([
                                    'seller_id' => $orderDetail->user->seller->id,
                                    'order_id' => $orderDetail->id,
                                    'amount' => $purePrice
                                ]);
                                Wallet::create([
                                    'user_id' => $orderDetail->seller_id,
                                    'amount' => $purePrice,
                                    'payment_details' => $orderDetail->order->code
                                ]);
                            }
                            wallet_history::create([
                                'user_id' => $admin->id,
                                'order_id' => $orderDetail->id,
                                'amount' => $commission
                            ]);
                            $orderDetail->user->seller->admin_to_pay += $purePrice;
                            $admin->save();
                            $delivery->balance -= $orderDetail->price;
                            $delivery->save();
                            $orderDetail->user->save();
                            $orderDetail->user->seller->save();
                        }
                        $orderDetail->update([
                            'admin_status' => request('admin_status'),
                            'admin_reason' => request('admin_reason')
                        ]);
                        OrdersStatusHistory::create([
                            'status_id' => $status->id,
                            'order_id' => $orderDetail->id,
                            'notes' => request('admin_reason')
                        ]);
                        flash(translate('Order has been updated successfully'))->success();
                        return redirect()->back();
                    } else {
                        flash(translate('the delivery should receive the price first'))->error();
                        return redirect()->back();
                    }
                }
            } else {
                flash(translate('you choosed this status before'))->error();
                return redirect()->back();
            }
        }
        if(request('delivery_status')) {
            $status = Status::where('status_name', request('delivery_status'))->first();
            $distribution = Distribution::where('city_id', $orderDetail->order->city_id)->first();
            if($status) {
                $array['status'] = request('delivery_status');
                $orderHistory = OrdersStatusHistory::where('status_id', $status->id)->where('order_id', $orderDetail->id)->first();
                if($orderDetail->seller_status == 'تم التجهيز') {
                    if(!$orderHistory) {
                        if(Auth::user()->staff->role->name == 'shipping') {
                            $delivery = Auth::user();
                        } else {
                            $delivery = $orderDetail->delivery;
                        }
                        if(request('delivery_status') == 'تم التسليم') {
                            $delivery->balance += $orderDetail->price;
                        }
                        if(request('delivery_status') == 'تم الأسترجاع بنجاح') {
                            if($orderDetail->refundable == 1) {
                                $orderDetail->refund_request->shipping_has_product = 1;
                                $orderDetail->refund_request->save();
                            } else {
                                flash(translate('Order Should Be Refundable first'))->error();
                                return redirect()->back();
                            }
                        }
                        $delivery->save();
                        $orderDetail->update([
                            'delivery_status' => request('delivery_status'),
                            'delivery_reason' => request('delivery_reason')
                        ]);
                        if($orderDetail->order->user) {
                            Mail::to($orderDetail->order->user->email)->send(new OrderStatus($array));
                        } else {
                            Mail::to($orderDetail->order->email)->send(new OrderStatus($array));
                        }
                        OrdersStatusHistory::create([
                            'status_id' => $status->id,
                            'order_id' => $orderDetail->id,
                            'notes' => request('delivery_reason')
                        ]);
                        flash(translate('Order has been updated successfully'))->success();
                        return redirect()->back();
                    } else {
                        flash(translate('you choosed this status before'))->error();
                        return redirect()->back();
                    }
                } else {
                    flash(translate("you can't change delivery status before the seller status changed"))->error();
                        return redirect()->back();
                }
            } else {
                return redirect()->back();
            }
        }
    }

    public function all_orders_show($id)
    {
         $order = Order::findOrFail(decrypt($id));
         return view('backend.sales.all_orders.show', compact('order'));
    }

    // Inhouse Orders
    public function admin_orders(Request $request)
    {
        $this->authorize('4');
        // CoreComponentRepository::instantiateShopRepository();
        $paidStatuses = Status::where('payment_status', 1)->get();
        $statuses = Status::where('payment_status', 0)->get();
        $payment_status = null;
        $delivery_status = null;
        $sort_search = null;
        $admin_user_id = User::where('user_type', 'admin')->first()->id;
        $orders = DB::table('orders')
                    ->orderBy('orders.created_at', 'desc')
                    ->join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->where('order_details.seller_id', $admin_user_id)
                    ->select('orders.id')
                    ->distinct();
        if ($request->payment_type != null){
            $orders = $orders->where('order_details.payment_status', $request->payment_type);
            $payment_status = $request->payment_type;
        }
        if ($request->delivery_status != null) {
            $orders = $orders->where('order_details.delivery_status', $request->delivery_status);
            $delivery_status = $request->delivery_status;
        }
        if ($request->has('search')){
            $sort_search = $request->search;
            $orders = $orders->where('code', 'like', '%'.$sort_search.'%');
        }
        $orders = $orders->paginate(15);
        return view('backend.sales.inhouse_orders.index',
        compact('orders','statuses','paidStatuses','payment_status','delivery_status', 'sort_search', 'admin_user_id'));
    }

    public function show($id)
    {
        $order = Order::findOrFail(decrypt($id));
        $order->viewed = 1;
        $order->save();
        return view('backend.sales.inhouse_orders.show', compact('order'));
    }

    // Seller Orders
    public function seller_orders(Request $request)
    {
        $this->authorize('5');
        // CoreComponentRepository::instantiateShopRepository();

        $payment_status = null;
        $delivery_status = null;
        $sort_search = null;
        $admin_user_id = User::where('user_type', 'admin')->first()->id;
        $orders = DB::table('orders')
                    ->orderBy('code', 'desc')
                    ->join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->where('order_details.seller_id', '!=' ,$admin_user_id)
                    ->select('orders.id')
                    ->distinct();

        if ($request->payment_type != null){
            $orders = $orders->where('order_details.payment_status', $request->payment_type);
            $payment_status = $request->payment_type;
        }
        if ($request->delivery_status != null) {
            $orders = $orders->where('order_details.delivery_status', $request->delivery_status);
            $delivery_status = $request->delivery_status;
        }
        if ($request->has('search')){
            $sort_search = $request->search;
            $orders = $orders->where('code', 'like', '%'.$sort_search.'%');
        }
        $orders = $orders->paginate(15);
        return view('backend.sales.seller_orders.index', compact('orders','payment_status','delivery_status', 'sort_search', 'admin_user_id'));
    }

    public function seller_orders_show($id)
    {
        $order = Order::findOrFail(decrypt($id));
        $order->viewed = 1;
        $order->save();
        return view('backend.sales.seller_orders.show', compact('order'));
    }


    // Pickup point orders
    public function pickup_point_order_index(Request $request)
    {
        return $request->all();
        // $orders =  Order::whereHas('orderDetails', function($query) {
        //     return $query->where('seller_status', 'تم التجهيز');
        // })->get();
        // $status = Status::where('default_status', 1)->first();
        // foreach ($orders as $order) {
        //     $distribution = Distribution::where('city_id', $order->city_id)->first();
        //     if($distribution) {
        //         foreach ($order->orderDetails as $orderDetail) {
        //             $orderDetail->update([
        //                 'pickup_point_id' => $distribution->user->staff->id
        //             ]);
        //         }
        //     }
        // }
        // PickupPoint::create([
        //     'staff_id' =>  $distribution->user->staff->id,
        //     'name' => json_decode($order->shipping_address)->name,
        //     'address' => json_decode($order->shipping_address)->address,
        //     'phone' => json_decode($order->shipping_address)->phone,
        //     'pick_up_status_id' => $status->id
        // ]);
        // if (Auth::user()->user_type == 'staff') {
        //     $pickups = PickupPoint::where('user_id', Auth::user()->id)->paginate(15);
        //     $orders = DB::table('orders')
        //                 ->orderBy('code', 'desc')
        //                 ->join('order_details', 'orders.id', '=', 'order_details.order_id')
        //                 ->where('order_details.pickup_point_id', Auth::user()->staff->id)
        //                 ->distinct()
        //                 ->paginate(15);
        //     return view('backend.sales.pickup_point_orders.index', compact('pickups', 'orders'));
        // }
        // else{
        //     //$orders = Order::where('shipping_type', 'Pick-up Point')->get();
        //     $orders = DB::table('orders')
        //                 ->orderBy('code', 'desc')
        //                 ->join('order_details', 'orders.id', '=', 'order_details.order_id')
        //                 ->where('order_details.shipping_type', 'pickup_point')
        //                 ->select('orders.id')
        //                 ->distinct()
        //                 ->paginate(15);

        //     return view('backend.sales.pickup_point_orders.index', compact('orders'));
        // }
    }

    public function pickup_point_order_sales_show($id)
    {
        if (Auth::user()->user_type == 'staff') {
            $order = Order::findOrFail(decrypt($id));
            return view('backend.sales.pickup_point_orders.show', compact('order'));
        }
        else{
            $order = Order::findOrFail(decrypt($id));
            return view('backend.sales.pickup_point_orders.show', compact('order'));
        }
    }

    /**
     * Display a single sale to admin.
     *
     * @return \Illuminate\Http\Response
     */


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $order = new Order;
        $shipping_info = $request->session()->get('shipping_info');
        if(Auth::check()){
            $order->user_id = Auth::user()->id;
        } else {
            foreach (Session::get('cart') as $cart) {
                if($cart['product_referral_code'] !== null) {
                    $user =  User::where('referral_code', $cart['product_referral_code'])->first();
                    if($user) {
                        $order->user_id = $user->id;
                    }
                }
            }
        }

        $order->city_id = $shipping_info['city_id'];
        $order->name = $shipping_info['name'];
        if(array_key_exists('email', $shipping_info)) {
            $order->email = $shipping_info['email'];
        }
        $order->address = $shipping_info['address'];
        $order->zone = $shipping_info['zone'];
        $order->phone = $shipping_info['phone'];
        $shippingModel = Shipping::where('city', 'like', '%' . $shipping_info['city'] .'%')->first();

        $order->shipping = $shippingModel->cost;
        $order->shipping_commission = $shipping_info['shipping_commission'];
        $order->payment_type = $request->payment_option;
        $order->delivery_viewed = '0';
        $order->payment_status_viewed = '0';
        $order->code = date('Ymd-His').rand(10,99);
        $order->date = strtotime('now');
        if($order->save()){
            $subtotal = 0;
            $tax = 0;
            $shipping = 0;

            //calculate shipping is to get shipping costs of different types
            $admin_products = array();
            $seller_products = array();
            //Order Details Storing
            if(Session::has('owner_id')) {
                $cart = Session::get('cart')->where('owner_id', Session::get('owner_id'));
            } else {
                $cart = Session::get('cart');
            }
            foreach ($cart as $key => $cartItem){
                $product = Product::find($cartItem['id']);
                if($product->added_by == 'admin'){
                    array_push($admin_products, $cartItem['id']);
                }
                else{
                    $product_ids = array();
                    if(array_key_exists($product->user_id, $seller_products)){
                        $product_ids = $seller_products[$product->user_id];
                    }
                    array_push($product_ids, $cartItem['id']);
                    $seller_products[$product->user_id] = $product_ids;
                }

                $subtotal += $cartItem['price']*$cartItem['quantity'];
                $tax += $cartItem['tax']*$cartItem['quantity'];

                $product_variation = $cartItem['variant'];

                if($product_variation != null){
                    $product_stock = $product->stocks->where('variant', $product_variation)->first();
                    $product_stock->qty -= $cartItem['quantity'];
                    $product_stock->save();
                }
                else {
                    $product->current_stock -= $cartItem['quantity'];
                    $product->save();
                    $product_stock = $product->stocks->where('variant', null)->first();
                    $product_stock->qty -= $cartItem['quantity'];
                    $product_stock->save();
                }

                $order_detail = new OrderDetail;
                $order_detail->order_id  =$order->id;
                $order_detail->seller_id = $product->user_id;
                $order_detail->product_id = $product->id;
                $order_detail->variation = $product_variation;
                if($cartItem['sizes']) {
                    $order_detail->sizes = json_encode($cartItem['sizes']);
                }
                $order_detail->unit_id = $cartItem['unit_id'];
                $order_detail->price = $cartItem['price'] * $cartItem['quantity'];
                $order_detail->tax = $cartItem['tax'] * $cartItem['quantity'];
                $order_detail->product_referral_code = $cartItem['product_referral_code'];

                $order_detail->quantity = $cartItem['quantity'];
                $order_detail->date = strtotime('now');
                $order_detail->save();

                $product->num_of_sale++;
                $product->save();
            }

            $order->grand_total = $subtotal + $tax + $shipping + $shippingModel->cost + $shipping_info['shipping_commission'];

            if(Session::has('coupon_discount')){
                $order->grand_total -= Session::get('coupon_discount');
                $order->coupon_discount = Session::get('coupon_discount');

                $coupon_usage = new CouponUsage;
                $coupon_usage->user_id = Auth::user()->id;
                $coupon_usage->coupon_id = Session::get('coupon_id');
                $coupon_usage->save();
            }

            $order->save();

            $array['view'] = 'emails.invoice';
            $array['subject'] = 'Your order has been placed - '.$order->code;
            $array['from'] = env('MAIL_DEFAULT');
            $array['order'] = $order;
            foreach($seller_products as $key => $seller_product){
                try {
                    Mail::to(\App\User::find($key)->email)->send(new InvoiceEmailManager($array));
                } catch (\Exception $e) {

                }
            }

            if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated && \App\OtpConfiguration::where('type', 'otp_for_order')->first()->value){
                try {
                    $otpController = new OTPVerificationController;
                    $otpController->send_order_code($order);
                } catch (\Exception $e) {

                }
            }

            //sends email to customer with the invoice pdf attached
            if(env('MAIL_USERNAME') != null){
                if(array_key_exists('email', $request->session()->get('shipping_info'))) {
                    Mail::to($request->session()->get('shipping_info')['email'])->send(new InvoiceEmailManager($array));
                }
                Mail::to(User::where('user_type', 'admin')->first()->email)->send(new InvoiceEmailManager($array));
            }

            $request->session()->put('order_id', $order->id);
        }
    }
    public function distrubtion_of_orders() {
        $this->authorize('distribution');
        $staffs = Staff::whereHas('role', function ($query) {
            return $query->where('name', 'shipping');
        })->get();
        $countries = Country::whereHas('cities', function($query) {
            return $query;
        })->with('cities')->get();
        $cities = Shipping::paginate(15);
        if(request('country')) {
            $cities = Shipping::where('country_id', request('country'))->paginate(15);
        }
        if(request('country') && request('city')) {
            $cities = Shipping::where('country_id', request('country'))
            ->where('city', 'like', '%' . request('city') .'%')->paginate(15);
        }
        return view('backend.sales.distribution_of_orders.edit', compact('staffs', 'countries', 'cities'));
    }

    public function store_distrubtion_of_orders() {
        if(request('city_id') && request('user_id')) {
            $distribution = Distribution::
            where('city_id', request('city_id'))
            ->first();
            if($distribution) {
                $distribution->update([
                    'user_id' => request('user_id')
                ]);
                flash(translate('Distribution has been updated successfully'))->info();
                return redirect()->back();
            } else {
                Distribution::create([
                    'city_id' => request('city_id'),
                    'user_id' => request('user_id'),
                ]);
                flash(translate('Distribution has been added successfully'))->success();
                return redirect()->back();
            }
        } else {
            return redirect()->back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order = Order::findOrFail($id);
        if($order != null){
            foreach($order->orderDetails as $key => $orderDetail){
                if ($orderDetail->variantion != null) {
                    $product_stock = ProductStock::where('product_id', $orderDetail->product_id)->where('variant', $orderDetail->variantion)->first();
                    if($product_stock != null){
                        $product_stock->qty += $orderDetail->quantity;
                        $product_stock->save();
                    }
                }
                else {
                    $product = $orderDetail->product;
                    $product->current_stock += $orderDetail->quantity;
                    $product->save();
                }
                $orderDetail->delete();
            }
            $order->delete();
            flash(translate('Order has been deleted successfully'))->success();
        }
        else{
            flash(translate('Something went wrong'))->error();
        }
        return back();
    }

    public function order_details(Request $request)
    {
        $order = Order::findOrFail($request->order_id);
        //$order->viewed = 1;
        $order->save();
        return view('frontend.user.seller.order_details_seller', compact('order'));
    }

    public function update_delivery_status(Request $request)
    {
        $order = Order::findOrFail($request->order_id);
        $order->delivery_viewed = '0';
        $order->save();
        if(Auth::user()->user_type == 'seller'){
            foreach($order->orderDetails->where('seller_id', Auth::user()->id) as $key => $orderDetail){
                $orderDetail->delivery_status = $request->status;
                $orderDetail->save();
            }
        }
        else{
            foreach($order->orderDetails as $key => $orderDetail){
                $orderDetail->delivery_status = $request->status;
                $orderDetail->save();
            }
        }

        if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated && \App\OtpConfiguration::where('type', 'otp_for_delivery_status')->first()->value){
            try {
                $otpController = new OTPVerificationController;
                $otpController->send_delivery_status($order);
            } catch (\Exception $e) {
            }
        }

        return 1;
    }

    public function update_payment_status(Request $request)
    {
        $order = Order::findOrFail($request->order_id);
        $order->payment_status_viewed = '0';
        $order->save();

        if(Auth::user()->user_type == 'seller'){
            foreach($order->orderDetails->where('seller_id', Auth::user()->id) as $key => $orderDetail){
                $orderDetail->payment_status = $request->status;
                $orderDetail->save();
            }
        }
        else{
            foreach($order->orderDetails as $key => $orderDetail){
                $orderDetail->payment_status = $request->status;
                $orderDetail->save();
            }
        }

        $status = 'paid';
        foreach($order->orderDetails as $key => $orderDetail){
            if($orderDetail->payment_status != 'paid'){
                $status = 'unpaid';
            }
        }
        $order->payment_status = $status;
        $order->save();


        if($order->payment_status == 'paid' && $order->commission_calculated == 0){
            if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() == null || !\App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
                if ($order->payment_type == 'cash_on_delivery') {
                    if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
                        $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
                        foreach ($order->orderDetails as $key => $orderDetail) {
                            $orderDetail->payment_status = 'paid';
                            $orderDetail->save();
                            if($orderDetail->product->user->user_type == 'seller'){
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay - ($orderDetail->price*$commission_percentage)/100;
                                $seller->save();
                            }
                        }
                    }
                    else{
                        foreach ($order->orderDetails as $key => $orderDetail) {
                            $orderDetail->payment_status = 'paid';
                            $orderDetail->save();
                            if($orderDetail->product->user->user_type == 'seller'){
                                $commission_percentage = $orderDetail->product->category->commision_rate;
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay - ($orderDetail->price*$commission_percentage)/100;
                                $seller->save();
                            }
                        }
                    }
                }
                elseif($order->manual_payment) {
                    if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
                        $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
                        foreach ($order->orderDetails as $key => $orderDetail) {
                            $orderDetail->payment_status = 'paid';
                            $orderDetail->save();
                            if($orderDetail->product->user->user_type == 'seller'){
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100;
                                $seller->save();
                            }
                        }
                    }
                    else{
                        foreach ($order->orderDetails as $key => $orderDetail) {
                            $orderDetail->payment_status = 'paid';
                            $orderDetail->save();
                            if($orderDetail->product->user->user_type == 'seller'){
                                $commission_percentage = $orderDetail->product->category->commision_rate;
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100;
                                $seller->save();
                            }
                        }
                    }
                }
            }

            if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
                $affiliateController = new AffiliateController;
                $affiliateController->processAffiliatePoints($order);
            }

            if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
                $clubpointController = new ClubPointController;
                $clubpointController->processClubPoints($order);
            }

            $order->commission_calculated = 1;
            $order->save();
        }

        if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated && \App\OtpConfiguration::where('type', 'otp_for_paid_status')->first()->value){
            try {
                $otpController = new OTPVerificationController;
                $otpController->send_payment_status($order);
            } catch (\Exception $e) {
            }
        }
        return 1;
    }
}
