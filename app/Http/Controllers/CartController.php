<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\SubSubCategory;
use App\Category;
use Session;
use App\Color;
use Cookie;
use App\product_upsale;
use App\unit;

class CartController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::all();
        return view('frontend.view_cart', compact('categories'));
    }

    public function showCartModal(Request $request)
    {
        $product = Product::find($request->id);
        if($request->unit_price) {
            return view('frontend.partials.addToCart', compact('product'));
        } else {
            return view('frontend.partials.addToCart_wholesale_price', compact('product'));
        }
    }

    public function updateNavCart(Request $request)
    {
        return view('frontend.partials.cart');
    }

    public function addToCart(Request $request)
    {
        $product = Product::find($request->id);
        if($request->price_type == 'wholesale_price') {
            $unit = unit::find(2);
        } else {
            $unit = unit::find(1);
        }
        if(isset($request['upsale_id'])&&!empty($request['upsale_id'])){
            $row_sale=product_upsale::find($request['upsale_id']);
            $product_sale=Product::find($row_sale['product_id']);
            $sale=array();
            $sale['id']=$row_sale['product_id'];
            $sale['owner_id']=$product_sale['user_id'];
            $str_sale = '';
                if($product_sale->digital != 1 && 1 < $product_sale->min_qty) {
                    return array('status' => 0, 'view' => view('frontend.partials.minQtyNotSatisfied', [
                        'min_qty' => $product_sale->min_qty
                    ])->render());
                }
                if($request->has('upsale_color')){
                    $data['upsale_color'] = $request['upsale_color'];
                    $str_sale = Color::where('code', $request['upsale_color'])->first()->name;
                }
                if ($product_sale->digital != 1) {
                    //Gets all the choice values of customer choice option and generate a string like Black-S-Cotton
                    foreach (json_decode(Product::find($row_sale['product_id'])->choice_options) as $key => $choice_ubsale) {
                        if($str_sale != null){
                            $str_sale .= '-'.str_replace(' ', '', $request['upsale_attribute_id_'.$choice_ubsale->attribute_id]);
                        }
                        else{
                            $str_sale .= str_replace(' ', '', $request['upsale_attribute_id_'.$choice_ubsale->attribute_id]);
                        }
                    }
                }
            $sale['variant'] = $str_sale;
            $price_sale=$row_sale['discount'];
            $sale['quantity']=1;
            $sale['price']=$price_sale;
            $sale['tax']=0;
            $sale['product_referral_code']=null;
            $sale['shipping'] = 0;
            $sale['digital'] = $product_sale->digital;
            if(Cookie::has('referred_product_id') && Cookie::get('referred_product_id') == $product_sale->id) {
                $sale['product_referral_code'] = Cookie::get('product_referral_code');
            }

            if($request->session()->has('cart')){
                $foundInCart = false;
                $cart = collect();

                foreach ($request->session()->get('cart') as $key => $cartItem){
                    if($cartItem['id'] == $product_sale->id){
                        if($cartItem['variant'] == $str_sale && $str_sale != null){
                            $product_stock = $product->$product_sale->where('variant', $str_sale)->first();
                            $quantity = $product_stock->qty;

                            if($quantity < $cartItem['quantity'] + 1){
                                return array('status' => 0, 'view' => view('frontend.partials.outOfStockCart')->render());
                            }
                            else{
                                $foundInCart = true;
                                $cartItem['quantity'] += 1;
                            }
                        }
                    }
                    $cart->push($cartItem);
                }

                if (!$foundInCart) {
                    $cart->push($sale);
                }
                $request->session()->put('cart', $cart);

            }
            else{
                $cart = collect([$sale]);
                $request->session()->put('cart', $cart);
            }

        }

        $data = array();
        $data['id'] = $product->id;
        $data['owner_id'] = $product->user_id;
        $str = '';
        $tax = 0;


        if($product->digital != 1 && $request->quantity < $product->min_qty) {
            return array('status' => 0, 'view' => view('frontend.partials.minQtyNotSatisfied', [
                'min_qty' => $product->min_qty
            ])->render());
        }


        //check the color enabled or disabled for the product
        if($request->has('color')){
            $data['color'] = $request['color'];
            $str = Color::where('code', $request['color'])->first()->name;
        }

        if ($product->digital != 1) {
            //Gets all the choice values of customer choice option and generate a string like Black-S-Cotton
            foreach (json_decode(Product::find($request->id)->choice_options) as $key => $choice) {
                if($str != null){
                    $str .= '-'.str_replace(' ', '', $request['attribute_id_'.$choice->attribute_id]);
                }
                else{
                    $str .= str_replace(' ', '', $request['attribute_id_'.$choice->attribute_id]);
                }
            }
        }

        $data['variant'] = $str;

        if($str != null && $product->variant_product){
            $product_stock = $product->stocks->where('variant', $str)->first();
            if($request->price_type == 'wholesale_price') {
                $price = $product->wholesale_price;
            } else {
                $price = $product_stock->price;
            }
            $quantity = $product_stock->qty;

            if($quantity < $request['quantity']){
                return array('status' => 0, 'view' => view('frontend.partials.outOfStockCart')->render());
            }
        }
        else{
            if($request->price_type == 'wholesale_price') {
                $price = $product->wholesale_price;
            } else {
                $price = $product->unit_price;
            }
        }

        //discount calculation based on flash deal and regular discount
        //calculation of taxes
        $flash_deals = \App\FlashDeal::where('status', 1)->get();
        $inFlashDeal = false;
        foreach ($flash_deals as $flash_deal) {
            if ($flash_deal != null && $flash_deal->status == 1  && strtotime(date('d-m-Y')) >= $flash_deal->start_date && strtotime(date('d-m-Y')) <= $flash_deal->end_date && \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first() != null) {
                $flash_deal_product = \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first();
                if($flash_deal_product->discount_type == 'percent'){
                    $price -= ($price*$flash_deal_product->discount)/100;
                }
                elseif($flash_deal_product->discount_type == 'amount'){
                    $price -= $flash_deal_product->discount;
                }
                $inFlashDeal = true;
                break;
            }
        }
        if (!$inFlashDeal) {
            if($product->discount_type == 'percent'){
                if($request->price_type == 'wholesale_price') {
                    $price -= ($price*$product->wholesale_discount)/100;
                } else {
                    $price -= ($price*$product->discount)/100;
                }

            }
            elseif($product->discount_type == 'amount'){
                if($request->price_type == 'wholesale_price') {
                    $price -= $product->wholesale_discount;
                } else {
                    $price -= $product->discount;
                }
            }
        }


        $data['quantity'] = $request['quantity'];
        $data['price'] = $price;
        $data['sizes'] = $request['sizes'];
        $data['tax'] = $tax;
        $data['shipping'] = 0;
        $data['product_referral_code'] = null;
        $data['digital'] = $product->digital;
        $data['unit_id'] = $unit->id;

        if ($request['quantity'] == null){
            $data['quantity'] = 1;
        }

        if(Cookie::has('referred_product_id') && Cookie::get('referred_product_id') == $product->id) {
            $data['product_referral_code'] = Cookie::get('product_referral_code');
        }

        if($request->session()->has('cart')){
            $foundInCart = false;
            $cart = collect();
            foreach ($request->session()->get('cart') as $key => $cartItem){

                if($cartItem['id'] == $request->id){
                    if($cartItem['variant'] == $str && $str != null){
                        $product_stock = $product->stocks->where('variant', $str)->first();
                        $quantity = $product_stock->qty;

                        if($quantity < $cartItem['quantity'] + $request['quantity']){
                            return array('status' => 0, 'view' => view('frontend.partials.outOfStockCart')->render());
                        }
                        else{
                            $foundInCart = true;
                            $cartItem['quantity'] += $request['quantity'];
                        }
                    }
                }
                $cart->push($cartItem);
            }

            if (!$foundInCart) {
                $cart->push($data);
            }
            $request->session()->put('cart', $cart);
        }
        else{
            $cart = collect([$data]);
            $request->session()->put('cart', $cart);
        }
        return array('status' => 1, 'view' => view('frontend.partials.addedToCart', compact('product', 'data'))->render());
    }

    //removes from Cart
    public function removeFromCart(Request $request)
    {
        if($request->session()->has('cart')){
            $cart = $request->session()->get('cart', collect([]));
            $cart->forget($request->key);
            $request->session()->put('cart', $cart);
        }
        return view('frontend.partials.cart_details');
    }

    //updated the quantity for a cart item
    public function updateQuantity(Request $request)
    {
        $cart = $request->session()->get('cart', collect([]));
        $cart = $cart->map(function ($object, $key) use ($request) {
            if($key == $request->key){
                $product = \App\Product::find($object['id']);
                if($object['variant'] != null && $product->variant_product){
                    $product_stock = $product->stocks->where('variant', $object['variant'])->first();
                    $quantity = $product_stock->qty;
                    if($quantity >= $request->quantity){
                        if($request->quantity >= $product->min_qty){
                            $object['quantity'] = $request->quantity;
                        }
                    }
                }
                elseif($request->quantity >= $product->min_qty){
                    $object['quantity'] = $request->quantity;
                }
            }
            return $object;
        });
        $request->session()->put('cart', $cart);

        return view('frontend.partials.cart_details');
    }
}
