<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\PublicSslCommerzPaymentController;
use App\Http\Controllers\InstamojoController;
use App\Http\Controllers\PaystackController;
use App\Order;
use App\OrderDetail;
use App\orders_should_payments;
use App\SellerWithdrawRequest;
use App\Seller;
use App\Payment;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Session;

class CommissionController extends Controller
{
    //redirect to payment controllers according to selected payment gateway for seller payment
    public function pay_to_seller(Request $request)
    {
        $data['seller_id'] = $request->seller_id;
        if($request->has('orders_should_pay')) {
            $data['orders_should_pay'] = $request->orders_should_pay;
        }
        $data['payment_method'] = $request->payment_option;
        $data['payment_withdraw'] = $request->payment_withdraw;
        $data['withdraw_request_id'] = $request->withdraw_request_id;
        if ($request->txn_code != null) {
            $data['txn_code'] = $request->txn_code;
        }
        else {
            $data['txn_code'] = null;
        }
        $request->session()->put('payment_type', 'seller_payment');
        $request->session()->put('payment_data', $data);

        if($request->payment_option == 'paypal'){
            $paypal = new PaypalController;
            return $paypal->getCheckout();
        }
        elseif ($request->payment_option == 'stripe') {
            $stripe = new StripePaymentController;
            return $stripe->stripe();
        }
        elseif ($request->payment_option == 'instamojo') {
            $instamojo = new InstamojoController;
            return $instamojo->pay($request);
        }
        elseif ($request->payment_option == 'razorpay') {
            $razorpay = new RazorpayController;
            return $razorpay->payWithRazorpay($request);
        }
        elseif ($request->payment_option == 'sslcommerz') {
            $sslcommerz = new PublicSslCommerzPaymentController;
            return $sslcommerz->index($request);
        }
        elseif ($request->payment_option == 'paystack') {
            $paystack = new PaystackController;
            return $paystack->redirectToGateway($request);
        }
        elseif ($request->payment_option == 'voguepay') {
            $voguepay = new VoguePayController;
            return $voguepay->customer_showForm();
        }
        elseif ($request->payment_option == 'cash') {
            return $this->seller_payment_done($request, null);
        }
        elseif ($request->payment_option == 'bank_payment') {
            return $this->seller_payment_done($request, null);
        }
        if($request->has('orders_should_pay')) {

        } else {
            flash(translate('there is some thing error !'))->error();
            return redirect()->back();
        }

    }

    //redirects to this method after successfull seller payment
    public function seller_payment_done($request, $payment_details){
        $payment_data = $request->session()->get('payment_data');
        $seller = Seller::findOrFail($payment_data['seller_id']);
        if($request->has('orders_should_pay')) {
            foreach ($payment_data['orders_should_pay'] as $order_should_pay) {
                $order_to_pay = orders_should_payments::where('id', $order_should_pay)
                ->where('seller_id', $request->seller_id)
                ->where('refund', 0)
                ->where('paid', 0)->first();
                if(get_setting('refund_request_time') > 0) {
                    $carbon = new Carbon($order_to_pay->order_detail->created_at);
                    $order_detail = OrderDetail::select(['*', DB::raw('DATEDIFF(now(), created_at) as refund_days')])
                    ->where('id', $order_to_pay->order_detail->id)
                    ->where(DB::raw('DATEDIFF(now(), created_at)'), '>', get_setting('refund_request_time'))
                    ->first();
                    if($order_detail) {
                        pay($seller, $order_to_pay, $payment_data, $payment_details);
                    } else {
                        flash(translate('You Should Pay For') . ' '
                        . $order_to_pay->order_detail->order->code . ' '
                        . translate('After') . ' '
                        . $carbon->addDays(get_setting('refund_request_time')))->error();
                        return redirect()->back();
                    }
                } else {
                    pay($seller, $order_to_pay, $payment_data, $payment_details);
                }
            }
            if ($payment_data['payment_withdraw'] == 'withdraw_request') {
                flash(translate('Payment completed'))->success();
                return redirect()->route('withdraw_requests_all');
            }
            else {
                flash(translate('Payment completed'))->success();
                return redirect()->route('sellers.index');
            }
        } else {
            $order_to_pay = orders_should_payments::where('order_id',$request['order_id'])
            ->where('seller_id', $request->seller_id)
            ->where('refund', 0)
            ->where('paid', 0)->first();
            if(get_setting('refund_request_time') > 0) {
                $carbon = new Carbon($order_to_pay->order_detail->created_at);
                $order_detail = OrderDetail::select(['*', DB::raw('DATEDIFF(now(), created_at) as refund_days')])
                ->where('id', $order_to_pay->order_detail->id)
                ->where(DB::raw('DATEDIFF(now(), created_at)'), '>', get_setting('refund_request_time'))
                ->first();
                if($order_detail) {
                    pay($seller, $order_to_pay, $payment_data, $payment_details);
                    if ($payment_data['payment_withdraw'] == 'withdraw_request') {
                        flash(translate('Payment completed'))->success();
                        return redirect()->route('withdraw_requests_all');
                    }
                    else {
                        flash(translate('Payment completed'))->success();
                        return redirect()->route('sellers.index');
                    }
                } else {
                    flash(translate('You Should Pay For') . ' '
                    . $order_to_pay->order_detail->order->code . ' '
                    . translate('After') . ' '
                    . $carbon->addDays(get_setting('refund_request_time')))->error();
                    return redirect()->back();
                }
            } else {
                pay($seller, $order_to_pay, $payment_data, $payment_details);
                if ($payment_data['payment_withdraw'] == 'withdraw_request') {
                    flash(translate('Payment completed'))->success();
                    return redirect()->route('withdraw_requests_all');
                }
                else {
                    flash(translate('Payment completed'))->success();
                    return redirect()->route('sellers.index');
                }
            }
        }

    }
}



function pay($seller,$order_to_pay, $payment_data, $payment_details) {
    $order_to_pay->order_detail->payment_status = 1;
    $seller->admin_to_pay -= $order_to_pay['amount'];
    $seller->user->balance -= $order_to_pay['amount'];
    $order_to_pay->paid = 1;
    $seller->save();
    $seller->user->save();
    $order_to_pay->save();
    $order_to_pay->order_detail->save();
    $payment = new Payment;
    $payment->seller_id = $seller->id;
    $payment->amount = $order_to_pay['amount'];
    $payment->payment_method = $payment_data['payment_method'];
    $payment->txn_code = $payment_data['txn_code'];
    $payment->payment_details = $payment_details;
    $payment->save();
    if ($payment_data['payment_withdraw'] == 'withdraw_request') {
        $seller_withdraw_request = SellerWithdrawRequest::findOrFail($payment_data['withdraw_request_id']);
        $seller_withdraw_request->status = '1';
        $seller_withdraw_request->viewed = '1';
        $seller_withdraw_request->save();
    }

    Session::forget('payment_data');
    Session::forget('payment_type');
}
