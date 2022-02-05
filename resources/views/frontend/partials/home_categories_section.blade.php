@php $home_categories = json_decode(get_setting('home_categories')); @endphp
@if(count($home_categories) > 0)
    @foreach ($home_categories as $key => $value)
        @php $category = \App\Category::find($value);
            $wholesale_price = array_sum(array_map(function ($pro) {
                return $pro['wholesale_price'];
            }, get_cached_products($category->id)->toArray()));
        @endphp
        @if(request('unit_price'))
        @if(count(get_cached_products($category->id)) > 0)
                <section class="home-categories mb-4">
                    <div class="bg-soft-primary p-2">
                        <div class="container">
                            <div class="d-flex align-items-baseline">
                                <h3 class="h5 fw-700 mb-0">
                                    <span class="btn btn-primary pb-3 d-inline-block"
                                        style="width: 100%;">{{ $category->getTranslation('name') }}</span>

                                </h3>
                                <a href="{{ route('products.category', $category->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}"
                                    class="ml-auto mr-0 btn btn-primary btn-sm shadow-md">{{ translate('View More') }}</a>

                            </div>
                        </div>
                    </div>
                    <div class="bg-white shadow-sm" style="padding:0 ;overflow: hidden">
                        <div class="container">
                            <div class="aiz-carousel gutters-10 half-outside-arrow"
                                data-items="5" data-xl-items="5" data-lg-items="2" data-md-items="2"
                                data-sm-items="2" data-xs-items="2" data-arrows='true' data-infinite='true'>
                                @foreach (get_cached_products($category->id) as $key => $product)
                                @php
                                    $unit = \App\unit::find(1);
                                @endphp
                                @foreach (json_decode($product->product_sell_type) as $type)
                                    @if($unit->id == $type)
                                        <div class="carousel-box">
                                            <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                                <div class="position-relative">
                                                    @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                    <?php
                                                    $old = home_base_price($product->id);
                                                    $new = home_discounted_base_price($product->id);

                                                    $value = round((($old - $new) / $old) * 100, 1);

                                                    ?>
                                                    <span class="price_old">-{{$value}}%</span>
                                                    @endif
                                                    @if(!empty(get_coupon($product->id)))
                                                        <div class="product_coupon">
                                                            {{translate('Coupon Discount')}} :
                                                            {{get_coupon($product->id)}}
                                                        </div>
                                                    @endif

                                                    <a href="{{ route('product', $product->slug . '?unit_price=' . request('unit_price')) }}" class="d-block ">
                                                        <img
                                                            class="img-fit product-img  lazyload mx-auto h-140px h-md-210px"
                                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                            data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                                            alt="{{  $product->getTranslation('name')  }}"
                                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                        >
                                                    </a>

                                                </div>
                                                <div class="p-md-3 p-2 text-center">
                                                    <div class="fs-15 textalign">

                                                        <div class="aiz-price_new">
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
                                                            @if(count($product['product_saller'] )==0)

                                                                <a href="javascript:void(0)"
                                                                onclick="showAddToCartModal({{ $product->id }})"
                                                                data-toggle="tooltip" data-title="{{ translate('Add to cart') }}"
                                                                data-placement="left">
                                                                    <i class="las la-shopping-cart"></i>
                                                                </a>
                                                            @else
                                                                <a href="{{ route('product', $product->slug) }}"
                                                                data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                                    <i class="las la-shopping-cart"></i>
                                                                </a>

                                                            @endif
                                                        </div>

                                                    @if(home_base_price($product->id) !== home_discounted_base_price($product->id))
                                                        <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, null, true) }}</del>
                                                    @endif
                                                    <span class="fw-700 text-primary">{{ home_discounted_base_price($product->id, null, true) }}</span>
                                                    </div>
                                                    <div class="rating rating-sm mt-1">
                                                        {{ renderStarRating($product->rating) }}
                                                    </div>
                                                    <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px textalign">
                                                        <a href="{{ route('product', $product->slug) }}"
                                                        class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                                    </h3>

                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                                @endforeach
                            </div>
                        </div>
                    </div>
                </section>
            @endif
        @else
            @if(count(get_cached_products($category->id)) > 0 && $wholesale_price !== 0)
                <section class="home-categories mb-4">
                    <div class="bg-soft-primary p-2">
                        <div class="container">
                            <div class="d-flex align-items-baseline">
                                <h3 class="h5 fw-700 mb-0">
                                    <span class="btn btn-primary pb-3 d-inline-block"
                                        style="width: 100%;">{{ $category->getTranslation('name') }}</span>

                                </h3>
                                <a href="{{ route('products.category', $category->slug) }}"
                                    class="ml-auto mr-0 btn btn-primary btn-sm shadow-md">{{ translate('View More') }}</a>

                            </div>
                        </div>
                    </div>
                    <div class="bg-white shadow-sm" style="padding:0 ;overflow: hidden">
                        <div class="container">
                            <div class="aiz-carousel gutters-10 half-outside-arrow"
                                data-items="5" data-xl-items="5" data-lg-items="2" data-md-items="2"
                                data-sm-items="2" data-xs-items="2" data-arrows='true' data-infinite='true'>
                                @foreach (get_cached_products($category->id) as $key => $product)
                                @if($product->wholesale_price > 0)
                                @php
                                    $unit = \App\unit::find(2);
                                @endphp
                                @foreach (json_decode($product->product_sell_type) as $type)
                                    @if($unit->id == $type)
                                        <div class="carousel-box">
                                            <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                                <div class="position-relative">
                                                    @if(home_base_price($product->id, 'wholesale_price') != home_discounted_base_price($product->id, 'wholesale_price'))
                                                    <?php
                                                    $old = home_base_price($product->id, 'wholesale_price');
                                                    $new = home_discounted_base_price($product->id, 'wholesale_price');

                                                    $value = round((($old - $new) / $old) * 100, 1);

                                                    ?>
                                                    <span class="price_old">-{{$value}}%</span>
                                                    @endif
                                                    @if(!empty(get_coupon($product->id)))
                                                        <div class="product_coupon">
                                                            {{translate('Coupon Discount')}} :
                                                            {{get_coupon($product->id)}}
                                                        </div>
                                                    @endif

                                                    <a href="{{ route('product', $product->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}" class="d-block ">
                                                        <img
                                                            class="img-fit product-img  lazyload mx-auto h-140px h-md-210px"
                                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                            data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                                            alt="{{  $product->getTranslation('name')  }}"
                                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                        >
                                                    </a>

                                                </div>
                                                <div class="p-md-3 p-2 text-center">
                                                    <div class="fs-15 textalign">

                                                        <div class="aiz-price_new">
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
                                                            @if(count($product['product_saller'] )==0)

                                                                <a href="javascript:void(0)"
                                                                onclick="showAddToCartModal({{ $product->id }})"
                                                                data-toggle="tooltip" data-title="{{ translate('Add to cart') }}"
                                                                data-placement="left">
                                                                    <i class="las la-shopping-cart"></i>
                                                                </a>
                                                            @else
                                                                <a href="{{ route('product', $product->slug) }}"
                                                                data-title="{{ translate('Add to cart') }}" data-placement="left">
                                                                    <i class="las la-shopping-cart"></i>
                                                                </a>

                                                            @endif
                                                        </div>
                                                        <div class="badge badge-primary w-100">سعر الجملة بالدستة</div>
                                                        <span class="fw-700 text-primary">{{ price_wholesale($product->id) }}
                                                    </div>
                                                    <div class="rating rating-sm mt-1">
                                                        {{ renderStarRating($product->rating) }}
                                                    </div>
                                                    <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px textalign">
                                                        <a href="{{ route('product', $product->slug) }}"
                                                        class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                                    </h3>

                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                                @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                </section>
            @endif
        @endif
    @endforeach
@endif
