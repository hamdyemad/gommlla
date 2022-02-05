<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Seller;
use App\User;
use App\Search;
use App\RefundRequest;
use App\Order;

class ReportController extends Controller
{
    public function stock_report(Request $request)
    {
        $this->authorize('10');
        $sort_by =null;
        $products = Product::orderBy('created_at', 'desc');
        if ($request->has('category_id')){
            $sort_by = $request->category_id;
            $products = $products->where('category_id', $sort_by);
        }
        $products = $products->paginate(15);
        return view('backend.reports.stock_report', compact('products','sort_by'));
    }

    public function in_house_sale_report(Request $request)
    {
        $this->authorize('10');
        $sort_by =null;
        $products = Product::orderBy('num_of_sale', 'desc')->where('added_by', 'admin');
        if ($request->has('category_id')){
            $sort_by = $request->category_id;
            $products = $products->where('category_id', $sort_by);
        }
        $products = $products->paginate(15);
        return view('backend.reports.in_house_sale_report', compact('products','sort_by'));
    }

    public function seller_sale_report(Request $request)
    {
        $this->authorize('10');
        $sort_by =null;
        $sellers = Seller::orderBy('created_at', 'desc');
        if ($request->has('verification_status')){
            $sort_by = $request->verification_status;
            $sellers = $sellers->where('verification_status', $sort_by);
        }
        $sellers = $sellers->paginate(10);
        return view('backend.reports.seller_sale_report', compact('sellers','sort_by'));
    }

    public function wish_report(Request $request)
    {
        $this->authorize('10');
        $sort_by =null;
        $products = Product::orderBy('created_at', 'desc');
        if ($request->has('category_id')){
            $sort_by = $request->category_id;
            $products = $products->where('category_id', $sort_by);
        }
        $products = $products->paginate(10);
        return view('backend.reports.wish_report', compact('products','sort_by'));
    }

    public function user_search_report(Request $request){
        $this->authorize('10');
        $searches = Search::orderBy('count', 'desc')->paginate(10);
        return view('backend.reports.user_search_report', compact('searches'));
    }

public function report_stafe(Request $request){
    if(isset($request['start_time'])&&!empty($requse['start_time'])){
        $start_time=$request['start_time'];
    }else{
        $start_time=date('Y-m-d');
    }

    if(isset($request['end_time'])&&!empty($requse['end_time'])){
        $end_time=$request['end_time'];
    }else{
        $date=date('Y-m-d h:i:sa');
       $end_time= date('Y-m-d', strtotime($date .' +1 day'));
    }

    if(auth()->user()->user_type=='staff'){
         $order_id=RefundRequest::where('updated_at','>=',$start_time)->where('updated_at','<=',$end_time)->where('employ_id',auth()->user()['id'])->get();



    }elseif(isset($request['employ_id'])){
          $order_id=RefundRequest::where('updated_at','>=',$start_time)->where('updated_at','<=',$end_time)->where('employ_id',$request['employ_id'])->get();
    }else{
         $order_id=RefundRequest::where('updated_at','>=',$start_time)->where('updated_at','<=',$end_time)->get();
    }
    $array=[];
    foreach($order_id as$key=> $row){
        $array[strtotime ($row['updated_at'])]['id']=$row['order_id'];
        $array[strtotime ($row['updated_at'])]['time']=$row['updated_at'];
        $array[strtotime ($row['updated_at'])]['status']='refund';
        $array[strtotime ($row['updated_at'])]['amount']=$row['refund_amount'];
    }
     if(auth()->user()->user_type=='staff'){
         $order_id=Order::where('updated_at','>=',$start_time)->where('updated_at','<=',$end_time)->where('employ_id',auth()->user()['id'])->get();



    }elseif(isset($request['employ_id'])){
          $order_id=Order::where('updated_at','>=',$start_time)->where('updated_at','<=',$end_time)->where('employ_id',$request['employ_id'])->get();
    }else{
         $order_id=Order::where('updated_at','>=',$start_time)->where('updated_at','<=',$end_time)->where('payment_details','cash')->get();
    }
     foreach($order_id as$key=> $row){
        $array[strtotime ($row['updated_at'])]['id']=$row['id'];
        $array[strtotime ($row['updated_at'])]['time']=$row['updated_at'];
        $array[strtotime ($row['updated_at'])]['status']='sall';
        $array[strtotime ($row['updated_at'])]['amount']=$row['grand_total'];
    }
    ksort($array);
    $staff=User::where('user_type','staff')->get();

 return view('backend.reports.report_stafe', compact('array','staff','start_time','end_time'));
}
}
