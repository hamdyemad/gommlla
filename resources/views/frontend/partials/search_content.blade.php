<div class="">
    @if (sizeof($keywords) > 0)
        <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Popular Suggestions')}}</div>
        <ul class="list-group list-group-raw">
            @foreach ($keywords as $key => $keyword)
                <li class="list-group-item py-1">
                    <a class="text-reset hov-text-primary" href="{{ route('suggestion.search', $keyword). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code') }}">{{ $keyword }}</a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
<div class="">
    @if (count($subsubcategories) > 0)
        <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Category Suggestions'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}</div>
        <ul class="list-group list-group-raw">
            @foreach ($subsubcategories as $key => $subsubcategory)
                <li class="list-group-item py-1">
                    <a class="text-reset hov-text-primary" href="{{ route('products.subsubcategory', $subsubcategory->slug). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code') }}">{{ $subsubcategory->getTranslation('name') }}</a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
<div class="">
    @if (count($products) > 0)
        <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Products')}}</div>
        <ul class="list-group list-group-raw">
            @foreach ($products as $key => $product)
                <li class="list-group-item">
                    <a class="text-reset" href="{{ route('product', $product->slug). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}">
                        <div class="d-flex search-product align-items-center">
                            <div class="mr-3">
                                <img class="size-40px img-fit rounded" src="{{ uploaded_asset($product->thumbnail_img) }}">
                            </div>
                            <div class="flex-grow-1 overflow--hidden minw-0">
                                <div class="product-name text-truncate fs-14 mb-5px">
                                    {{  $product->getTranslation('name')  }}
                                </div>
                            </div>
                        </div>
                    </a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
@if(\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
    <div class="">
        @if (count($shops) > 0)
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Shops')}}</div>
            <ul class="list-group list-group-raw">
                @foreach ($shops as $key => $shop)
                    <li class="list-group-item">
                        <a class="text-reset" href="{{ route('shop.visit', $shop->slug). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code') }}">
                            <div class="d-flex search-product align-items-center">
                                <div class="mr-3">
                                    <img class="size-40px img-fit rounded" src="@if($shop->logo){{ uploaded_asset($shop->logo) }} @else{{ asset('/public/assets/img/avatar-place.png') }}@endif">
                                </div>
                                <div class="flex-grow-1 overflow--hidden">
                                    <div class="product-name text-truncate fs-14 mb-5px">
                                        {{ $shop->name }}
                                    </div>
                                    <div class="opacity-60">
                                        {{ $shop->address }}
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                @endforeach
            </ul>
        @endif
    </div>
@endif
