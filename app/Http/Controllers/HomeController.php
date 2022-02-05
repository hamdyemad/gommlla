<?php

namespace App\Http\Controllers;

use App\Http\Controllers\SearchController;
use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Category;
use App\FlashDeal;
use App\Brand;
use App\SubCategory;
use App\SubSubCategory;
use App\Product;
use App\PickupPoint;
use App\CustomerPackage;
use App\CustomerProduct;
use App\User;
use App\Seller;
use App\Shop;
use App\Color;
use App\Order;
use App\BusinessSetting;
use ImageOptimizer;
use Cookie;
use Illuminate\Support\Str;
use App\Mail\SecondEmailVerifyMailManager;
use Mail;
use App\Utility\TranslationUtility;
use App\product_upsale;
use App\Customer;


class HomeController extends Controller
{
    public function login()
    {
        if (Auth::check()) {
            return redirect()->route('home');
        }
        return view('frontend.user_login');
    }

    public function get_upsale_product(Request $request)
    {
        $row = Product::find($request['id']);

        $upsale = $row['product_saller']->where('number', '<=', $request['number']);

        $products = [];
        foreach ($upsale as $product) {
            if (count($product['upsale']) > 0) {
                foreach ($product['upsale'] as $upsale) {
                    $products[] = $upsale;
                }


            }
        }
        return $products;

    }

    public function get_upsale(Request $request)
    {
        $row = product_upsale::find($request['id']);
        $product = Product::find($row['product_id']);
        return view('frontend.upsale_product', compact('product', 'row'));

    }

    public function registration(Request $request)
    {
        if (Auth::check()) {
            return redirect()->route('home');
        }
        if ($request->has('referral_code')) {
            Cookie::queue('referral_code', $request->referral_code, 43200);
        }
        return view('frontend.user_registration');
    }

    public function wholesale_active()
    {
        $user = auth()->user();
        $user->wholesale = 1;
        $user->save();
        $customer = Customer::where('user_id', auth()->user()->id)->first();

        $customer->wholesale = 1;
        $customer->save();
        flash(translate('send your request successfully !'))->success();
        return back();

    }

    // public function user_login(Request $request)
    // {
    //     $user = User::whereIn('user_type', ['customer', 'seller'])->where('email', $request->email)->first();
    //     if($user != null){
    //         if(Hash::check($request->password, $user->password)){
    //             if($request->has('remember')){
    //                 auth()->login($user, true);
    //             }
    //             else{
    //                 auth()->login($user, false);
    //             }
    //             return redirect()->route('dashboard');
    //         }
    //     }
    //     return back();
    // }

    public function cart_login(Request $request)
    {
        $user = User::whereIn('user_type', ['customer', 'seller','affiliate'])->where('email', $request->email)->orWhere('phone', $request->email)->first();
        if ($user != null) {
            updateCartSetup();
            if (Hash::check($request->password, $user->password)) {
                if ($request->has('remember')) {
                    auth()->login($user, true);
                } else {
                    auth()->login($user, false);
                }
            }
        }
        return back();
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the admin dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function admin_dashboard()
    {
        $end_time = date('Y-m-d');
        $customer_start_time = date('Y-m-d', strtotime('-7 day'));
        $affiliate_start_time = date('Y-m-d', strtotime('-7 day'));
        $seller_start_time = date('Y-m-d', strtotime('-7 day'));
        $start_time = date('Y-m-d', strtotime('-7 day'));
        $data_month = [];
        $data_year = [];
        $date_month = [];
        $date_year = [];
        $date_hour = [];
        $data_hour = [];
        $date_day = [];
        $data_day = [];
        $customer_date_day = [];
        $customer_data_day = [];
        $affiliate_date_day = [];
        $affiliate_data_day = [];
        $seller_date_day = [];
        $seller_data_day = [];

        $start_mont = date('Y-m-d', strtotime('-12 month'));
        $start_year = date('Y-m-d', strtotime('-3 year'));

        $end_hour = date('Y-m-d H:i');
        $start_hour = date('Y-m-d H:i', strtotime('-24 houre'));

        // Customer Days
        while (strtotime($customer_start_time) <= strtotime($end_time)) {
            $customer_start_time = date('Y-m-d', strtotime($customer_start_time));

            $customer = 0;
            $next = date('Y-m-d', strtotime("+1 day", strtotime($customer_start_time)));
            $customer = User::where('date', '>=', strtotime($customer_start_time))
                ->where('user_type', 'customer')
                ->where('date', '<=', strtotime($next))->count();

            $customer_date_day[] = date('Y-m-d', strtotime($customer_start_time));


            $customer_data_day[] = $customer;

            $customer_start_time = date('Y-m-d', strtotime("+1 day", strtotime($customer_start_time)));
        }

        // Affiliate Days
        while (strtotime($affiliate_start_time) <= strtotime($end_time)) {
            $affiliate_start_time = date('Y-m-d', strtotime($affiliate_start_time));

            $affiliate = 0;
            $next = date('Y-m-d', strtotime("+1 day", strtotime($affiliate_start_time)));
            $affiliate = User::where('date', '>=', strtotime($affiliate_start_time))
                ->where('user_type', 'affiliate')
                ->where('date', '<=', strtotime($next))->count();

            $affiliate_date_day[] = date('Y-m-d', strtotime($affiliate_start_time));


            $affiliate_data_day[] = $affiliate;

            $affiliate_start_time = date('Y-m-d', strtotime("+1 day", strtotime($affiliate_start_time)));
        }
        // Seller Days
        while (strtotime($seller_start_time) <= strtotime($end_time)) {
            $seller_start_time = date('Y-m-d', strtotime($seller_start_time));

            $seller = 0;
            $next = date('Y-m-d', strtotime("+1 day", strtotime($seller_start_time)));
            $seller = User::where('date', '>=', strtotime($seller_start_time))
                ->where('user_type', 'seller')
                ->where('date', '<=', strtotime($next))->count();

            $seller_date_day[] = date('Y-m-d', strtotime($seller_start_time));


            $seller_data_day[] = $seller;

            $seller_start_time = date('Y-m-d', strtotime("+1 day", strtotime($seller_start_time)));
        }

        while (strtotime($start_hour) <= strtotime($end_hour)) {
            $start_hour = date('Y-m-d H:i', strtotime($start_hour));


            $order = 0;
            $next = date('Y-m-d H:i', strtotime("+1 hours", strtotime($start_hour)));


            $order = Order::where('date', '>=', strtotime($start_hour))
                ->where('date', '<=', strtotime($next))->sum('grand_total');

            $date_hour[] = date('Y-m-d h:A', strtotime($start_hour));


            $data_hour[] = $order;

            $start_hour = date('Y-m-d H:i', strtotime("+1 hours", strtotime($start_hour)));
        };

        while (strtotime($start_time) <= strtotime($end_time)) {
            $start_time = date('Y-m-d', strtotime($start_time));

            $order = 0;
            $next = date('Y-m-d', strtotime("+1 day", strtotime($start_time)));
            $order = Order::where('date', '>=', strtotime($start_time))
                ->where('date', '<=', strtotime($next))->sum('grand_total');

            $date_day[] = date('Y-m-d', strtotime($start_time));


            $data_day[] = $order;

            $start_time = date('Y-m-d', strtotime("+1 day", strtotime($start_time)));
        }

        while (strtotime($start_mont) <= strtotime($end_time)) {
            $start_mont = date('Y-m-d', strtotime($start_mont));
            $order = 0;
            $next = date('Y-m-d', strtotime("+1 month", strtotime($start_mont)));
            $order = Order::where('date', '>=', strtotime($start_mont))
                ->where('date', '<=', strtotime($next))->sum('grand_total');

            $date_month[] = date('Y-m', strtotime($start_mont));


            $data_month[] = $order;

            $start_mont = date('Y-m-d', strtotime("+1 month", strtotime($start_mont)));
        }
        while (strtotime($start_year) <= strtotime($end_time)) {
            $start_year = date('Y-m-d', strtotime($start_year));
            $order = 0;
            $next = date('Y-m-d', strtotime("+1 year", strtotime($start_year)));
            $order = Order::where('date', '>=', strtotime($start_year))
                ->where('date', '<=', strtotime($next))->sum('grand_total');

            $date_year[] = date('Y', strtotime($start_year));


            $data_year[] = $order;

            $start_year = date('Y-m-d', strtotime("+1 year", strtotime($start_year)));
        }


        $tu = TranslationUtility::getInstance();

        //dd($tu->getAllTranslations());
        //dd($tu->cached_translation_row("Welcome to", 'bd'));


        return view('backend.dashboard', compact('data_year', 'date_year',
            'data_month', 'date_month', 'date_day', 'data_day', 'date_hour', 'data_hour',
             'customer_date_day', 'customer_data_day', 'affiliate_date_day', 'affiliate_data_day'
             , 'seller_date_day', 'seller_data_day'));
        // return view('test');
    }

    /**
     * Show the customer/seller dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashboard()
    {
        if (Auth::user()->user_type == 'seller') {
            return view('frontend.user.seller.dashboard');
        } elseif (Auth::user()->user_type == 'customer' || Auth::user()->user_type == 'affiliate') {
            return view('frontend.user.customer.dashboard');
        } else {
            abort(404);
        }
    }

    public function thanks() {
        $video = BusinessSetting::where('type', 'tutorial_video')->first()->value;
        $video =  str_replace('/watch?v=', '/embed/', $video);
        return view('frontend.user.thanks', compact('video'));
    }

    public function profile(Request $request)
    {
        if (Auth::user()->user_type == 'customer' || Auth::user()->user_type == 'affiliate') {
            return view('frontend.user.customer.profile');
        } elseif (Auth::user()->user_type == 'seller') {
            return view('frontend.user.seller.profile');
        }
    }

    public function customer_update_profile(Request $request)
    {
        // if (env('DEMO_MODE') == 'On') {
        //     flash(translate('Sorry! the action is not permitted in demo '))->error();
        //     return back();
        // }

        $user = Auth::user();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;

        if ($request->new_password != null && ($request->new_password == $request->confirm_password)) {
            $user->password = Hash::make($request->new_password);
        }
        $user->avatar_original = $request->photo;

        if ($user->save()) {
            flash(translate('Your Profile has been updated successfully!'))->success();
            return back();
        }

        flash(translate('Sorry! Something went wrong.'))->error();
        return back();
    }


    public function seller_update_profile(Request $request)
    {
        // if (env('DEMO_MODE') == 'On') {
        //     flash(translate('Sorry! the action is not permitted in demo '))->error();
        //     return back();
        // }

        $user = Auth::user();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;

        if ($request->new_password != null && ($request->new_password == $request->confirm_password)) {
            $user->password = Hash::make($request->new_password);
        }
        $user->avatar_original = $request->photo;

        $seller = $user->seller;
        $seller->cash_on_delivery_status = $request->cash_on_delivery_status;
        $seller->bank_payment_status = $request->bank_payment_status;
        $seller->bank_name = $request->bank_name;
        $seller->bank_acc_name = $request->bank_acc_name;
        $seller->bank_acc_no = $request->bank_acc_no;
        $seller->bank_routing_no = $request->bank_routing_no;

        if ($user->save() && $seller->save()) {
            flash(translate('Your Profile has been updated successfully!'))->success();
            return back();
        }

        flash(translate('Sorry! Something went wrong.'))->error();
        return back();
    }

    /**
     * Show the application frontend home.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('frontend.index');
    }

    public function flash_deal_details($slug)
    {
        $flash_deal = FlashDeal::where('slug', $slug)->first();
        if ($flash_deal != null)
            return view('frontend.flash_deal_details', compact('flash_deal'));
        else {
            abort(404);
        }
    }

    public function load_featured_section()
    {
        return view('frontend.partials.featured_products_section');
    }

    public function load_best_selling_section()
    {
        return view('frontend.partials.best_selling_section');
    }

    public function load_home_categories_section()
    {
        return view('frontend.partials.home_categories_section');
    }

    public function load_best_sellers_section()
    {
        return view('frontend.partials.best_sellers_section');
    }

    public function trackOrder(Request $request)
    {
        if ($request->has('order_code')) {
            $order = Order::where('code', $request->order_code)->first();
            if ($order != null) {
                return view('frontend.track_order', compact('order'));
            }
        }
        return view('frontend.track_order');
    }

    public function best_selling_product(Request $request)
    {

        $products = filter_products(\App\Product::where('published', 1)->orderBy('num_of_sale', 'desc'))->limit(12)->get();

        $all_colors = array();

        foreach ($products as $key => $product) {
            if ($product->colors != null) {
                foreach (json_decode($product->colors) as $key => $color) {
                    if (!in_array($color, $all_colors)) {
                        array_push($all_colors, $color);
                    }
                }
            }
        }

        $attributes = array();
        foreach ($products as $key => $product) {
            if ($product->attributes != null && is_array(json_decode($product->attributes))) {
                foreach (json_decode($product->attributes) as $key => $value) {
                    $flag = false;
                    $pos = 0;
                    foreach ($attributes as $key => $attribute) {
                        if ($attribute['id'] == $value) {
                            $flag = true;
                            $pos = $key;
                            break;
                        }
                    }
                    if (!$flag) {
                        $item['id'] = $value;
                        $item['values'] = array();
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                $item['values'] = $choice_option->values;
                                break;
                            }
                        }
                        array_push($attributes, $item);
                    } else {
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                foreach ($choice_option->values as $key => $value) {
                                    if (!in_array($value, $attributes[$pos]['values'])) {
                                        array_push($attributes[$pos]['values'], $value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        $type = translate('Best Selling');

        return view('frontend.productlisting', compact('products', 'attributes', 'all_colors', 'type'));
    }

    public function products_featured(Request $request)
    {
        $products = filter_products(\App\Product::where('published', 1)->where('featured', '1'))->limit(12)->get();

        $all_colors = array();

        foreach ($products as $key => $product) {
            if ($product->colors != null) {
                foreach (json_decode($product->colors) as $key => $color) {
                    if (!in_array($color, $all_colors)) {
                        array_push($all_colors, $color);
                    }
                }
            }
        }

        $attributes = array();
        foreach ($products as $key => $product) {
            if ($product->attributes != null && is_array(json_decode($product->attributes))) {
                foreach (json_decode($product->attributes) as $key => $value) {
                    $flag = false;
                    $pos = 0;
                    foreach ($attributes as $key => $attribute) {
                        if ($attribute['id'] == $value) {
                            $flag = true;
                            $pos = $key;
                            break;
                        }
                    }
                    if (!$flag) {
                        $item['id'] = $value;
                        $item['values'] = array();
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                $item['values'] = $choice_option->values;
                                break;
                            }
                        }
                        array_push($attributes, $item);
                    } else {
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                foreach ($choice_option->values as $key => $value) {
                                    if (!in_array($value, $attributes[$pos]['values'])) {
                                        array_push($attributes[$pos]['values'], $value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        $type = translate('Featured Products');
        return view('frontend.productlisting', compact('products', 'attributes', 'all_colors', 'type'));
    }

    public function to_day(Request $request)
    {

        // foreach($request as $row){
        //      if($row !=null){

        //      return $this->search($request);
        //  }
        // }
        $products = filter_products(\App\Product::where('published', 1)->where('todays_deal', '1'))->get();

        $all_colors = array();

        foreach ($products as $key => $product) {
            if ($product->colors != null) {
                foreach (json_decode($product->colors) as $key => $color) {
                    if (!in_array($color, $all_colors)) {
                        array_push($all_colors, $color);
                    }
                }
            }
        }

        $attributes = array();
        foreach ($products as $key => $product) {
            if ($product->attributes != null && is_array(json_decode($product->attributes))) {
                foreach (json_decode($product->attributes) as $key => $value) {
                    $flag = false;
                    $pos = 0;
                    foreach ($attributes as $key => $attribute) {
                        if ($attribute['id'] == $value) {
                            $flag = true;
                            $pos = $key;
                            break;
                        }
                    }
                    if (!$flag) {
                        $item['id'] = $value;
                        $item['values'] = array();
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                $item['values'] = $choice_option->values;
                                break;
                            }
                        }
                        array_push($attributes, $item);
                    } else {
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                foreach ($choice_option->values as $key => $value) {
                                    if (!in_array($value, $attributes[$pos]['values'])) {
                                        array_push($attributes[$pos]['values'], $value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        $type = translate('Todays Deal');

        return view('frontend.productlisting', compact('products', 'attributes', 'all_colors', 'type'));
    }


    public function product(Request $request, $slug)
    {
        $detailedProduct = Product::where('slug', $slug)->first();

        if ($detailedProduct != null && $detailedProduct->published) {
            updateCartSetup();
            if ($request->has('product_referral_code')) {
                Cookie::queue('product_referral_code', $request->product_referral_code, 43200);
                Cookie::queue('referred_product_id', $detailedProduct->id, 43200);
            }
            if ($detailedProduct->digital == 1) {
                return view('frontend.digital_product_details', compact('detailedProduct'));
            } else {
                return view('frontend.product_details', compact('detailedProduct'));
            }
        }
        abort(404);
    }

    public function shop($slug)
    {
        $shop = Shop::where('slug', $slug)->first();
        if ($shop != null) {
            $seller = Seller::where('user_id', $shop->user_id)->first();
            if ($seller->verification_status != 0) {
                return view('frontend.seller_shop', compact('shop'));
            } else {
                return view('frontend.seller_shop_without_verification', compact('shop', 'seller'));
            }
        }
        abort(404);
    }

    public function filter_shop($slug, $type)
    {
        $shop = Shop::where('slug', $slug)->first();
        if ($shop != null && $type != null) {
            return view('frontend.seller_shop', compact('shop', 'type'));
        }
        abort(404);
    }

    public function listing(Request $request)
    {
        // $products = filter_products(Product::orderBy('created_at', 'desc'))->paginate(12);
        // return view('frontend.product_listing', compact('products'));
        return $this->search($request);
    }

    public function all_categories(Request $request)
    {
        $categories = Category::all();
        return view('frontend.all_category', compact('categories'));
    }

    public function all_brands(Request $request)
    {
        $categories = Category::all();
        return view('frontend.all_brand', compact('categories'));
    }

    public function show_product_upload_form(Request $request)
    {
        if (\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated) {
            $categories = Category::all();
            return view('frontend.user.seller.product_upload', compact('categories'));
            // if (Auth::user()->seller->remaining_uploads > 0) {
            // } else {
            //     flash(translate('Upload limit has been reached. Please upgrade your package.'))->warning();
            //     return back();
            // }
        }
        $categories = Category::all();
        return view('frontend.user.seller.product_upload', compact('categories'));
    }

    public function add_products_order($order_id)
    {
        $order = Order::findOrFail($order_id);
        $status = $order->orderDetails->first()->delivery_status;
        if ($status == 'delivered') {
            foreach ($order->orderDetails as $order_product) {
                $product = Product::find($order_product->product_id);
                $newProduct = $product->replicate();
                $newProduct->user_id = Auth::user()->id; //change seller_id with buyer_id
                $newProduct->current_stock = $order_product->quantity??1; //change current_stock with qty
                $newProduct->save();
            }
        }
        flash(translate('Product has been inserted successfully'))->success();
        return redirect()->route('seller.products');


    }

    public function show_product_edit_form(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        $lang = $request->lang;
        $tags = json_decode($product->tags);
        $categories = Category::all();
        return view('frontend.user.seller.product_edit', compact('product', 'categories', 'tags', 'lang'));
    }

    public function seller_product_list(Request $request)
    {
        $search = null;
        $products = Product::where('user_id', Auth::user()->id)->where('digital', 0)->orderBy('created_at', 'desc');
        if ($request->has('search')) {
            $search = $request->search;
            $products = $products->where('name', 'like', '%' . $search . '%');
        }
        $products = $products->paginate(10);
        return view('frontend.user.seller.products', compact('products', 'search'));
    }

    public function ajax_search(Request $request)
    {
        $keywords = array();
        $products = Product::where('published', 1)->where('tags', 'like', '%' . $request->search . '%')->get();
        foreach ($products as $key => $product) {
            foreach (explode(',', $product->tags) as $key => $tag) {
                if (stripos($tag, $request->search) !== false) {
                    if (sizeof($keywords) > 5) {
                        break;
                    } else {
                        if (!in_array(strtolower($tag), $keywords)) {
                            array_push($keywords, strtolower($tag));
                        }
                    }
                }
            }
        }

        $products = filter_products(Product::where('published', 1)->where('name', 'like', '%' . $request->search . '%'))->get()->take(3);

        $subsubcategories = SubSubCategory::where('name', 'like', '%' . $request->search . '%')->get()->take(3);

        $shops = Shop::whereIn('user_id', verified_sellers_id())->where('name', 'like', '%' . $request->search . '%')->get()->take(3);

        if (sizeof($keywords) > 0 || sizeof($subsubcategories) > 0 || sizeof($products) > 0 || sizeof($shops) > 0) {
            return view('frontend.partials.search_content', compact('products', 'subsubcategories', 'keywords', 'shops'));
        }
        return '0';
    }

    public function search(Request $request)
    {
        $query = $request->q;
        $brand_id = (Brand::where('slug', $request->brand)->first() != null) ? Brand::where('slug', $request->brand)->first()->id : null;
        $sort_by = $request->sort_by;
        $category_id = (Category::where('slug', $request->category)->first() != null) ? Category::where('slug', $request->category)->first()->id : null;
        $subcategory_id = (SubCategory::where('slug', $request->subcategory)->first() != null) ? SubCategory::where('slug', $request->subcategory)->first()->id : null;
        $subsubcategory_id = (SubSubCategory::where('slug', $request->subsubcategory)->first() != null) ? SubSubCategory::where('slug', $request->subsubcategory)->first()->id : null;
        $min_price = $request->min_price;
        $max_price = $request->max_price;
        $seller_id = $request->seller_id;

        $conditions = ['published' => 1];

        if ($brand_id != null) {
            $conditions = array_merge($conditions, ['brand_id' => $brand_id]);
        }
        if ($category_id != null) {
            $conditions = array_merge($conditions, ['category_id' => $category_id]);
        }
        if ($subcategory_id != null) {
            $conditions = array_merge($conditions, ['subcategory_id' => $subcategory_id]);
        }
        if ($subsubcategory_id != null) {
            $conditions = array_merge($conditions, ['subsubcategory_id' => $subsubcategory_id]);
        }
        if ($seller_id != null) {
            $conditions = array_merge($conditions, ['user_id' => Seller::findOrFail($seller_id)->user->id]);
        }

        $products = Product::where($conditions);

        if ($min_price != null && $max_price != null) {
            $products = $products->where('unit_price', '>=', $min_price)->where('unit_price', '<=', $max_price);
        }

        if ($query != null) {
            $searchController = new SearchController;
            $searchController->store($request);
            $products = $products->where('name', 'like', '%' . $query . '%')->orWhere('tags', 'like', '%' . $query . '%');
        }

        if ($sort_by != null) {
            switch ($sort_by) {
                case '1':
                    $products->orderBy('created_at', 'desc');
                    break;
                case '2':
                    $products->orderBy('created_at', 'asc');
                    break;
                case '3':
                    $products->orderBy('unit_price', 'asc');
                    break;
                case '4':
                    $products->orderBy('unit_price', 'desc');
                    break;
                default:
                    // code...
                    break;
            }
        }

        $non_paginate_products = filter_products($products)->get();

        //Attribute Filter

        $attributes = array();
        foreach ($non_paginate_products as $key => $product) {
            if ($product->attributes != null && is_array(json_decode($product->attributes))) {
                foreach (json_decode($product->attributes) as $key => $value) {
                    $flag = false;
                    $pos = 0;
                    foreach ($attributes as $key => $attribute) {
                        if ($attribute['id'] == $value) {
                            $flag = true;
                            $pos = $key;
                            break;
                        }
                    }
                    if (!$flag) {
                        $item['id'] = $value;
                        $item['values'] = array();
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                $item['values'] = $choice_option->values;
                                break;
                            }
                        }
                        array_push($attributes, $item);
                    } else {
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if ($choice_option->attribute_id == $value) {
                                foreach ($choice_option->values as $key => $value) {
                                    if (!in_array($value, $attributes[$pos]['values'])) {
                                        array_push($attributes[$pos]['values'], $value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        $selected_attributes = array();

        foreach ($attributes as $key => $attribute) {
            if ($request->has('attribute_' . $attribute['id'])) {
                foreach ($request['attribute_' . $attribute['id']] as $key => $value) {
                    $str = '"' . $value . '"';
                    $products = $products->where('choice_options', 'like', '%' . $str . '%');
                }

                $item['id'] = $attribute['id'];
                $item['values'] = $request['attribute_' . $attribute['id']];
                array_push($selected_attributes, $item);
            }
        }


        //Color Filter
        $all_colors = array();

        foreach ($non_paginate_products as $key => $product) {
            if ($product->colors != null) {
                foreach (json_decode($product->colors) as $key => $color) {
                    if (!in_array($color, $all_colors)) {
                        array_push($all_colors, $color);
                    }
                }
            }
        }

        $selected_color = null;

        if ($request->has('color')) {
            $str = '"' . $request->color . '"';
            $products = $products->where('colors', 'like', '%' . $str . '%');
            $selected_color = $request->color;
        }


        $products = filter_products($products)->paginate(12)->appends(request()->query());
        return view('frontend.product_listing', compact('products', 'query', 'category_id', 'subcategory_id', 'subsubcategory_id', 'brand_id', 'sort_by', 'seller_id', 'min_price', 'max_price', 'attributes', 'selected_attributes', 'all_colors', 'selected_color'));
    }

    public function product_content(Request $request)
    {
        $connector = $request->connector;
        $selector = $request->selector;
        $select = $request->select;
        $type = $request->type;
        productDescCache($connector, $selector, $select, $type);
    }

    public function home_settings(Request $request)
    {
        return view('home_settings.index');
    }

    public function top_10_settings(Request $request)
    {
        foreach (Category::all() as $key => $category) {
            if (is_array($request->top_categories) && in_array($category->id, $request->top_categories)) {
                $category->top = 1;
                $category->save();
            } else {
                $category->top = 0;
                $category->save();
            }
        }

        foreach (Brand::all() as $key => $brand) {
            if (is_array($request->top_brands) && in_array($brand->id, $request->top_brands)) {
                $brand->top = 1;
                $brand->save();
            } else {
                $brand->top = 0;
                $brand->save();
            }
        }

        flash(translate('Top 10 categories and brands have been updated successfully'))->success();
        return redirect()->route('home_settings.index');
    }

    public function variant_price(Request $request)
    {
        $product = Product::find($request->id);
        $str = '';
        $quantity = 0;


        if ($request->has('color')) {
            $data['color'] = $request['color'];
            $str = Color::where('code', $request['color'])->first()->name;
        }

        if (json_decode(Product::find($request->id)->choice_options) != null) {
            foreach (json_decode(Product::find($request->id)->choice_options) as $key => $choice) {
                if ($str != null) {
                    $str .= '-' . str_replace(' ', '', $request['attribute_id_' . $choice->attribute_id]);
                } else {
                    $str .= str_replace(' ', '', $request['attribute_id_' . $choice->attribute_id]);
                }
            }
        }


        if ($str != null && $product->variant_product) {
            $product_stock = $product->stocks->where('variant', $str)->first();
            if($request->price_type == 'wholesale_price') {
                $price = $product->wholesale_price;
            } else {
                $price = $product_stock->price;
            }
            $quantity = $product_stock->qty;
        } else {
            if($request->price_type == 'wholesale_price') {
                $price = $product->wholesale_price;
            } else {
                $price = $product->unit_price;
            }
            $quantity = $product->current_stock;
        }

        //discount calculation
        $flash_deals = \App\FlashDeal::where('status', 1)->get();
        $inFlashDeal = false;
        foreach ($flash_deals as $key => $flash_deal) {
            if ($flash_deal != null && $flash_deal->status == 1 && strtotime(date('d-m-Y')) >= $flash_deal->start_date && strtotime(date('d-m-Y')) <= $flash_deal->end_date && \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first() != null) {
                $flash_deal_product = \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first();
                if ($flash_deal_product->discount_type == 'percent') {
                    $price -= ($price * $flash_deal_product->discount) / 100;
                } elseif ($flash_deal_product->discount_type == 'amount') {
                    $price -= $flash_deal_product->discount;
                }
                $inFlashDeal = true;
                break;
            }
        }
        if (!$inFlashDeal) {
            if ($product->discount_type == 'percent') {
                if($request->price_type == 'wholesale_price') {
                    $price -= ($price * $product->wholesale_discount) / 100;
                } else {
                    $price -= ($price * $product->discount) / 100;
                }
            } elseif ($product->discount_type == 'amount') {
                if($request->price_type == 'wholesale_price') {
                $price -= $product->wholesale_discount;
                } else {
                $price -= $product->discount;
                }
            }
        }

        return array('price' => single_price($price * $request->quantity), 'quantity' => $quantity, 'digital' => $product->digital);
    }

    public function sellerpolicy()
    {
        return view("frontend.policies.sellerpolicy");
    }

    public function returnpolicy()
    {
        return view("frontend.policies.returnpolicy");
    }

    public function supportpolicy()
    {
        return view("frontend.policies.supportpolicy");
    }

    public function terms()
    {
        return view("frontend.policies.terms");
    }

    public function privacypolicy()
    {
        return view("frontend.policies.privacypolicy");
    }

    public function get_pick_ip_points(Request $request)
    {
        $pick_up_points = PickupPoint::all();
        return view('frontend.partials.pick_up_points', compact('pick_up_points'));
    }

    public function get_category_items(Request $request)
    {
        $category = Category::findOrFail($request->id);
        return view('frontend.partials.category_elements', compact('category'));
    }

    public function premium_package_index()
    {
        $customer_packages = CustomerPackage::all();
        return view('frontend.user.customer_packages_lists', compact('customer_packages'));
    }

    public function seller_digital_product_list(Request $request)
    {
        $products = Product::where('user_id', Auth::user()->id)->where('digital', 1)->orderBy('created_at', 'desc')->paginate(10);
        return view('frontend.user.seller.digitalproducts.products', compact('products'));
    }

    public function show_digital_product_upload_form(Request $request)
    {
        $business_settings = BusinessSetting::where('type', 'digital_product_upload')->first();
        $categories = Category::where('digital', 1)->get();
        if(count($categories) > 0) {
            return view('frontend.user.seller.digitalproducts.product_upload', compact('categories'));
            if (\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated) {
                if (Auth::user()->seller->remaining_digital_uploads > 0) {
                } else {
                    flash(translate('Upload limit has been reached. Please upgrade your package.'))->warning();
                    return back();
                }
            }
        } else {
            flash(translate("you have not any digital categories !"))->error();
            return redirect()->back();
        }

        $business_settings = BusinessSetting::where('type', 'digital_product_upload')->first();
        $categories = Category::where('digital', 1)->get();
        return view('frontend.user.seller.digitalproducts.product_upload', compact('categories'));
    }

    public function show_digital_product_edit_form(Request $request, $id)
    {
        $categories = Category::where('digital', 1)->get();
        $lang = $request->lang;
        $product = Product::find($id);
        return view('frontend.user.seller.digitalproducts.product_edit', compact('categories', 'product', 'lang'));
    }

    // Ajax call
    public function new_verify(Request $request)
    {
        $email = $request->email;
        if (isUnique($email) == '0') {
            $response['status'] = 2;
            $response['message'] = 'Email already exists!';
            return json_encode($response);
        }

        $response = $this->send_email_change_verification_mail($request, $email);
        return json_encode($response);
    }


    // Form request
    public function update_email(Request $request)
    {
        $email = $request->email;
        if (isUnique($email)) {
            $this->send_email_change_verification_mail($request, $email);
            flash(translate('A verification mail has been sent to the mail you provided us with.'))->success();
            return back();
        }

        flash(translate('Email already exists!'))->warning();
        return back();
    }

    public function send_email_change_verification_mail($request, $email)
    {
        $response['status'] = 0;
        $response['message'] = 'Unknown';

        $verification_code = Str::random(32);

        $array['subject'] = 'Email Verification';
        $array['from'] = env('MAIL_USERNAME');
        $array['content'] = 'Verify your account';
        $array['link'] = route('email_change.callback') . '?new_email_verificiation_code=' . $verification_code . '&email=' . $email;
        $array['sender'] = Auth::user()->name;
        $array['details'] = "Email Second";

        $user = Auth::user();
        $user->new_email_verificiation_code = $verification_code;
        $user->save();

        try {
            Mail::to($email)->queue(new SecondEmailVerifyMailManager($array));

            $response['status'] = 1;
            $response['message'] = translate("Your verification mail has been Sent to your email.");

        } catch (\Exception $e) {
            // return $e->getMessage();
            $response['status'] = 0;
            $response['message'] = $e->getMessage();
        }

        return $response;
    }

    public function email_change_callback(Request $request)
    {
        if ($request->has('new_email_verificiation_code') && $request->has('email')) {
            $verification_code_of_url_param = $request->input('new_email_verificiation_code');
            $user = User::where('new_email_verificiation_code', $verification_code_of_url_param)->first();

            if ($user != null) {

                $user->email = $request->input('email');
                $user->new_email_verificiation_code = null;
                $user->save();

                auth()->login($user, true);

                flash(translate('Email Changed successfully'))->success();
                return redirect()->route('dashboard');
            }
        }

        flash(translate('Email was not verified. Please resend your mail!'))->error();
        return redirect()->route('dashboard');

    }
}
