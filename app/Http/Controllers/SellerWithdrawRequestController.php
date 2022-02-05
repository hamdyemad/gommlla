<?php

namespace App\Http\Controllers;

use App\orders_should_payments;
use Illuminate\Http\Request;
use App\SellerWithdrawRequest;
use Auth;
use App\Seller;

class SellerWithdrawRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $seller_withdraw_requests = SellerWithdrawRequest::where('user_id', Auth::user()->seller->id)->latest()->paginate(9);
        $orders_should_payments = orders_should_payments::where('seller_id', Auth::user()->seller->id)
        ->where('paid', 0)
        ->where('refund', 0)
        ->orderBy('amount')->get();
        return view('frontend.user.seller.seller_withdraw_requests.index', compact('seller_withdraw_requests', 'orders_should_payments'));
    }

    public function request_index()
    {
        $this->authorize('9');
        $seller_withdraw_requests = SellerWithdrawRequest::latest()->paginate(15);
        return view('backend.sellers.seller_withdraw_requests.index', compact('seller_withdraw_requests'));
    }

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
        if($request->has('orders_should_pay')) {
            foreach ($request['orders_should_pay'] as $order_should_pay) {
                $order_to_pay = orders_should_payments::find($order_should_pay);
                $seller_withdraw_request = new SellerWithdrawRequest;
                $seller_withdraw_request->user_id = Auth::user()->seller->id;
                $seller_withdraw_request->order_id = $order_to_pay->order_id;
                $seller_withdraw_request->amount = $order_to_pay->amount;
                $seller_withdraw_request->message = $request->message;
                $seller_withdraw_request->status = '0';
                $seller_withdraw_request->viewed = '0';
            }
            if ($seller_withdraw_request->save()) {
                flash(translate('Request has been sent successfully'))->success();
                return redirect()->route('withdraw_requests.index');
            }
            else{
                flash(translate('Something went wrong'))->error();
                return back();
            }

        } else {
            flash(translate('Something went wrong'))->error();
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

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
        //
    }

    public function payment_modal(Request $request)
    {
        $seller = Seller::findOrFail($request->id);
        $seller_withdraw_request = SellerWithdrawRequest::where('id', $request->seller_withdraw_request_id)->first();
        return view('backend.sellers.seller_withdraw_requests.payment_modal', compact('seller', 'seller_withdraw_request'));
    }

    public function message_modal(Request $request)
    {
        $seller_withdraw_request = SellerWithdrawRequest::findOrFail($request->id);
        if (Auth::user()->user_type == 'seller') {
            return view('frontend.partials.withdraw_message_modal', compact('seller_withdraw_request'));
        }
        elseif (Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff') {
            return view('backend.sellers.seller_withdraw_requests.withdraw_message_modal', compact('seller_withdraw_request'));
        }
    }
}
