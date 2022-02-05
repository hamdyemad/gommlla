<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\OrderDetail;
use App\Shipping;
use App\Status;
use Auth;
use DB;

class PurchaseHistoryController extends Controller
{
    /**
     * Display a listing of the resource.
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
        ])->latest()->get();
        $cities = Shipping::all();
        $orders = Order::where('user_id', Auth::user()->id);
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
        $orders = $orders->latest()->paginate(10);
        return view('frontend.user.purchase_history', compact('orders', 'cities', 'statuses'));
    }

    public function digital_index()
    {
        $orders = DB::table('orders')
                        ->orderBy('code', 'desc')
                        ->join('order_details', 'orders.id', '=', 'order_details.order_id')
                        ->join('products', 'order_details.product_id', '=', 'products.id')
                        ->where('orders.user_id', Auth::user()->id)
                        ->where('products.digital', '1')
                        ->where('order_details.payment_status', 'paid')
                        ->select('order_details.id')
                        ->paginate(1);
        return view('frontend.user.digital_purchase_history', compact('orders'));
    }

    public function purchase_history_details(Request $request)
    {
        $order = Order::findOrFail($request->order_id);
        $order->delivery_viewed = 1;
        $order->payment_status_viewed = 1;
        $order->save();
        return view('frontend.user.order_details_customer', compact('order'));
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
        //
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
}
