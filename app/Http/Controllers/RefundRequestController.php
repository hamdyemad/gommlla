<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BusinessSetting;
use App\RefundRequest;
use App\OrderDetail;
use App\Seller;
use App\Wallet;
use App\User;
use Auth;
use App\ClubPoint;
use App\ClubPointDetail;
use App\orders_should_payments;
use App\ProductStock;
use App\Product;
use App\wallet_history;
use Illuminate\Support\Facades\DB;

class RefundRequestController extends Controller
{
    /**
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    //Store Customer Refund Request
    public function request_store(Request $request, $id)
    {
        $order_detail = OrderDetail::select(['*', DB::raw('DATEDIFF(now(), created_at) as refund_days')])
        ->where('id', $id)
        ->where(DB::raw('DATEDIFF(now(), created_at)'), '<', get_setting('refund_request_time'))
        ->first();
        if($order_detail) {
            $refundFinded = RefundRequest::where('order_detail_id', $order_detail->id)->first();
            if($refundFinded) {
                flash(translate("you already make the refund for this order"))->error();
                return back();
            } else {
                $refund = new RefundRequest;
                $refund->user_id = $order_detail->order->user->id;
                $refund->order_id = $order_detail->order_id;
                $refund->order_detail_id = $order_detail->id;
                $refund->seller_id = $order_detail->seller_id;
                $refund->reason = $request->reason;
                $refund->admin_approval = 0;
                $refund->admin_seen = 0;
                $refund->refund_amount = $order_detail->price;
                $refund->refund_status = 0;
                if ($refund->save()) {
                    flash( translate("Refund Request has been sent successfully") )->success();
                    return redirect()->back();
                }
                else {
                    flash( translate("Something went wrong") )->error();
                    return back();
                }
            }
        } else {
            flash(translate("limited specified time: ") . ' ' . get_setting('refund_request_time') . ' ' . translate('days'))->error();
            return back();
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function vendor_index()
    {
        if(Auth::user()->user_type == 'seller') {
            $current_auth = 'seller_id';
        } else {
            $current_auth = 'user_id';
        }
        $refunds = RefundRequest::where($current_auth, Auth::user()->id)->latest()->paginate(10);
        return view('refund_request.frontend.recieved_refund_request.index', compact('refunds'));

    }

    //Set the Refund configuration
    public function refund_config()
    {
        $this->authorize('7');
        return view('refund_request.config');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function refund_time_update(Request $request)
    {
        $business_settings = BusinessSetting::where('type', $request->type)->first();
        if ($business_settings != null) {
            $business_settings->value = $request->value;
            $business_settings->save();
        }
        else {
            $business_settings = new BusinessSetting;
            $business_settings->type = $request->type;
            $business_settings->value = $request->value;
            $business_settings->save();
        }
        flash( translate("Refund Request sending time has been updated successfully") )->success();
        return back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function refund_sticker_update(Request $request)
    {
        $business_settings = BusinessSetting::where('type', $request->type)->first();
        if ($business_settings != null) {
            $business_settings->value = $request->logo;
            $business_settings->save();
        }
        else {
            $business_settings = new BusinessSetting;
            $business_settings->type = $request->type;
            $business_settings->value = $request->logo;
            $business_settings->save();
        }
        flash( translate("Refund Sticker has been updated successfully"))->success();
        return back();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function admin_index()
    {
        $this->authorize('7');
        $refunds = RefundRequest::where('refund_status', 0)->latest()->paginate(15);
        return view('refund_request.index', compact('refunds'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function paid_index()
    {
        $this->authorize('7');
        $refunds = RefundRequest::where('refund_status', 1)->latest()->paginate(15);
        return view('refund_request.paid_refund', compact('refunds'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function request_approval_vendor(Request $request)
    {
        $refund = RefundRequest::findOrFail($request->el);
        if($refund) {
            $orderDetail = OrderDetail::find($refund->order_detail_id);
            if($orderDetail) {
                $orderDetail->refundable = 1;
                $orderDetail->save();
                $refund->admin_approval = 1;
            }
        }
        if ($refund->save()) {
            return 1;
        }
        else {
            return 0;
        }
    }

    /**
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function refund_pay(Request $request)
    {
        $refund = RefundRequest::findOrFail($request->el);
        if($refund) {
            $admin_wallet_of_order = wallet_history::where('order_id', $refund->order_detail_id)->first();
            $order_should_pay_for_seller = orders_should_payments::where('seller_id', $refund->orderDetail->user->seller->id)
            ->where('order_id', $refund->orderDetail->id)
            ->first();
            if($order_should_pay_for_seller) {
                $admin = User::where('user_type', 'admin')->first();
                $seller = Seller::where('user_id', $refund->seller_id)->first();
                $order_should_pay_for_seller->refund = 1;
                $refund->orderDetail->delivery_status = 'معلق';
                $refund->orderDetail->admin_status = 'معلق';
                $refund->orderDetail->refundable = 1;
                $admin_commission =  $admin_wallet_of_order->amount;
                $seller->admin_to_pay -= $order_should_pay_for_seller->amount;
                $seller->user->balance -= $order_should_pay_for_seller->amount;
                $admin->balance -= $admin_commission;
                $customer = $order_should_pay_for_seller->order_detail->order->user;
                if($customer) {
                    $customer->balance += $order_should_pay_for_seller->order_detail->price;
                    $wallet_for_customer = new Wallet;
                    $wallet_for_customer->user_id = $customer->id;
                    $wallet_for_customer->amount = $order_should_pay_for_seller->order_detail->price;
                    $wallet_for_customer->payment_method = 'Refund';
                    $wallet_for_customer->payment_details = 'Product Money Refund From Order: (' . $refund->orderDetail->order->code . ')';
                    $customer->save();
                    $wallet_for_customer->save();
                }
                $admin_wallet_of_order->refund = 1;
                $wallet = new Wallet;
                $wallet->user_id = $refund->seller_id;
                $wallet->amount = $order_should_pay_for_seller->amount;
                $wallet->payment_method = 'Refund';
                $wallet->payment_details = 'Product Money Refund From Order: (' . $refund->orderDetail->order->code . ')';
                $refund->orderDetail->save();
                $order_should_pay_for_seller->save();
                $admin_wallet_of_order->save();
                $admin->save();
                $seller->save();
                $seller->user->save();
                $wallet->save();
                if (Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff') {
                    $refund->admin_approval = 1;
                    $refund->refund_status = 1;
                    $refund->admin_seen = 1;
                    $refund->employ_id=auth()->user()['id'];
                }
                if ($refund->save()) {
                    return 1;
                }
                else {
                    return 0;
                }
            } else {
                return 0;
            }

        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function refund_request_send_page($id)
    {
        $order_detail = OrderDetail::findOrFail($id);
        if ($order_detail->product != null && $order_detail->product->refundable == 1) {
            return view('refund_request.create', compact('order_detail'));
        }
        else {
            return back();
        }
    }
    public function user_refund_request_send_page($id)
    {
        $order_detail = OrderDetail::findOrFail($id);
        $order_payment = orders_should_payments::where('order_id', $id)->first();
        if ($order_detail->product != null && $order_detail->product->refundable == 1) {
            return view('refund_request.frontend.refund_request.create', compact('order_detail', 'order_payment'));
        }
        else {
            return back();
        }
    }
    public function admin_refund_request(Request $request)
    {
         $order_detail = OrderDetail::where('id', $request['el'])->first();
        if ($order_detail->product != null && $order_detail->product->refundable == 1) {
            $refund = new RefundRequest;
        $refund->user_id =$order_detail->order['user_id'] ;
        $refund->guest_id =$order_detail->order['guest_id'] ;
        $refund->order_id = $order_detail->order_id;
        $refund->order_detail_id = $order_detail->id;
        $refund->seller_id = $order_detail->seller_id;
        $refund->seller_approval = 0;
        $refund->employ_id =Auth::user()->id ;
        $refund->admin_approval = 1;
        $refund->admin_seen = 0;
        $refund->refund_amount = $order_detail->price + $order_detail->tax;
        $refund->refund_status = 1;
        if ($refund->save()) {
            $ClubPoint=ClubPoint::where('order_id',$order_detail->order_id)->first();

            $clup_detil=ClubPointDetail::where(['club_point_id'=>$ClubPoint['id'],'product_id'=>$order_detail['product_id']])->first();
            $clup_detil->refund_status=1;
            $clup_detil->save();
            $ClubPoint->points -=$clup_detil['point'];
            $ClubPoint->save();
            $product=Product::find($order_detail['product_id']);

             if($order_detail['variation'] != null){
                        $product_stock = $product->stocks->where('variant', $order_detail['variation'])->first();
                        $product_stock->qty += $order_detail['quantity'];
                        $product_stock->save();


                    }
                    else {
                        $product->current_stock += $order_detail['quantity'];
                        $product_stock = $product->stocks->where('variant', null)->first();
                        $product_stock->qty += $order_detail['quantity'];
                        $product_stock->save();
                        $product->save();
                    }



            flash( translate("Refund Request has been successfully") )->success();
            return 1;
        }
        else {
            flash( translate("Something went wrong") )->error();
            return 0;
        }
        }else{
             flash( translate("Something went wrong") )->error();
            return 0;
        }
    }

    /**
     * Show the form for view the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    //Shows the refund reason
    public function reason_view($id)
    {
        $refund = RefundRequest::findOrFail($id);
        if (Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff') {
            if ($refund->orderDetail != null) {
                $refund->admin_seen = 1;
                $refund->save();
                return view('refund_request.reason', compact('refund'));
            }
        }
        else {
            return view('refund_request.frontend.refund_request.reason', compact('refund'));
        }
    }
}
