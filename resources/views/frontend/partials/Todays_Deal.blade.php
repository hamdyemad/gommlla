@php
$productsDeals =  filter_products(\App\Product::where('published', 1)->where('todays_deal', '1'))->get();
$wholesale_price = array_sum(array_map(function ($pro) {
            return $pro['wholesale_price'];
        }, $productsDeals->toArray()));
@endphp
@if(request('unit_price'))
@if(count($productsDeals) > 0)
<section>
    <div class="bg-soft-primary p-2">
        <div class="container">
            <div class="d-flex bg-s oft-primary align-items-baseline">
                <h3 class="h5 fw-700 mb-0">
                    <span class=" btn btn-primary  pb-3 d-inline-block">{{ translate('Todays Deal') }}</span>
                </h3>
            </div>
        </div>
    </div>
    <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">
        <div class="container">
            <div class="aiz-carousel gutters-10 half-outside-arrow"
            data-items="5" data-xl-items="4" data-lg-items="3"
            data-md-items="3" data-sm-items="2" data-xs-items="2"
            data-arrows='true' data-infinite='true'>
            @php
                $unit = \App\unit::find(1);
            @endphp
                @foreach ($productsDeals as $key=> $product)
                @foreach (json_decode($product->product_sell_type) as $type)
                    @if($unit->id == $type)
                        <div class="carousel-box">
                            <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                <div class="position-relative">
                                    <?php
                                    $old=home_base_price($product->id);
                                    $new=home_discounted_base_price($product->id);
                                    $value = round((($old - $new) / $old) * 100, 1);

                                    ?>
                                        <span class="price_old">-{{$value}}%</span>
                                    @if(!empty(get_coupon($product->id)))
                                        <div class="product_coupon">
                                            {{translate('Coupon Discount')}} :
                                            {{get_coupon($product->id)}}
                                        </div>
                                    @endif
                                    <a href="{{ route('product', $product->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}" class="d-block">
                                        <img
                                            class="img-fit product-img lazyload mx-auto h-140px h-md-260px"
                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                            alt="{{  $product->getTranslation('name')  }}"
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                        >
                                                @php
                                        $photos = explode(',',$product->photos);
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

                                </div>
                                <div class="p-md-3 p-2 text-center">
                                    <div class="fs-15 text-center">
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
                                    <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                        <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                    </h3>

                                    @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                                        <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
                                            {{ translate('Club Point') }}:
                                            <span class="fw-700 float-right">{{ $product->earn_point }}</span>
                                        </div>
                                    @endif
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
    @if(count($productsDeals) > 0 && $wholesale_price !== 0)
        <section>
            <div class="bg-soft-primary p-2">
                <div class="container">
                    <div class="d-flex bg-s oft-primary align-items-baseline">
                        <h3 class="h5 fw-700 mb-0">
                            <span class=" btn btn-primary  pb-3 d-inline-block">{{ translate('Todays Deal') }}</span>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">
                <div class="container">
                    <div class="aiz-carousel gutters-10 half-outside-arrow"
                    data-items="5" data-xl-items="4" data-lg-items="3"
                    data-md-items="3" data-sm-items="2" data-xs-items="2"
                    data-arrows='true' data-infinite='true'>
                        @php
                            $unit = \App\unit::find(2);
                        @endphp
                        @foreach ($productsDeals as $key=> $product)

                        @foreach (json_decode($product->product_sell_type) as $type)
                            @if($unit->id == $type)
                                <div class="carousel-box">
                                    <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">

                                        <div class="position-relative">
                                            <?php
                                            $old=home_base_price($product->id,'wholesale_price');
                                            $new=home_discounted_base_price($product->id,'wholesale_price');
                                            if(($old - $new) !== 0) {
                                                $value = round((($old - $new) / $old) * 100, 1);
                                            }

                                            ?>
                                            @if($value > 0 && ($old - $new) !== 0)
                                                <span class="price_old">-{{$value}}%</span>
                                            @endif
                                            @if(!empty(get_coupon($product->id)))
                                                <div class="product_coupon">
                                                    {{translate('Coupon Discount')}} :
                                                    {{get_coupon($product->id)}}
                                                </div>
                                            @endif
                                            <a href="{{ route('product', $product->slug). '?unit_price=' . request('unit_price') . '&product_referral_code='. request('product_referral_code')  }}" class="d-block">
                                                <img
                                                    class="img-fit product-img lazyload mx-auto h-140px h-md-260px"
                                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                                    alt="{{  $product->getTranslation('name')  }}"
                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                >
                                                        @php
                                                $photos = explode(',',$product->photos);
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

                                        </div>
                                        <div class="p-md-3 p-2 text-center">
                                            <div class="fs-15 text-center">
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
                                                    <div class="badge badge-primary w-100">سعر الجملة بالدستة</div>
                                                    @if(home_base_price($product->id, 'wholesale_price', true) !== price_wholesale($product->id))
                                                    <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, 'wholesale_price', true) }}</del>
                                                    @endif
                                                    <span class="fw-700 text-primary">{{ price_wholesale($product->id) }}
                                            </div>
                                            <div class="rating rating-sm mt-1">
                                                {{ renderStarRating($product->rating) }}
                                            </div>
                                            <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                                <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{  $product->getTranslation('name')  }}</a>
                                            </h3>

                                            @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                                                <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
                                                    {{ translate('Club Point') }}:
                                                    <span class="fw-700 float-right">{{ $product->earn_point }}</span>
                                                </div>
                                            @endif
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
@endif
