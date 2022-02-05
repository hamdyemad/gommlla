<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductTranslation;
use Storage;
use App\Language;
use Auth;
use Illuminate\Support\Facades\Session;

class DigitalProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sort_search    = null;
        $products       = Product::orderBy('created_at', 'desc');
        if ($request->has('search')){
            $sort_search    = $request->search;
            $products       = $products->where('name', 'like', '%'.$sort_search.'%');
        }
        $products = $products->where('digital', 1)->paginate(10);
        return view('backend.product.digital_products.index', compact('products','sort_search'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.product.digital_products.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product                    = new Product;
        $product->name              = $request->name;
        $product->added_by          = $request->added_by;
        $product->user_id           = Auth::user()->id;
        $product->digital           = 1;
        $product->category_id = $request->category_id;
        if($request->has('subcategory_id')) {
            $product->subcategory_id = $request->subcategory_id;
        }
        if($request->has('subsubcategory_id')) {
            $product->subcategory_id = $request->subsubcategory_id;
        }
        $product->subsubcategory_id = $request->subsubcategory_id;
        $product->brand_id = $request->brand_id;
        $product->current_stock = $request->current_stock;
        $product->barcode = $request->barcode;
        $product->wholesale_price = $request->wholesale_price;

        $product->refundable = 1;
        $product->photos = $request->photos;
        $product->thumbnail_img = explode(',', $request->photos)[0];
        $product->sale_unit = $request->unit;
        $product->unit_Purchase = $request->unit_Purchase;
        $product->min_qty = 1;
        $product->tags = implode('|', $request->tags);
        $product->description = $request->description;
        $product->wholesale_description = $request->wholesale_description;
        $product->video_provider = $request->video_provider;
        $product->video_link = $request->video_link;
        $product->unit_price = $request->unit_price;
        $product->purchase_price = $request->unit_price;
        $product->product_sell_type = json_encode($request->product_sell_type);
        $product->package_price = 0;
        $product->number_pieces_package = 0;
        $product->discount_type = $request->discount_type;
        $product->discount = $request->discount;
        $product->Wholesale_discount = $request->Wholesale_discount;

        $product->meta_title = $request->meta_title;
        $product->meta_description = $request->meta_description;
        if ($request->has('meta_img')) {
            $product->meta_img = $request->meta_img;
        } else {
            $product->meta_img = $product->thumbnail_img;
        }
        if ($product->meta_title == null) {
            $product->meta_title = $product->name;
        }

        if ($product->meta_description == null) {
            $product->meta_description = $product->description;
        }

        if($request->hasFile('file')){
            $product->file_name = $request->file('file')->getClientOriginalName();
            $product->file_path = $request->file('file')->store('uploads/products/digital');
        }

        $product->slug = rand(10000,99999).'-'.preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->name));

        if($product->save()){

            // Product Translations
            $product_translation = ProductTranslation::firstOrNew(['lang' => env('DEFAULT_LANGUAGE'), 'product_id' => $product->id]);
            $product_translation->lang = Session::get('locale');
            $product_translation->name = $request->name;
            $product_translation->unit = json_encode($request->product_sell_type);
            $product_translation->description = $request->description;
            $product_translation->wholesale_description = $request->wholesale_description;
            $product_translation->save();

            flash(translate('Digital Product has been inserted successfully'))->success();
            if(Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff'){
                return redirect()->route('digitalproducts.index');
            }
            else{
                if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
                    $seller = Auth::user()->seller;
                    $seller->remaining_digital_uploads -= 1;
                    $seller->save();
                }
                return redirect()->route('seller.digitalproducts');
            }
        }
        else{
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
    public function edit(Request $request, $id)
    {
        $lang = $request->lang;
        $product = Product::findOrFail($id);
        return view('backend.product.digital_products.edit', compact('product','lang'));
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
        $product                    = Product::findOrFail($id);
        if($request->lang == env("DEFAULT_LANGUAGE")){
            $product->name          = $request->name;
            $product->description   = $request->description;
        }

        $product->slug              = $request->slug;
        $product->user_id           = Auth::user()->id;
        $product->category_id       = $request->category_id;
        $product->subcategory_id    = $request->subcategory_id;
        $product->subsubcategory_id = $request->subsubcategory_id;
        $product->digital           = 1;
        $product->photos            = $request->photos;
        $product->thumbnail_img     = $request->thumbnail_img;
        $product->tags              = implode('|',$request->tags);
        $product->unit_price        = $request->unit_price;
        $product->purchase_price    = $request->purchase_price;
        $product->tax               = 0;
        $product->tax_type          = 'amount';
        $product->discount          = $request->discount;
        $product->discount_type     = $request->discount_type;

        $product->meta_title        = $request->meta_title;
        $product->meta_description  = $request->meta_description;
        $product->meta_img          = $request->meta_img;

        if($request->hasFile('file')){
            $product->file_name = $request->file('file')->getClientOriginalName();
            $product->file_path = $request->file('file')->store('uploads/products/digital');
        }

        if($product->save()){

            // Product Translations
            $product_translation                = ProductTranslation::firstOrNew(['lang' => $request->lang, 'product_id' => $product->id]);
            $product_translation->name          = $request->name;
            $product_translation->description   = $request->description;
            $product_translation->save();

            flash(translate('Digital Product has been inserted successfully'))->success();
            if(Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff'){
                return redirect()->route('digitalproducts.index');
            }
            else{
                return redirect()->route('seller.digitalproducts');
            }
        }
        else{
            flash(translate('Something went wrong'))->error();
            return back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        foreach ($product->product_translations as $key => $product_translation) {
            $product_translation->delete();
        }
        Product::destroy($id);

        flash(translate('Product has been deleted successfully'))->success();
        if(Auth::user()->user_type == 'admin'){
            return redirect()->route('digitalproducts.index');
        }
        else{
            return redirect()->route('seller.digitalproducts');
        }

    }


    public function download(Request $request){
        $product = Product::findOrFail(decrypt($request->id));
        $downloadable = false;
        foreach (Auth::user()->orders as $key => $order) {
            foreach ($order->orderDetails as $key => $orderDetail) {
                if($orderDetail->product_id == $product->id && $orderDetail->payment_status == 'paid'){
                    $downloadable = true;
                    break;
                }
            }
        }
        if(Auth::user()->user_type == 'admin' || Auth::user()->id == $product->user_id || $downloadable){

            return \Storage::disk('local')->download($product->file_path, $product->file_name);
        }
        else {
            abort(404);
        }
    }

    public function updatePublished(Request $request)
    {
        $product = DigitalProduct::findOrFail($request->id);
        $product->published = $request->status;
        if($product->save()){
            return 1;
        }
        return 0;
    }
}
