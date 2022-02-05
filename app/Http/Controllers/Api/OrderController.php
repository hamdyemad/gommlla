<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Product;
use App\Models\OrderDetail;
use App\Models\Coupon;
use App\Models\CouponUsage;
use App\Models\BusinessSetting;
use App\User;
use DB;
Use App\Addon;
use Carbon;
use App\RefundRequest;

class OrderController extends Controller
{
    public function processOrder(Request $request)
    {
        $user=User::where('id',$request->user_id)->first();
        
          $data['name']           = $user['name'];
            $data['email']          = $user['email'];
            $data['address']        = $request['address'];
            $data['country']        = $request['country'];
            $data['city']           = $request['city'];
            $data['postal_code']    = $request['postal_code'];
            $data['phone']          = $request['phone'];
           

            $shippingAddress = json_encode($data);
        
        // $shippingAddress = json_decode($request->shipping_address);

        $cartItems = Cart::where('user_id', $request->user_id)->get();

        $shipping = 0;
        $admin_products = array();
        $seller_products = array();
        //

        if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate') {
            $shipping = \App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value;
        }
        elseif (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'seller_wise_shipping') {
            foreach ($cartItems as $cartItem) {
                $product = \App\Product::find($cartItem->product_id);
                if($product->added_by == 'admin'){
                    array_push($admin_products, $cartItem->product_id);
                }
                else{
                    $product_ids = array();
                    if(array_key_exists($product->user_id, $seller_products)){
                        $product_ids = $seller_products[$product->user_id];
                    }
                    array_push($product_ids, $cartItem->product_id);
                    $seller_products[$product->user_id] = $product_ids;
                }
            }
                if(!empty($admin_products)){
                    $shipping = \App\BusinessSetting::where('type', 'shipping_cost_admin')->first()->value;
                }
                if(!empty($seller_products)){
                    foreach ($seller_products as $key => $seller_product) {
                        $shipping += \App\Shop::where('user_id', $key)->first()->shipping_cost;
                    }
                }
        }

        // create an order
        $order = Order::create([
            'user_id' => $request->user_id,
            'shipping_address' => json_encode($shippingAddress),
            'payment_type' => $request->payment_type,
            'payment_status' => $request->payment_status,
            'grand_total' => $request->grand_total + $shipping,    //// 'grand_total' => $request->grand_total + $shipping,
            'coupon_discount' => $request->coupon_discount,
            'code' => date('Ymd-his'),
            'date' => strtotime('now')
        ]);
      
        

        foreach ($cartItems as $cartItem) {
            $product = Product::findOrFail($cartItem->product_id);
            if ($cartItem->variation) {
                $cartItemVariation = $cartItem->variation;
                $product_stocks = $product->stocks->where('variant', $cartItem->variation)->first();
                $product_stocks->qty -= $cartItem->quantity;
                $product_stocks->save();
            } else {
                $product->update([
                    'current_stock' => DB::raw('current_stock - ' . $cartItem->quantity)
                ]);
            }

            $order_detail_shipping_cost= 0;

            if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate') {
                $order_detail_shipping_cost = $shipping/count($cartItems);
            }
            elseif (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'seller_wise_shipping') {
                if($product->added_by == 'admin'){
                    $order_detail_shipping_cost = \App\BusinessSetting::where('type', 'shipping_cost_admin')->first()->value/count($admin_products);
                }
                else {
                    $order_detail_shipping_cost = \App\Shop::where('user_id', $product->user_id)->first()->shipping_cost/count($seller_products[$product->user_id]);
                }
            }
            else{
                $order_detail_shipping_cost = $product->shipping_cost;
            }

            // save order details
            OrderDetail::create([
                'order_id' => $order->id,
                'seller_id' => $product->user_id,
                'product_id' => $product->id,
                'variation' => $cartItem->variation,
                'price' => $cartItem->price * $cartItem->quantity,
                'tax' => $cartItem->tax * $cartItem->quantity,
                'shipping_cost' => $order_detail_shipping_cost,
                'quantity' => $cartItem->quantity,
                'payment_status' => $request->payment_status
            ]);
            $product->update([
                'num_of_sale' => DB::raw('num_of_sale + ' . $cartItem->quantity)
            ]);
        }
        // apply coupon usage
        if ($request->coupon_code != '') {
            CouponUsage::create([
                'user_id' => $request->user_id,
                'coupon_id' => Coupon::where('code', $request->coupon_code)->first()->id
            ]);
        }
        // calculate commission
        $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
        foreach ($order->orderDetails as $orderDetail) {
            if ($orderDetail->product->user->user_type == 'seller') {
                $seller = $orderDetail->product->user->seller;
                $price = $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                $seller->admin_to_pay = ($request->payment_type == 'cash_on_delivery') ? $seller->admin_to_pay - ($price * $commission_percentage) / 100 : $seller->admin_to_pay + ($price * (100 - $commission_percentage)) / 100;
                $seller->save();
            }
        }
     
          if($order->user_id != NULL){
                    if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
                        $clubpointController = new ClubPointController;
                        $clubpointController->processClubPoints($order);
                    }
                }
        // clear user's cart
        $user = User::findOrFail($request->user_id);
        $user->carts()->delete();
       

        return response()->json([
            'success' => true,
            'message' => 'Your order has been placed successfully'
        ]);
    }

    public function store(Request $request)
    {
        return $this->processOrder($request);
    }
    public function purchase_history(Request $request){
        $orders = Order::where('user_id', $request['user_id'])->orderBy('code', 'desc')->get();
        $data=[];
        foreach($orders as  $key=>$order){
             $data[$key]['id']=$order['id'];
      $data[$key]['code']=$order['code'];
     $data[$key]['date']=date('d-m-Y', $order->date);
     $data[$key]['amount']=single_price($order->grand_total);
      $data[$key]['delivery_status']=ucfirst(str_replace('_', ' ', $order->orderDetails->first()['delivery_status']));
      
       $data[$key]['Payment Status']=$order->payment_status;
      
             
             
        }
      return response()->json([
          'data' => $data,
            'success' => true,
            
            'status' => 200
        ]); 
    }
    public function purchase_show(Request $request){
        $order = Order::findOrFail($request->order_id);
        $order->delivery_viewed = 1;
        $order->payment_status_viewed = 1;
        $order->save();
         $status = $order->orderDetails->first()->delivery_status;
    $refund_request_addon = Addon::where('unique_identifier', 'refund_request')->first();
    $data['code']=$order['code'];
    $data['customer']=isset(json_decode($order->shipping_address)->name)?json_decode($order->shipping_address)->name :'';
     $data['email']=isset( $order->user->email)? $order->user->email:'';
     $data['id']=$order['id'];
    //  $data['Shipping Address']= isset(json_decode($order->shipping_address)->address )?json_decode($order->shipping_address)->address:''.',' . isset(json_decode($order->shipping_address)->city)?json_decode($order->shipping_address)->city:'' .',' .isset(json_decode($order->shipping_address)->postal_code)?json_decode($order->shipping_address)->postal_code:''.','. isset( json_decode($order->shipping_address)->country)?json_decode($order->shipping_address)->country:'';
     $data['Order date']=date('d-m-Y H:i A', $order->date) ;
     $data['Order status']=ucfirst(str_replace('_', ' ', $status));
    
     $data['Total order amount']=single_price($order->orderDetails->sum('price') + $order->orderDetails->sum('tax'));
     $data['Payment metdod']=ucfirst(str_replace('_', ' ', $order->payment_type));
      $data['Shipping']=single_price($order->orderDetails->sum('shipping_cost'));
    $data['sub_total'] =single_price($order->orderDetails->sum('price'));
    $data['Tax']=single_price($order->orderDetails->sum('tax'));
    $data['Coupon Discount']=single_price($order->coupon_discount);
      foreach ($order->orderDetails as $key => $orderDetail){
       
     $data['orderDetail'][$key]['Product']=isset($orderDetail->product)?$orderDetail->product->name:'';
      $data['orderDetail'][$key]['order_detail_id']=$orderDetail['id'];
        $data['orderDetail'][$key]['slug']=isset($orderDetail->product)?$orderDetail->product->slug:'';
     $data['orderDetail'][$key]['Variation']=$orderDetail->variation;
      $data['orderDetail'][$key]['Quantity']=$orderDetail->quantity;
    
      $data['orderDetail'][$key]['price']=single_price($orderDetail->price);
      
       $no_of_max_day = \App\BusinessSetting::where('type', 'refund_request_time')->first()->value;
                                            $last_refund_date = $orderDetail->created_at->addDays($no_of_max_day);
                                            $today_date = Carbon\Carbon::now();
                                            
                                            
            if ($orderDetail->product != null && $orderDetail->product->refundable != 0 && $orderDetail->refund_request == null && $today_date <= $last_refund_date && $orderDetail->delivery_status == 'delivered'){
                                   $refund='Send';        
            }
            elseif ($orderDetail->refund_request != null && $orderDetail->refund_request->refund_status == 0){
                                             $refund=   'Pending';
            }
                        elseif ($orderDetail->refund_request != null && $orderDetail->refund_request->refund_status == 1){
                                           $refund=  'Approved';
                                           
                        }
                                elseif ($orderDetail->product->refundable != 0){
                                        $refund='N/A';
      }
                        else{
                                $refund='Non-refundable';
                        }     
      
      
     $data['orderDetail'][$key]['refund']=$refund;
      }
     
     return response()->json([
          'data' => $data,
            'success' => true,
            
            'status' => 200
        ]); 
    
   
        
    }
    
    public function refund_request(Request $request){
       
         $order_detail = OrderDetail::where('id', $request['OrderDetail_id'])->first();
        
        if ($order_detail->product != null && $order_detail->product->refundable == 1) {
            $refund = new RefundRequest;
        $refund->user_id =$order_detail->order['user_id'] ;
        $refund->guest_id =$order_detail->order['guest_id'] ;
        $refund->order_id = $order_detail->order_id;
        $refund->order_detail_id = $order_detail->id;
        $refund->seller_id = $order_detail->seller_id;
        $refund->seller_approval = 0;
        
        $refund->admin_approval = 0;
        $refund->admin_seen = 0;
        $refund->refund_amount = $order_detail->price + $order_detail->tax;
        $refund->refund_status = 0;
        if ($refund->save()) {
            
          
            // $ClubPoint=ClubPoint::where('order_id',$order_detail->order_id)->first();
            
            return response()->json([
          'message' => 'Refund Request has been successfully',
            'success' => true,
            
            'status' => 200
        ]); 
            
         
        }
        
        }
        
          return response()->json([
          'message' => 'Something went wrong',
            'success' => false,
            
            'status' => 200
        ]);
            
    
     
    }
    
}
