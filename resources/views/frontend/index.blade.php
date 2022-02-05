@extends('frontend.layouts.app')

@section('content')
    {{-- Categories , Sliders . Today's deal --}}
    <div class="home-banner-area">
        {{-- Start Categoires --}}
        <div class="d-none d-md-block gutters-12 position-relative bg-primary" style="color:#fff">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            <a href="{{route('home'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                                <span class="fw-600 fs-16">{{translate('home') }} </span>
                            </a>
                        </div>
                    </div>
                    <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            <a href="{{route('categories.all'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                                <span
                                    class="fw-600 fs-16"> {{ translate('categories') }}</span>
                            </a>
                        </div>
                    </div>
                    <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            <a href="{{route('home'). '?unit_price='. true . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                                <span
                                    class="fw-600 fs-16"> {{ translate('random wholesale') }}</span>
                            </a>
                        </div>
                    </div>
                    <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            <a href="{{route('best_selling_product'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                                <span
                                    class="fw-600 fs-16">{{translate('Best Selling') }} </span>
                            </a>
                        </div>
                    </div>
                    <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            <a href="{{route('products_featured'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                                <span
                                    class="fw-600 fs-16"> {{ translate('Featured Products') }}</span>
                            </a>
                        </div>
                    </div>
                    {{-- <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            @php
                                $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
                            @endphp
                            @if($flash_deal !=null)
                                <?php
                                $url = route('flash-deal-details', $flash_deal->slug);
                                ?>
                            @else
                                <?php
                                $url = "#Flash_Sale"
                                ?>
                            @endif
                            <a href="{{$url}}" class="text-reset">
                                <span
                                    class="fw-600 fs-16"> {{ translate('Flash Sale') }}</span>
                            </a>
                        </div>
                    </div> --}}
                    <div class="col position-static">
                        <div class="rounded-top all-category position-relative text-left">
                            <a href="{{route('to_day'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                                <span
                                    class="fw-600 fs-16">{{ translate('Todays Deal') }}</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{-- End Categoires --}}
        @php
            $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1 ))->get());
            $categories = \App\Category::orderBy('order_show')->get();
            $sub_categories = \App\SubCategory::orderBy('order_show')->get();
            $sub_sub_categories = \App\SubSubCategory::orderBy('order_show')->get();
        @endphp
        {{-- Start Categories Carousl --}}
            @if(get_setting('categories_show'))
                <div class="categories">
                    <div class="container">
                        <div class="aiz-carousel gutters-12 half-outside-arrow"
                            data-items="8" data-xl-items="8" data-lg-items="8" data-md-items="8"
                            data-sm-items="4" data-xs-items="4" data-arrows='true' data-autoplay="false" data-infinite='true'>
                            @if (count($categories) > 0)
                                <div class="item">
                                    <a href="{{ route('search') . '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code') }}"
                                    class="d-block rounded p-2 text-reset shadow-sm">
                                        <img
                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            class="lazyload img-fit"
                                        >
                                        <div
                                            class="text-truncate fs-12 fw-600 mt-2 opacity-70">{{ translate('all products') }}</div>
                                    </a>
                                </div>
                                @foreach ($categories as $key => $category)
                                    @if($category->order_show !== null)
                                        <div class="item">
                                            <a href="{{ route('products.category', $category->slug) . '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code') }}"
                                            class="d-block rounded p-2 text-reset shadow-sm">
                                                <img
                                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                    data-src="{{ uploaded_asset($category->banner) }}"
                                                    alt="{{ $category->getTranslation('name') }}"
                                                    class="lazyload img-fit"
                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                                >
                                                <div
                                                    class="text-truncate fs-12 fw-600 mt-2 opacity-70">{{ $category->getTranslation('name') }}</div>
                                            </a>
                                        </div>
                                    @endif
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            @endif
        {{-- End Categories Carousl --}}
        {{-- Start Sub Categories Carousl --}}
            @if(get_setting('sub_categories_show'))
                <div class="categories">
                    <div class="container">
                        <div class="aiz-carousel gutters-12 half-outside-arrow"
                            data-items="8" data-xl-items="8" data-lg-items="8" data-md-items="8"
                            data-sm-items="4" data-xs-items="4" data-arrows='true' data-autoplay="false" data-infinite='true'>
                            @if (count($sub_categories) > 0)
                                @foreach ($sub_categories as $key => $sub_category)
                                    @if($sub_category->order_show !== null)
                                        <div class="item">
                                            <a href="{{ route('products.subcategory', $sub_category->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}"
                                            class="d-block rounded p-2 text-reset shadow-sm">
                                                <img
                                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                    data-src="{{ uploaded_asset($sub_category->banner) }}"
                                                    alt="{{ $sub_category->getTranslation('name') }}"
                                                    class="lazyload img-fit"
                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                                >
                                                <div
                                                    class="text-truncate fs-12 fw-600 mt-2 opacity-70">{{ $sub_category->getTranslation('name') }}</div>
                                            </a>
                                        </div>
                                    @endif
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            @endif
        {{-- End Sub Categories Carousl --}}
        {{-- Start Sub Sub Categories Carousl --}}
            @if(get_setting('sub_sub_categories_show'))
                <div class="categories">
                    <div class="container">
                        <div class="aiz-carousel gutters-12 half-outside-arrow"
                            data-items="8" data-xl-items="8" data-lg-items="8" data-md-items="8"
                            data-sm-items="4" data-xs-items="4" data-arrows='true' data-autoplay="false" data-infinite='true'>
                            @if (count($sub_sub_categories) > 0)
                                @foreach ($sub_sub_categories as $key => $sub_sub_category)
                                @if($sub_sub_category->order_show !== null)
                                    <div class="item">
                                        <a href="{{ route('products.subsubcategory', $sub_sub_category->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}"
                                        class="d-block rounded p-2 text-reset shadow-sm">
                                            <img
                                                src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                data-src="{{ uploaded_asset($sub_sub_category->banner) }}"
                                                alt="{{ $sub_sub_category->getTranslation('name') }}"
                                                class="lazyload img-fit"
                                                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                            >
                                            <div
                                                class="text-truncate fs-12 fw-600 mt-2 opacity-70">{{ $sub_sub_category->getTranslation('name') }}</div>
                                        </a>
                                    </div>
                                @endif
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            @endif
        {{-- End Sub Sub Categories Carousl --}}
        {{-- Start Home Header --}}
        <div class="col-lg-12  cu_banner" style="padding:0">
            @if (get_setting('home_slider_images') != null)
                <div style="height: 100%;" class="aiz-carousel dots-inside-bottom mobile-img-auto-height"
                    data-arrows="true" data-dots="true" data-autoplay="true" data-infinite="true">
                    @php $slider_images = json_decode(get_setting('home_slider_images'), true);  @endphp
                    @foreach ($slider_images as $key => $value)
                        <div style="height: 100%;" class="carousel-box">
                            <a style="height: 100%;"
                            href="{{ json_decode(get_setting('home_slider_links'), true)[$key] }}">
                                <img
                                    class="d-block mw-100 lazyload img-fit  shadow-sm"
                                    src="{{ static_asset('assets/img/placeholder-rect.jpg') }}"
                                    data-src="{{ uploaded_asset($slider_images[$key]) }}"
                                    alt="{{ env('APP_NAME')}} promo"
                                    @if(count($categories) == 0)
                                    height="457"
                                    @else
                                    height="100%"
                                    @endif
                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                >
                            </a>
                        </div>
                    @endforeach
                </div>
            @endif

        </div>
        {{-- End Home Header --}}
    </div>

    {{-- Flash Deal --}}
    @php
        $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
    @endphp
    @if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)
        <section class="mb-4" id="Flash_Sale">

            <div class="d-flex bg-primary flex-wrap  align-items-baseline" style="    padding: 10px">
                <h3 class="h5 fw-700 mb-0">
                    <span class=" btn btn-primary  pb-3 d-inline-block">{{ translate('Flash Sale') }}</span>
                </h3>
                <div class="aiz-count-down ml-auto ml-lg-3 align-items-center"
                     data-date="{{ date('Y/m/d H:i:s', $flash_deal->end_date) }}"></div>
                <a href="{{ route('flash-deal-details', $flash_deal->slug) }}"
                   class="ml-auto mr-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto">{{ translate('View More') }}</a>
            </div>
            <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">


                <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5"
                     data-lg-items="4" data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true'
                     data-infinite='true'>
                    @foreach ($flash_deal->flash_deal_products as $key => $flash_deal_product)
                        @php
                            $product = \App\Product::find($flash_deal_product->product_id);
                        @endphp
                        @if ($product != null && $product->published != 0)
                            <div class="carousel-box">
                                <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                    <div class="position-relative">
                                        @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                            <?php
                                            $old = home_base_price($product->id, 'desc');
                                            $new = home_discounted_base_price($product->id, 'desc');

                                            $value = (($old - $new) / $old) * 100;

                                            ?>
                                            <span class="price_old">{{$value}}% {{translate('OFF')}}</span>
                                        @endif
                                        <a href="{{ route('product', $product->slug) }}" class="d-block">
                                            <img
                                                class="img-fit lazyload mx-auto h-140px h-md-210px"
                                                src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                                alt="{{  $product->getTranslation('name')  }}"
                                                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                            >
                                        </a>
                                        <div class="absolute-top-right aiz-p-hov-icon">
                                            <a href="javascript:void(0)" onclick="addToWishList({{ $product->id }})"
                                               data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}"
                                               data-placement="left">
                                                <i class="la la-heart-o"></i>
                                            </a>
                                            <a href="javascript:void(0)" onclick="addToCompare({{ $product->id }})"
                                               data-toggle="tooltip" data-title="{{ translate('Add to compare') }}"
                                               data-placement="left">
                                                <i class="las la-sync"></i>
                                            </a>
                                            <a href="javascript:void(0)"
                                               onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip"
                                               data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                <i class="las la-shopping-cart"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="p-md-3 p-2 text-left">
                                        <div class="fs-15">
                                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                <del
                                                    class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id) }}</del>
                                            @endif
                                            <span
                                                class="fw-700 text-primary">{{ home_discounted_base_price($product->id) }}</span>
                                        </div>
                                        <div class="rating rating-sm mt-1">
                                            {{ renderStarRating($product->rating) }}
                                        </div>
                                        <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                            <a href="{{ route('product', $product->slug) }}"
                                               class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                        </h3>
                                        @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                                            <div class="rounded px-2 mt-2 bg-primary border-soft-primary border">
                                                {{ translate('Club Point') }}:
                                                <span class="fw-700 float-right">{{ $product->earn_point }}</span>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>

        </section>
    @endif


    {{-- Todays Deal Section --}}
    <div id="Todays_Deal">
        @include('frontend.partials.Todays_Deal')
    </div>
    {{-- Featured Section --}}


    <div id="section_featured">
        @include('frontend.partials.featured_products_section')

    </div>

    {{-- Best Selling  --}}
    <div id="section_best_selling">
        @include('frontend.partials.best_selling_section')
    </div>

    {{-- Category wise Products --}}
    <div id="section_home_categories">
        @include('frontend.partials.home_categories_section')

    </div>

    {{-- Classified Product --}}
    @if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1)
        @php
            $customer_products = \App\CustomerProduct::where('status', '1')->where('published', '1')->take(10)->get();
        @endphp
        @if (count($customer_products) > 0)
            <section class="mb-4">

                <div class=" bg-white shadow-sm rounded">
                    <div class="d-flex bg-primary align-items-baseline">
                        <h3 class="h5 fw-700 mb-0">
                            <span class=" btn btn-primary  pb-3 d-inline-block">{{ translate('Classified Ads') }}</span>
                        </h3>
                        <a href="{{ route('customer.products') }}"
                           class="ml-auto mr-0 btn btn-primary btn-sm shadow-md">{{ translate('View More') }}</a>
                    </div>
                    <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5"
                         data-lg-items="4" data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true'
                         data-infinite='true'>
                        @foreach ($customer_products as $key => $customer_product)
                            <div class="carousel-box">
                                <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                    <div class="position-relative">
                                        <a href="{{ route('customer.product', $customer_product->slug) }}"
                                           class="d-block">
                                            <img
                                                class="img-fit lazyload mx-auto h-140px h-md-260px"
                                                src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                data-src="{{ uploaded_asset($customer_product->thumbnail_img) }}"
                                                alt="{{ $customer_product->getTranslation('name') }}"
                                                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                            >

                                            @php
                                                $photos = explode(',',$customer_product->photos);
                                            @endphp
                                            @if(isset($photos[0]))

                                                <div class="over">
                                                    <img
                                                        class="img-fluid lazyload"
                                                        src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        data-src="{{ uploaded_asset($photos[0]) }}"
                                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                    >
                                                </div>

                                            @endif

                                        </a>
                                        <div class="absolute-top-left pt-2 pl-2">
                                            @if($customer_product->conditon == 'new')
                                                <span
                                                    class="badge badge-inline badge-success">{{translate('new')}}</span>
                                            @elseif($customer_product->conditon == 'used')
                                                <span
                                                    class="badge badge-inline badge-danger">{{translate('Used')}}</span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="p-md-3 p-2 text-left">
                                        <div class="fs-15 mb-1">
                                            <span
                                                class="fw-700 text-primary">{{ single_price($customer_product->unit_price) }}</span>
                                        </div>
                                        <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                            <a href="{{ route('customer.product', $customer_product->slug) }}"
                                               class="d-block text-reset">{{ $customer_product->getTranslation('name') }}</a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>

            </section>
        @endif
    @endif
@endsection
