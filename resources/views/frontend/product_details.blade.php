@extends('frontend.layouts.app')

@section('meta_title'){{ $detailedProduct->meta_title }}@stop

@section('meta_description'){{ $detailedProduct->meta_description }}@stop

@section('meta_keywords'){{ $detailedProduct->tags }}@stop

@section('meta')
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ $detailedProduct->meta_title }}">
    <meta itemprop="description" content="{{ $detailedProduct->meta_description }}">
    <meta itemprop="image" content="{{ uploaded_asset($detailedProduct->meta_img) }}">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="product">
    <meta name="twitter:site" content="@publisher_handle">
    <meta name="twitter:title" content="{{ $detailedProduct->meta_title }}">
    <meta name="twitter:description" content="{{ $detailedProduct->meta_description }}">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image" content="{{ uploaded_asset($detailedProduct->meta_img) }}">
    <meta name="twitter:data1" content="{{ single_price($detailedProduct->unit_price) }}">
    <meta name="twitter:label1" content="Price">

    <!-- Open Graph data -->
    <meta property="og:title" content="{{ $detailedProduct->meta_title }}" />
    <meta property="og:type" content="og:product" />
    <meta property="og:url" content="{{ route('product', $detailedProduct->slug) }}" />
    <meta property="og:image" content="{{ uploaded_asset($detailedProduct->meta_img) }}" />
    <meta property="og:description" content="{{ $detailedProduct->meta_description }}" />
    <meta property="og:site_name" content="{{ get_setting('meta_title') }}" />
    <meta property="og:price:amount" content="{{ single_price($detailedProduct->unit_price) }}" />
    <meta property="product:price:currency" content="{{ \App\Currency::findOrFail(\App\BusinessSetting::where('type', 'system_default_currency')->first()->value)->code }}" />
    <meta property="fb:app_id" content="{{ env('FACEBOOK_PIXEL_ID') }}">
@endsection

@section('content')
    <section class="mb-4 pt-3">
        <div class="container">
            <div class="bg-white shadow-sm rounded p-3">
                <div class="row">
                    <div class="col-xl-5 col-lg-7">
                        <div class="sticky-top z-3 row gutters-10 flex-row-reverse">
                            @php
                                $photos = explode(',',$detailedProduct->photos);
                            @endphp
                            <div class="col-md-12">
                                <input id="dir-lang" type="hidden" data-value="@if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)left @else right @endif" >
                                <div class="aiz-carousel product-gallery" data-nav-for='.product-gallery-thumb' id="img-container" data-fade='true'>
                                    <div id="off_zoom" class="carousel-box off_zoom old_img  " >
                                        <img
                                            class="img-fluid lazyload rounded  w-100 mx-auto"
                                            src="{{ uploaded_asset($detailedProduct->thumbnail_img) }}"
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                        >
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="aiz-carousel  carousel-thumb product-gallery-thumb"
                                    data-items='4' data-nav-for='.product-gallery'  data-vertical='false'
                                    data-focus-select='true' data-arrows='false'>
                                    @foreach ($photos as $key => $photo)
                                    <div class="carousel-box c-pointer border">
                                        <img style="width:100%; height: 100px" onclick="show_img($(this))"
                                            class="lazyload"
                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            data-src="{{ uploaded_asset($photo) }}"
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                        >
                                    </div>

                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-7 col-lg-5">
                        <div class="text-left">
                            <h1 class="mb-2 fs-20 fw-600">
                                {{ $detailedProduct->getTranslation('name') }}
                            </h1>

                            <div class="row align-items-center">

                                <div class="col-6">
                                    @php
                                        $total = 0;
                                        $total += $detailedProduct->reviews->count();
                                    @endphp
                                    <span class="rating">
                                        {{ renderStarRating($detailedProduct->rating) }}
                                    </span>
                                    <span class="ml-1 ">({{ $total }} {{ translate('reviews')}})</span>
                                </div>
                                <div class="col-6 text-right">
                                    @php
                                        $qty = 0;
                                        if($detailedProduct->variant_product){
                                            foreach ($detailedProduct->stocks as $key => $stock) {
                                                $qty += $stock->qty;
                                            }
                                        }
                                        else{
                                            $qty = $detailedProduct->current_stock;
                                        }
                                    @endphp
                                    @if ($qty > 0)
                                        <span class="badge badge-md badge-inline badge-pill badge-success">{{ translate('In stock')}}</span>
                                    @else
                                        <span class="badge badge-md badge-inline badge-pill badge-danger">{{ translate('Out of stock')}}</span>
                                    @endif
                                </div>
                            </div>

                            <hr>

                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <small class="mr-2 ">{{ translate('Sold by')}}: </small>
                                    @if ($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                                        <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}" class="text-reset">{{ $detailedProduct->user->shop->name }}</a>
                                    @else
                                        {{  translate('Inhouse product') }}
                                    @endif
                                </div>
                                @if ($detailedProduct->brand != null)
                                    <div class="col-auto">
                                        <img src="{{ uploaded_asset($detailedProduct->brand->logo) }}" alt="{{ $detailedProduct->brand->getTranslation('name') }}" height="30">
                                    </div>
                                @endif
                            </div>

                            <div class="row no-gutters mt-3">
                                <div class="col-sm-2">
                                    <div class=" my-2">{{ translate('Price')}}:</div>
                                </div>
                                <div class="col-sm-10">
                                    <div class="fs-20 opacity-60 text-gold">
                                        <del class>
                                            @if(request('unit_price'))
                                            {{ home_price($detailedProduct->id) }}
                                            <span>/{{ \App\unit::find(1)->name }}</span>
                                            @else
                                            {{ home_price($detailedProduct->id, 'wholesale_price') }}
                                            <span>/{{ \App\unit::find(2)->name }}</span>
                                            @endif
                                        </del>
                                    </div>
                                </div>
                            </div>

                            <div class="row no-gutters my-2">
                                <div class="col-sm-2">
                                    <div class="">{{ translate('Discount Price')}}:</div>
                                </div>

                                <div class="col-sm-10">
                                    <div class="">
                                        @if(request('unit_price'))
                                            <strong class="h2 fw-600 text-gold">
                                                {{ home_discounted_price($detailedProduct->id) }}
                                            </strong>
                                            <span>/{{ \App\unit::find(1)->name }}</span>
                                        @else
                                            <strong class="h2 fw-600 text-gold">
                                                {{ home_discounted_price($detailedProduct->id, 'wholesale_price') }}
                                            </strong>
                                            <span>/{{ \App\unit::find(2)->name }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row no-gutters mt-3">
                                    <div class="col-sm-2">
                                        <div class=" my-2">{{ translate('model')}}:</div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="fs-20 opacity-60">


                                                    <span>{{$detailedProduct['model']}}</span>


                                        </div>
                                    </div>
                                </div>
                            @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated && $detailedProduct->earn_point > 0)
                                <div class="row no-gutters mt-4">
                                    <div class="col-sm-2">
                                        <div class=" my-2">{{  translate('Club Point') }}:</div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="d-inline-block rounded px-2 bg-soft-primary border-soft-primary border">
                                            <span class="strong-700">{{ $detailedProduct->earn_point }}</span>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <hr>

                            <form id="option-choice-form" >
                                @csrf
                                 <input type="hidden" name="upsale_id" id="upsale_value" >
                                 @if(!request('unit_price'))
                                    <input type="hidden" name="price_type" value="wholesale_price">
                                 @endif
                                <input type="hidden" name="id" value="{{ $detailedProduct->id }}">

                                @if ($detailedProduct->choice_options != null)
                                    @foreach (json_decode($detailedProduct->choice_options) as $key => $choice)

                                    <div class="row no-gutters">
                                        <div class="col-sm-2">
                                            <div class=" my-2">{{ \App\Attribute::find($choice->attribute_id)->getTranslation('name') }}:</div>
                                        </div>
                                        <div class="col-sm-10">
                                            <div class="aiz-radio-inline">
                                                @foreach ($choice->values as $key => $value)
                                                <label class="aiz-megabox pl-0 mr-2">
                                                    <input
                                                        type="radio"
                                                        name="attribute_id_{{ $choice->attribute_id }}"
                                                        value="{{ $value }}"
                                                        @if($key == 0) checked @endif
                                                    >
                                                    <span class="aiz-megabox-elem rounded d-flex align-items-center justify-content-center py-2 px-3 mb-2">
                                                        {{ $value }}
                                                    </span>
                                                </label>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>

                                    @endforeach
                                @endif

                                @if (count(json_decode($detailedProduct->colors)) > 0)
                                    <div class="row no-gutters">
                                        <div class="col-sm-2">
                                            <div class=" my-2">{{ translate('Color')}}:</div>
                                        </div>
                                        <div class="col-sm-10">
                                            <div class="aiz-radio-inline">
                                                @foreach (json_decode($detailedProduct->colors) as $key => $color)
                                                <label class="aiz-megabox pl-0 mr-2" data-toggle="tooltip" data-title="{{ \App\Color::where('code', $color)->first()->name }}">
                                                    <input
                                                        type="radio"
                                                        name="color"
                                                        value="{{ $color }}"
                                                        @if($key == 0) checked @endif
                                                    >
                                                    <span class="aiz-megabox-elem rounded d-flex align-items-center justify-content-center p-1 mb-2">
                                                        <span class="size-30px d-inline-block rounded" style="background: {{ $color }};"></span>
                                                    </span>
                                                </label>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                @endif

                                <!-- Quantity + Add to cart -->
                                <div class="row no-gutters">
                                    <div class="col-sm-2">
                                        <div class=" my-2">{{ translate('Quantity')}}:</div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="product-quantity d-flex align-items-center">
                                            <div class="row no-gutters align-items-center aiz-plus-minus mr-3" style="width: 130px;" id="produ_id" data-id="{{$detailedProduct['id']}}">
                                                <button class="btn col-auto btn-icon btn-sm btn-circle btn-light" type="button" data-type="minus" data-field="quantity" disabled="">
                                                    <i class="las la-minus"></i>
                                                </button>
                                                <input type="text" name="quantity" class="col border-0 text-center flex-grow-1 fs-16 input-number" placeholder="1" value="{{ $detailedProduct->min_qty }}" min="{{ $detailedProduct->min_qty }}" max="10" readonly>
                                                <button class="btn  col-auto btn-icon btn-sm btn-circle btn-light" type="button" data-type="plus" data-field="quantity">
                                                    <i class="las la-plus"></i>
                                                </button>
                                            </div>
                                            <!--<div class="avialable-amount opacity-60">(<span id="available-quantity">{{ $qty }}</span> {{ translate('available')}})</div>-->
                                        </div>
                                    </div>
                                </div>
                                <hr>


                                <div class="row no-gutters pb-3 d-none" id="chosen_price_div">
                                    <div class="col-sm-2">
                                        <div class="my-2">{{ translate('Total Price')}}:</div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="product-price">
                                            <strong id="chosen_price" class="h4 fw-600 text-gold">

                                            </strong>
                                        </div>
                                    </div>
                                </div>
                                @if(auth()->user()&& auth()->user()['wholesale_active']==1)

                               @else
                                <div id="upsale" >

                                      @if(!empty($detailedProduct['product_saller']->where('number',1) ))
                     <div class="bg-white rounded shadow-sm">
                        <div class="border-bottom action_upslae">
                              @foreach($detailedProduct['product_saller']->where('number',) as $upsale)
                              @if(count($upsale['upsale'])>1)
                            <h3 class="fs-16 fw-600 mb-0">
                                <span class="mr-4">احصل علي احد العروض الاتية </span>
                            </h3>
                        </div>
                         <select class="form-control" id="select_upsale" >
                         <option value="" >  أختر احدى الهدايا التالية</option>
                          @foreach($upsale['upsale']  as $product )
                          <option value="{{$product['pivot']['id']}}">

                             {{ $product->getTranslation('name') }} SR{{$product['pivot']['discount']}}
                          </option>

                          @endforeach

                     </select>



                         @endif

                                @endforeach
                    </div>
                    @endif

                                </div>
                                 <div id="show_upsale">


                                </div>
                              @endif

                            </form>

                            <div class="mt-3">
                                @if ($qty > 0)
                                    <button type="button" class="btn btn-soft-primary mr-2 add-to-cart fw-600" onclick="addToCart()">
                                        <i class="las la-shopping-bag"></i>
                                        <span class="d-none d-md-inline-block"> {{ translate('Add to cart')}}</span>
                                    </button>
                                    {{-- <button type="button" class="btn btn-primary buy-now fw-600" onclick="buyNow()">
                                        <i class="la la-shopping-cart"></i> {{ translate('Buy Now')}}
                                    </button> --}}
                                @else
                                    <button type="button" class="btn btn-secondary fw-600" disabled>
                                        <i class="la la-cart-arrow-down"></i> {{ translate('Out of Stock')}}
                                    </button>
                                @endif
                            </div>



                            <div class="d-table width-100 mt-3">
                                <div class="d-table-cell">
                                    <!-- Add to wishlist button -->
                                    <button type="button" class="btn pl-0 btn-link fw-600" onclick="addToWishList({{ $detailedProduct->id }})">
                                        {{ translate('Add to wishlist')}}
                                    </button>
                                    <!-- Add to compare button -->
                                    <button type="button" class="btn btn-link btn-icon-left fw-600" onclick="addToCompare({{ $detailedProduct->id }})">
                                        {{ translate('Add to compare')}}
                                    </button>
                                    @if(Auth::check() && \App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated && (\App\AffiliateOption::where('type', 'product_sharing')->first()->status || \App\AffiliateOption::where('type', 'category_wise_affiliate')->first()->status) && Auth::user()->affiliate_user != null && Auth::user()->affiliate_user->status)
                                        @php
                                            if(Auth::check()){
                                                if(Auth::user()->referral_code == null){
                                                    Auth::user()->referral_code = substr(Auth::user()->id.Str::random(10), 0, 10);
                                                    Auth::user()->save();
                                                }
                                                $referral_code = Auth::user()->referral_code;
                                            }
                                        @endphp
                                        <button type="button" id="ref-cpurl-btn" class="btn btn-sm btn-secondary" data-attrcpy="{{ translate('Copied')}}" onclick="CopyToClipboard('{{ $referral_code }}')">{{ translate('Copy the Promote Link')}}</button>
                                    @endif
                                </div>
                            </div>


                            @php
                                $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
                                $refund_sticker = \App\BusinessSetting::where('type', 'refund_sticker')->first();
                            @endphp
                            @if ($refund_request_addon != null && $refund_request_addon->activated == 1 && $detailedProduct->refundable)
                                <div class="row no-gutters mt-4">
                                    <div class="col-sm-2">
                                        <div class=" my-2">{{ translate('Refund')}}:</div>
                                    </div>
                                    <div class="col-sm-10">
                                        <a href="{{ route('returnpolicy') }}" target="_blank">
                                            @if ($refund_sticker != null && $refund_sticker->value != null)
                                                <img src="{{ uploaded_asset($refund_sticker->value) }}" height="36">
                                            @else
                                                <img src="{{ static_asset('assets/img/refund-sticker.jpg') }}" height="36">
                                            @endif
                                        </a>
                                        <a href="{{ route('returnpolicy') }}" class="ml-2" target="_blank">View Policy</a>
                                    </div>
                                </div>
                            @endif
                            <div class="row no-gutters mt-4">
                                <div class="col-sm-2">
                                    <div class=" my-2">{{ translate('Share')}}:</div>
                                </div>
                                <div class="col-sm-10">
                                    <div class="aiz-share"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                <div class="col-xl-3 order-1 order-xl-0">
                    <div class="bg-white shadow-sm mb-3">
                        <div class="position-relative p-3 text-left">
                            @if ($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1 && $detailedProduct->user->seller->verification_status == 1)
                                <div class="absolute-top-right p-2 bg-white z-1">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" viewBox="0 0 287.5 442.2" width="22" height="34">
                                        <polygon style="fill:#F8B517;" points="223.4,442.2 143.8,376.7 64.1,442.2 64.1,215.3 223.4,215.3 "/>
                                        <circle style="fill:#FBD303;" cx="143.8" cy="143.8" r="143.8"/>
                                        <circle style="fill:#F8B517;" cx="143.8" cy="143.8" r="93.6"/>
                                        <polygon style="fill:#FCFCFD;" points="143.8,55.9 163.4,116.6 227.5,116.6 175.6,154.3 195.6,215.3 143.8,177.7 91.9,215.3 111.9,154.3
                                        60,116.6 124.1,116.6 "/>
                                    </svg>
                                </div>
                            @endif
                            <div class=" fs-12 border-bottom">{{ translate('Sold By')}}</div>
                            @if($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                                <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}" class="text-reset d-block fw-600">
                                    {{ $detailedProduct->user->shop->name }}
                                    @if ($detailedProduct->user->seller->verification_status == 1)
                                        <span class="ml-2"><i class="fa fa-check-circle" style="color:green"></i></span>
                                    @else
                                        <span class="ml-2"><i class="fa fa-times-circle" style="color:red"></i></span>
                                    @endif
                                </a>
                                <div class="location opacity-70">{{ $detailedProduct->user->shop->address }}</div>
                            @else
                                <div class="fw-600">{{ env("APP_NAME") }}</div>
                            @endif
                            @php
                                $total = 0;
                                $rating = 0;
                                foreach ($detailedProduct->user->products as $key => $seller_product) {
                                    $total += $seller_product->reviews->count();
                                    $rating += $seller_product->reviews->sum('rating');
                                }
                            @endphp

                            <div class="text-center border rounded p-2 mt-3">
                                <div class="rating">
                                    @if ($total > 0)
                                        {{ renderStarRating($rating/$total) }}
                                    @else
                                        {{ renderStarRating(0) }}
                                    @endif
                                </div>
                                <div class="opacity-60 fs-12">({{ $total }} {{ translate('customer reviews')}})</div>
                            </div>
                        </div>
                        @if($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                            <div class="row no-gutters align-items-center border-top">
                                <div class="col-6">
                                    <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}" class="p-3 d-block btn btn-soft-primary rounded-0">{{ translate('Visit Store')}}</a>
                                </div>
                                <div class="col-6">
                                    <a href="" data-toggle="modal" data-target="#message_seller_{{ $detailedProduct->id }}" class="p-3 d-block btn btn-soft-primary rounded-0">{{ translate('Message Seller')}}</a>
                                </div>
                                <!-- change status Modal -->
                                <div id="message_seller_{{ $detailedProduct->id }}" class="modal fade">
                                    <div class="modal-dialog modal-sm modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title h6">{{ translate('basic information') }}</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form action="{{ route('message_seller') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="product_id" value="{{ $detailedProduct->id }}" id="">
                                                    <div class="form-group">
                                                        <label for="name">{{ translate('name') }}</label>
                                                        <input class="form-control" type="text" name="name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="name">{{ translate('phone') }}</label>
                                                        <input class="form-control" type="text" name="phone">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message">{{ translate('Message') }}</label>
                                                        <textarea class="form-control" name="message" placeholder="message" cols="30" rows="10">
                                                        </textarea>
                                                    </div>
                                                    <button type="button" class="btn btn-danger mt-2" data-dismiss="modal">{{translate('Cancel')}}</button>
                                                    <button type="submit" class="btn btn-success mt-2">{{translate('Save')}}</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <!-- /.change status -->
                            </div>
                            <div class="row">
                                <div class="col">
                                    <ul class="social list-inline mb-0">
                                        <li class="list-inline-item mr-0">
                                            <a href="{{ $detailedProduct->user->shop->facebook }}" class="facebook" target="_blank">
                                                <i class="lab la-facebook-f opacity-60"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item mr-0">
                                            <a href="{{ $detailedProduct->user->shop->google }}" class="google" target="_blank">
                                                <i class="lab la-google opacity-60"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item mr-0">
                                            <a href="{{ $detailedProduct->user->shop->twitter }}" class="twitter" target="_blank">
                                                <i class="lab la-twitter opacity-60"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="{{ $detailedProduct->user->shop->youtube }}" class="youtube" target="_blank">
                                                <i class="lab la-youtube opacity-60"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        @endif
                    </div>
                    <div class="bg-white rounded shadow-sm mb-3">
                        <div class="p-3 border-bottom fs-16 fw-600">
                            {{ translate('Top Selling Products')}}
                        </div>
                        <div class="p-3">
                            <ul class="list-group list-group-flush">
                                @foreach (filter_products(\App\Product::where('user_id', $detailedProduct->user_id)->orderBy('num_of_sale', 'desc'))->limit(6)->get() as $key => $top_product)
                                <li class="py-3 px-0 list-group-item border-light">
                                    <div class="row gutters-10 align-items-center">
                                        <div class="col-5">
                                            <a href="{{ route('product', $top_product->slug) }}" class="d-block text-reset">
                                                <img
                                                    class="img-fit lazyload rounded h-xl-80px h-120px img_w_100"
                                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                    data-src="{{ uploaded_asset($top_product->thumbnail_img) }}"
                                                    alt="{{ $top_product->getTranslation('name') }}"
                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                >
                                            </a>
                                        </div>
                                        <div class="col-7 text-left">
                                            <h4 class="fs-13 text-truncate-2">
                                                <a href="{{ route('product', $top_product->slug) }}" class="d-block text-reset">{{ $top_product->getTranslation('name') }}</a>
                                            </h4>
                                            <div class="rating rating-sm mt-1">
                                                {{ renderStarRating($top_product->rating) }}
                                            </div>
                                            <div class="mt-2">
                                                <span class="fs-17 fw-600 text-primary">
                                                    @if(request('unit_price'))
                                                        {{ home_discounted_base_price($top_product->id) }}
                                                    @else
                                                        {{ home_discounted_base_price($top_product->id, 'wholesale_price', true) }}
                                                    @endif
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 order-0 order-xl-1">
                    <div class="bg-white mb-3 shadow-sm rounded">
                        <div class="nav border-bottom aiz-nav-tabs">
                            <a href="#tab_default_1" data-toggle="tab" class="p-3 fs-16 fw-600 text-reset active show">{{ translate('Description')}}</a>
                            @if($detailedProduct->video_link != null)
                                <a href="#tab_default_2" data-toggle="tab" class="p-3 fs-16 fw-600 text-reset">{{ translate('Video')}}</a>
                            @endif
                            @if($detailedProduct->pdf != null)
                                <a href="#tab_default_3" data-toggle="tab" class="p-3 fs-16 fw-600 text-reset">{{ translate('Downloads')}}</a>
                            @endif
                                <a href="#tab_default_4" data-toggle="tab" class="p-3 fs-16 fw-600 text-reset">{{ translate('Reviews')}}</a>
                        </div>

                        <div class="tab-content pt-0">
                            <div class="tab-pane fade active show" id="tab_default_1">
                                <div class="p-4">
                                    <div class="mw-100 overflow-hidden text-left">
                                        <?php echo $detailedProduct->getTranslation('description'); ?>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab_default_2">
                                <div class="p-4">
                                    <div class="embed-responsive embed-responsive-16by9">
                                        @if ($detailedProduct->video_provider == 'youtube' && isset(explode('=', $detailedProduct->video_link)[1]))
                                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{{ explode('=', $detailedProduct->video_link)[1] }}"></iframe>
                                        @elseif ($detailedProduct->video_provider == 'dailymotion' && isset(explode('video/', $detailedProduct->video_link)[1]))
                                            <iframe class="embed-responsive-item" src="https://www.dailymotion.com/embed/video/{{ explode('video/', $detailedProduct->video_link)[1] }}"></iframe>
                                        @elseif ($detailedProduct->video_provider == 'vimeo' && isset(explode('vimeo.com/', $detailedProduct->video_link)[1]))
                                            <iframe src="https://player.vimeo.com/video/{{ explode('vimeo.com/', $detailedProduct->video_link)[1] }}" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_default_3">
                                <div class="p-4 text-center ">
                                    <a href="{{ uploaded_asset($detailedProduct->pdf) }}" class="btn btn-primary">{{  translate('Download') }}</a>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_default_4">
                                <div class="p-4">
                                    <ul class="list-group list-group-flush">
                                        @foreach ($detailedProduct->reviews as $key => $review)
                                            <li class="media list-group-item d-flex">
                                                <span class="avatar avatar-md mr-3">
                                                    <img
                                                        class="lazyload"
                                                        src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                        @if($review->user->avatar_original !=null)
                                                            data-src="{{ uploaded_asset($review->user->avatar_original) }}"
                                                        @else
                                                            data-src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        @endif
                                                    >
                                                </span>
                                                <div class="media-body text-left">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="fs-15 fw-600 mb-0">{{ $review->user->name }}</h3>
                                                        <span class="rating rating-sm">
                                                            @for ($i=0; $i < $review->rating; $i++)
                                                                <i class="las la-star active"></i>
                                                            @endfor
                                                            @for ($i=0; $i < 5-$review->rating; $i++)
                                                                <i class="las la-star"></i>
                                                            @endfor
                                                        </span>
                                                    </div>
                                                    <div class="opacity-60 mb-2">{{ date('d-m-Y', strtotime($review->created_at)) }}</div>
                                                    <p class="comment-text">
                                                        {{ $review->comment }}
                                                    </p>
                                                </div>
                                            </li>
                                        @endforeach
                                    </ul>

                                    @if(count($detailedProduct->reviews) <= 0)
                                        <div class="text-center fs-18 opacity-70">
                                            {{  translate('There have been no reviews for this product yet.') }}
                                        </div>
                                    @endif

                                    @if(Auth::check())
                                        @php
                                            $commentable = false;
                                        @endphp
                                        @foreach ($detailedProduct->orderDetails as $key => $orderDetail)
                                            @if($orderDetail->order != null && $orderDetail->order->user_id == Auth::user()->id && $orderDetail->delivery_status == 'delivered' && \App\Review::where('user_id', Auth::user()->id)->where('product_id', $detailedProduct->id)->first() == null)
                                                @php
                                                    $commentable = true;
                                                @endphp
                                            @endif
                                        @endforeach
                                        @if ($commentable)
                                            <div class="pt-4">
                                                <div class="border-bottom mb-4">
                                                    <h3 class="fs-17 fw-600">
                                                        {{ translate('Write a review')}}
                                                    </h3>
                                                </div>
                                                <form class="form-default" role="form" action="{{ route('reviews.store') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="product_id" value="{{ $detailedProduct->id }}">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase c-gray-light">{{ translate('Your name')}}</label>
                                                                <input type="text" name="name" value="{{ Auth::user()->name }}" class="form-control" disabled required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase c-gray-light">{{ translate('Email')}}</label>
                                                                <input type="text" name="email" value="{{ Auth::user()->email }}" class="form-control" required disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="opacity-60">{{ translate('Rating')}}</label>
                                                        <div class="rating rating-input">
                                                            <label>
                                                                <input type="radio" name="rating" value="1">
                                                                <i class="las la-star"></i>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="rating" value="2">
                                                                <i class="las la-star"></i>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="rating" value="3">
                                                                <i class="las la-star"></i>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="rating" value="4">
                                                                <i class="las la-star"></i>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="rating" value="5">
                                                                <i class="las la-star"></i>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="opacity-60">{{ translate('Comment')}}</label>
                                                        <textarea class="form-control" rows="4" name="comment" placeholder="{{ translate('Your review')}}" required></textarea>
                                                    </div>

                                                    <div class="text-right">
                                                        <button type="submit" class="btn btn-primary mt-3">
                                                            {{ translate('Submit review')}}
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        @endif
                                    @endif
                                </div>
                            </div>

                        </div>
                    </div>



                    @if(!empty($detailedProduct['crose_sale']))
                     <div class="bg-white rounded shadow-sm">
                        <div class="border-bottom p-3">
                            <h3 class="fs-16 fw-600 mb-0">
                                <span class="mr-4">{{ translate('crose products')}}</span>
                            </h3>
                        </div>
                        <div class="p-3">
                            <div class="aiz-carousel gutters-5 half-outside-arrow" data-items="5" data-xl-items="3" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true' data-infinite='true'>
                                @foreach (filter_products(\App\Product::wherein('id',json_decode($detailedProduct['crose_sale']) )->where('id', '!=', $detailedProduct->id))->limit(10)->get() as $key => $product)
                                 <div class="carousel-box">
                            <div class="aiz-card-box border border-light  hov-shadow-md my-2 has-transition">
                                <div class="position-relative">

                                      @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                <?php
                                $old=home_base_price($product->id,'desc');
                                $new=home_discounted_base_price($product->id,'desc');

                                 $value=round((($old-$new)/$old)*100,1);

                                ?>
                                    <span class="price_old">{{$value}}% خصم</span>
                                    @endif
                                      @if(!empty(get_coupon($product->id)))
                              <div class="product_coupon">
                                     {{translate('Coupon Discount')}} :
                                    {{get_coupon($product->id)}}
                                    </div>
                                    @endif

                                    <a href="{{ route('product', $product->slug) }}" class="d-block ">
                                <img
                                    class="img-fit   lazyload mx-auto h-140px h-md-210px"
                                    style="height:370px"
                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                    alt="{{  $product->getTranslation('name')  }}"
                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                >
                            </a>

                                </div>
                                <div class=" p-2 textalign text-center">
                                    <div class="fs-15 textalign">

                                         <div class="aiz-price_new">
                                        <a href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                                            <i class="la la-heart-o"></i>
                                        </a>
                                        <a href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                                            <i class="las la-sync"></i>
                                        </a>
                                        @if(count($product['product_saller'] )==0)

                                        <a href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                            <i class="las la-shopping-cart"></i>
                                        </a>
                                        @else
                                         <a href="{{ route('product', $product->slug) }}" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                            <i class="las la-shopping-cart"></i>
                                        </a>

                                        @endif
                                    </div>
                                          @if(auth()->user()&&auth()->user()['wholesale_active']==1)
                                        <span class="fw-700 text-primary">{{ price_wholesale($product->id) }}
                                       <span style="font-size: 11px;
                                            background: #foo;
                                            background: #fa0505;
                                            padding: 3px;
                                            color: #Ffff;
                                            margin: 3px;
                                            margin-top: 5px;
                                            display: inline-block;
                                            border-radius: 2px;">سعر الجملة
                                        </span>

                                        </span>
                                       @else
                                        @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                            <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id) }}</del>
                                        @endif
                                        <span class="fw-700 text-primary">{{ home_discounted_base_price($product->id) }}

                                        </span>
                                          @endif
                                    </div>
                                    <div class="rating rating-sm mt-1">
                                        {{ renderStarRating($product->rating) }}
                                    </div>
                                    <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px textalign">
                                        <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                    </h3>

                                    <!--@if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)-->
                                    <!--    <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">-->
                                    <!--        {{ translate('Club Point') }}:-->
                                    <!--        <span class="fw-700 float-right">{{ $product->earn_point }}</span>-->
                                    <!--    </div>-->
                                    <!--@endif-->
                                </div>
                            </div>
                        </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @endif

                    {{-- <div class="relatd-products bg-white rounded shadow-sm">
                        <div class="border-bottom p-3">
                            <h3 class="fs-16 fw-600 mb-0">
                                <span class="mr-4">{{ translate('Related products')}}</span>
                            </h3>
                        </div>
                        <div class="p-3">
                            <div class="aiz-carousel gutters-5 half-outside-arrow"
                                data-items="4" data-xl-items="5" data-lg-items="4"
                                data-md-items="2" data-sm-items="2" data-xs-items="2"
                                data-arrows='true' data-infinite='true'>
                                @if(request('unit_price'))
                                    @php
                                        $unit = \App\unit::find(1);
                                    @endphp
                                    @foreach (filter_products(\App\Product::where('category_id', $detailedProduct->category_id)->where('id', '!=', $detailedProduct->id))->limit(10)->get() as $key => $product)
                                        @foreach (json_decode($product->product_sell_type) as $type)
                                            @if($unit->id == $type)
                                                <div class="carousel-box">
                                                    <div class="aiz-card-box border border-light  hov-shadow-md my-2 has-transition">
                                                        <div class="position-relative">
                                                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                            <?php
                                                                $old=home_base_price($product->id,'desc');
                                                                $new=home_discounted_base_price($product->id,'desc');
                                                                $value=round((($old-$new)/$old)*100,1);
                                                            ?>
                                                                <span class="price_old">-{{$value}}%</span>
                                                            @endif
                                                            @if(!empty(get_coupon($product->id)))
                                                                <div class="product_coupon">
                                                                    {{translate('Coupon Discount')}} :
                                                                    {{get_coupon($product->id)}}
                                                                </div>
                                                            @endif
                                                            <a href="{{ route('product', $product->slug) }}" class="d-block ">
                                                                <img
                                                                    class="img-fit product-img lazyload mx-auto h-140px h-md-210px"
                                                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                                                    alt="{{  $product->getTranslation('name')  }}"
                                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                                >
                                                            </a>

                                                        </div>
                                                        <div class=" p-2 textalign text-center">
                                                            <div class="fs-15 textalign">
                                                                <div class="aiz-price_new">
                                                                    <a href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                                                                        <i class="la la-heart-o"></i>
                                                                    </a>
                                                                    <a href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                                                                        <i class="las la-sync"></i>
                                                                    </a>
                                                                    @if(count($product['product_saller'] )==0)
                                                                        <a href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                                            <i class="las la-shopping-cart"></i>
                                                                        </a>
                                                                    @else
                                                                        <a href="{{ route('product', $product->slug) }}" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                                            <i class="las la-shopping-cart"></i>
                                                                        </a>
                                                                    @endif
                                                                </div>
                                                                <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, null, true) }}</del>
                                                                <span class="fw-700 text-primary">{{ home_discounted_base_price($product->id, null, true) }}</span>
                                                            </div>
                                                            <div class="rating rating-sm mt-1">
                                                                {{ renderStarRating($product->rating) }}
                                                            </div>
                                                            <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px textalign">
                                                                <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                                            </h3>
                                                            <!--@if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)-->
                                                            <!--    <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">-->
                                                            <!--        {{ translate('Club Point') }}:-->
                                                            <!--        <span class="fw-700 float-right">{{ $product->earn_point }}</span>-->
                                                            <!--    </div>-->
                                                            <!--@endif-->
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif

                                        @endforeach
                                    @endforeach
                                @else
                                @php
                                        $unit = \App\unit::find(2);
                                @endphp
                                    @foreach (filter_products(\App\Product::where('category_id', $detailedProduct->category_id)->where('id', '!=', $detailedProduct->id))->limit(10)->get() as $key => $product)
                                        @foreach (json_decode($product->product_sell_type) as $type)
                                            @if($unit->id == $type)
                                                <div class="carousel-box">
                                                    <div class="aiz-card-box border border-light  hov-shadow-md my-2 has-transition">
                                                        <div class="position-relative">
                                                            @if(home_base_price($product->id, 'wholesale_price') != home_discounted_base_price($product->id, 'wholesale_price'))
                                                            <?php
                                                                $old=home_base_price($product->id,'wholesale_price');
                                                                $new=home_discounted_base_price($product->id,'wholesale_price');
                                                                $value=round((($old-$new)/$old)*100,1);
                                                            ?>
                                                                <span class="price_old">-{{$value}}%</span>
                                                            @endif
                                                            @if(!empty(get_coupon($product->id)))
                                                                <div class="product_coupon">
                                                                    {{translate('Coupon Discount')}} :
                                                                    {{get_coupon($product->id)}}
                                                                </div>
                                                            @endif
                                                            <a href="{{ route('product', $product->slug) }}" class="d-block ">
                                                                <img
                                                                    class="img-fit product-img lazyload mx-auto h-140px h-md-210px"
                                                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                                                    alt="{{  $product->getTranslation('name')  }}"
                                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                                >
                                                            </a>

                                                        </div>
                                                        <div class=" p-2 textalign text-center">
                                                            <div class="fs-15 textalign">
                                                                <div class="aiz-price_new">
                                                                    <a href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                                                                        <i class="la la-heart-o"></i>
                                                                    </a>
                                                                    <a href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                                                                        <i class="las la-sync"></i>
                                                                    </a>
                                                                    @if(count($product['product_saller'] )==0)
                                                                        <a href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                                            <i class="las la-shopping-cart"></i>
                                                                        </a>
                                                                    @else
                                                                        <a href="{{ route('product', $product->slug) }}" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                                            <i class="las la-shopping-cart"></i>
                                                                        </a>
                                                                    @endif
                                                                </div>
                                                                <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, 'wholesale_price', true) }}</del>
                                                                <span class="fw-700 text-primary">{{ home_discounted_base_price($product->id, 'wholesale_price', true) }}</span>
                                                            </div>
                                                            <div class="rating rating-sm mt-1">
                                                                {{ renderStarRating($product->rating) }}
                                                            </div>
                                                            <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px textalign">
                                                                <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                                            </h3>
                                                            <!--@if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)-->
                                                            <!--    <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">-->
                                                            <!--        {{ translate('Club Point') }}:-->
                                                            <!--        <span class="fw-700 float-right">{{ $product->earn_point }}</span>-->
                                                            <!--    </div>-->
                                                            <!--@endif-->
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif

                                        @endforeach
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div> --}}
                </div>
            </div>
        </div>
    </section>

@endsection

@section('script')
<script src="https://unpkg.com/js-image-zoom@0.7.0/js-image-zoom.js" type="application/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/js-image-zoom/js-image-zoom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            getVariantPrice();
    	});




    function upsale(number,id){

        $('#select_upsale').html("<option value=''>اختار احد العروض الاتية</option>");
        var option=[];
        $.ajax({
            type:'get',
            url:'{{route('get_upsale_product')}}',
            data:{'id':id,'number':number},
            success:function(data){
               console.log(data)
                if(data.length==0){
                    $('.action_upslae').fadeOut();
                }else{
                    for(i=0;i<data.length;i++){


  option +="<option value="+data[i]['pivot']['id']+">"+data[i]['name']+"-"+data[i]['pivot']['discount']+"<option>"


                    }

             $('#select_upsale').append(option);
                }

            }
        })
    }

  $('#select_upsale').change(function(){
       $('#show_upsale').html('');
      var value=$(this).val();
      if(value>0){
          $.ajax({
              type:'get',
              url:'{{route("get_upsale")}}',
              data:{'id':value},
              success:function(data){
                $('#show_upsale').append(data);

              }
          })
      }
  })
//
        function CopyToClipboard(affiliateCode) {
            let params = new URLSearchParams(window.location.search),
            affiliateLink = '';
            if(params.has('unit_price')) {
                affiliateLink = document.URL + '&product_referral_code=' + affiliateCode;
            } else {
                affiliateLink = document.URL + '?product_referral_code=' + affiliateCode;
            }
            navigator.clipboard.writeText(affiliateLink);
            AIZ.plugins.notify('success', 'Copied');
        }
        function show_img(element){
            $('.old_img').find('img').attr('src',$(element).data('src'))

            var dir=$('#dir-lang').data('value');
        if(dir==' right '){

              var options = {
    width: 400,
    zoomWidth: 500,
    zoomPosition:"right",
    offset: {vertical: 0, horizontal: 10}
  };
        }else{

              var options = {
    width: 400,
    zoomWidth: 500,
    zoomPosition:"left",
    offset: {vertical: 0, horizontal: 10}
  };
        }



 if($(document).width()>975){
             new ImageZoom(document.getElementById("img-container"), options);
            }

        }
        var dir=$('#dir-lang').data('value');
        if(dir==' right '){

              var options = {
    width: 400,
    zoomWidth: 500,
    zoomPosition:"right",
    offset: {vertical: 0, horizontal: 10}
  };
        }else{

              var options = {
    width: 400,
    zoomWidth: 500,
    zoomPosition:"left",
    offset: {vertical: 0, horizontal: 10}
  };
        }
         if($(document).width()>975){
             new ImageZoom(document.getElementById("img-container"), options);
            }

           	window.onresize = function(event) {






if($(document).width()>975){
    $('slick-slide').css('width','90%');
               new ImageZoom(document.getElementById("img-container"), options);
            }
}



    </script>
@endsection
