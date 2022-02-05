@php $featuredProducts = filter_products(\App\Product::where('published', 1)->where('featured', '1'))->limit(12)->get();
@endphp

<section class="mb-4">
    <div class="d-flex bg-soft-primary align-items-baseline " style="padding: 10px">
        <div class="container">
            <h3 class="h5 fw-700 mb-0">
                <span class="btn btn-primary  pb-3 d-inline-block">{{ translate('Featured Products') }}</span>
            </h3>
        </div>
    </div>
    <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">

        <div class="container">
            <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="5" data-xl-items="5" data-lg-items="4"
            data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true' data-infinite='true'>
            @foreach ($featuredProducts as $key => $product)
            @if(request('unit_price'))
                    @php
                        $unit = \App\unit::find(1);
                    @endphp
                    @foreach (json_decode($product->product_sell_type) as $type)
                        @if($unit->id == $type)
                            <div class="carousel-box">
                                <div class="aiz-card-box border border-light  hov-shadow-md my-2 has-transition">
                                    <div class="position-relative">

                                        @if(home_base_price($product->id) !== home_discounted_base_price($product->id))
                                            <?php
                                            $old = home_base_price($product->id);
                                            $new = home_discounted_base_price($product->id);

                                            $value = round((($old - $new) / $old) * 100, 1);
                                            ?>
                                            @if($value > 0)
                                                <span class="price_old">-{{$value}}%</span>
                                            @endif
                                        @endif
                                        @if(!empty(get_coupon($product->id)))
                                            <div class="product_coupon">
                                                {{translate('Coupon Discount')}} :
                                                {{get_coupon($product->id)}}
                                            </div>
                                        @endif

                                        <a href="{{ route('product', $product->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}" class="d-block ">
                                            <img
                                                class="img-fit  product-img lazyload mx-auto h-140px h-md-210px"
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
                                                    onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip"
                                                    data-title="{{ translate('Add to cart') }}" data-placement="left">
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
            @else
                    @php
                        $unit = \App\unit::find(2);
                    @endphp
                    @foreach (json_decode($product->product_sell_type) as $type)
                        @if($unit->id == $type)
                            <div class="carousel-box">
                                <div class="aiz-card-box border border-light  hov-shadow-md my-2 has-transition">
                                    <div class="position-relative">

                                        <?php
                                        $old = home_base_price($product->id, 'wholesale_price');
                                        $new = home_discounted_base_price($product->id, 'wholesale_price');
                                        if(($old - $new) > 0) {
                                            $value = round((($old - $new) / $old) * 100, 1);
                                        }


                                        ?>
                                        @if(($old - $new) > 0)
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
                                                class="img-fit  product-img lazyload mx-auto h-140px h-md-210px"
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
                                                    onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip"
                                                    data-title="{{ translate('Add to cart') }}" data-placement="left">
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
                                            @if(home_base_price($product->id, 'wholesale_price', true) !== price_wholesale($product->id))
                                            <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, 'wholesale_price', true) }}</del>
                                            @endif
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
