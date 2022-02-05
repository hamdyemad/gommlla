<a href="javascript:void(0)" class="d-flex align-items-center text-reset h-100" data-toggle="dropdown" data-display="static">
    <i class="la la-shopping-cart la-2x opacity-80"></i>
    <span class="flex-grow-1 ml-1">
        @if(Session::has('cart'))
            <span>{{ count(Session::get('cart'))}}</span>
        @else
            <span>0</span>
        @endif
    </span>
</a>
<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg p-0">
    @if(Session::has('cart'))
        @if(count($cart = Session::get('cart')) > 0)
            <div class="p-3 fs-15 fw-600 p-3 border-bottom">
                {{translate('Cart Items')}}
            </div>
            <ul class="overflow-auto c-scrollbar-light list-group list-group-flush">
                @php
                    $total = 0;
                @endphp
                @foreach($cart as $key => $cartItem)
                    @php
                        $product = \App\Product::find($cartItem['id']);
                        $total = $total + $cartItem['price']*$cartItem['quantity'];
                    @endphp
                    @if ($product != null)
                        <li class="list-group-item">
                            <a href="{{ route('product', $product->slug) }}" class="d-flex align-items-center text-reset">
                                <img
                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                    class="img-fit lazyload size-60px rounded"
                                    alt="{{  $product->getTranslation('name')  }}"
                                >
                                <span class="minw-0 pl-2 flex-grow-1">
                                    <span class="fw-600 mb-1 text-truncate-2">
                                        @if(strlen($product->getTranslation('name')) >= 15)
                                            {{ substr($product->getTranslation('name'), 0, 15) . '...' }}
                                        @else
                                            {{  strlen($product->getTranslation('name')) }}
                                        @endif
                                    </span>
                                    <span class="">{{ $cartItem['quantity'] }}x</span>
                                    <span class="">{{ single_price($cartItem['price']*$cartItem['quantity']) }}</span>
                                    <span class="d-block">
                                        @if($cartItem['sizes'])
                                            @foreach ($cartItem['sizes'] as $key => $size)
                                                <div class="badge badge-primary">{{ $size}}</div>
                                            @endforeach
                                        @endif
                                    </span>
                                </span>
                            </a>
                            <span>
                                <button onclick="removeFromCart({{ $key }})" class="btn btn-sm btn-icon">
                                    <i class="la la-close"></i>
                                </button>
                            </span>
                        </li>
                    @endif
                @endforeach
            </ul>
            <div class="px-3 py-2 fs-15 border-top d-flex justify-content-between">
                <span class="opacity-60">{{translate('Subtotal')}}</span>
                <span class="fw-600">{{ single_price($total) }}</span>
            </div>
            <div class="px-3 py-2 text-center border-top">
                <ul class="list-inline d-flex mb-0">
                    <li class="list-inline-item">
                        <a href="{{ route('cart') }}" class="btn btn-soft-primary btn-sm">
                            {{translate('View cart')}}
                        </a>
                    </li>
                    @if (Auth::check())
                    <li class="list-inline-item">
                        <a href="{{ route('checkout.shipping_info') }}" class="btn btn-primary btn-sm">
                            {{translate('Checkout')}}
                        </a>
                    </li>
                    @endif
                </ul>
            </div>
        @else
            <div class="text-center p-3">
                <i class="las la-frown la-3x opacity-60 mb-3"></i>
                <h3 class="h6 fw-700">{{translate('Your Cart is empty')}}</h3>
            </div>
        @endif
    @else
        <div class="text-center p-3">
            <i class="las la-frown la-3x opacity-60 mb-3"></i>
            <h3 class="h6 fw-700">{{translate('Your Cart is empty')}}</h3>
        </div>
    @endif
</div>
