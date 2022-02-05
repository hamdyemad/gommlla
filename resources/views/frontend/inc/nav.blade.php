<!-- Top Bar -->
<div class="top-navbar  border-soft-secondary z-1035">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-6">
                <ul class="list-inline d-flex justify-content-center justify-content-md-start mb-0">
                    @if(get_setting('show_language_switcher') == 'on')
                        <li class="list-inline-item dropdown mr-3" id="lang-change">
                            @php
                                if(Session::has('locale')){
                                    $locale = Session::get('locale', Config::get('app.locale'));
                                }
                                else{
                                    $locale = 'en';
                                }
                            @endphp
                            <a href="javascript:void(0)" class="dropdown-toggle text-reset py-2" data-toggle="dropdown" data-display="static">
                                <img src="{{ static_asset('assets/img/placeholder.jpg') }}" data-src="{{ static_asset('assets/img/flags/'.$locale.'.png') }}" class="mr-2 lazyload" alt="{{ \App\Language::where('code', $locale)->first()['name'] }}" height="11">
                                <span class="opacity-60">{{ \App\Language::where('code', $locale)->first()['name'] }}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                @foreach (\App\Language::all() as $key => $language)
                                    <li>
                                        <a href="javascript:void(0)" data-flag="{{ $language->code }}" class="dropdown-item @if($locale == $language) active @endif">
                                            <img src="{{ static_asset('assets/img/placeholder.jpg') }}" data-src="{{ static_asset('assets/img/flags/'.$language->code.'.png') }}" class="mr-1 lazyload" alt="{{ $language->name }}" height="11">
                                            <span class="language">{{ $language->name }}</span>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </li>
                    @endif

                    {{-- @if(get_setting('show_currency_switcher') == 'on')
                        <li class="list-inline-item dropdown" id="currency-change">
                            @php
                                if(Session::has('currency_code')){
                                    $currency_code = Session::get('currency_code');
                                }
                                else{
                                    $currency_code = \App\Currency::findOrFail(\App\BusinessSetting::where('type', 'system_default_currency')->first()->value)->code;
                                }
                            @endphp
                            <a href="javascript:void(0)" class="dropdown-toggle text-reset py-2 opacity-60" data-toggle="dropdown" data-display="static">
                                {{ \App\Currency::where('code', $currency_code)->first()->name }} {{ (\App\Currency::where('code', $currency_code)->first()->symbol) }}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
                                @foreach (\App\Currency::where('status', 1)->get() as $key => $currency)
                                    <li>
                                        <a class="dropdown-item @if($currency_code == $currency->code) active @endif" href="javascript:void(0)" data-currency="{{ $currency->code }}">{{ $currency->name }} ({{ $currency->symbol }})</a>
                                    </li>
                                @endforeach
                            </ul>
                        </li>
                    @endif --}}
                </ul>
            </div>
            <div class="col-12 col-md-6">
                <ul class="list-inline text-center text-md-right mb-0">
                    @auth
                        @if(isAdmin())
                            <li class="list-inline-item mr-3">
                                <a href="{{ route('admin.dashboard') }}" class="text-reset py-2 d-inline-block opacity-60">{{ translate('My Panel')}}</a>
                            </li>
                        @else
                            <li class="list-inline-item mr-3">
                                <a href="{{ route('dashboard') }}" class="text-reset py-2 d-inline-block opacity-60">{{ translate('My Panel')}}</a>
                            </li>
                        @endif
                        <li class="list-inline-item">
                            <a href="{{ route('logout') }}" class="text-reset py-2 d-inline-block opacity-60">{{ translate('Logout')}}</a>
                        </li>
                    @else
                        <li class="list-inline-item mr-3">
                            <a href="{{ route('user.login') }}" class="text-reset py-2 d-inline-block opacity-60">{{ translate('Login')}}</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="{{ route('user.registration') }}" class="text-reset py-2 d-inline-block opacity-60">{{ translate('Registration')}}</a>
                        </li>
                    @endauth
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- END Top Bar -->
<header class="navbar navbar-expand-lg navbar-light bg-primary @if(get_setting('header_stikcy') == 'on') sticky-top @endif z-1020 bg-primary text-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="{{ route('home'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code') }}">
            @php
                $header_logo = get_setting('header_logo');
            @endphp
            @if($header_logo != null)
                <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}">
            @else
                <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}">
            @endif
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="d-md-none navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="{{route('home'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                        <span class="fw-600 fs-16">{{translate('home') }} </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{route('categories.all'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                        <span
                            class="fw-600 fs-16"> {{ translate('categories') }}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{route('home'). '?unit_price='. true . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                        <span
                            class="fw-600 fs-16"> {{ translate('random wholesale') }}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{route('best_selling_product'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                        <span
                            class="fw-600 fs-16">{{translate('Best Selling') }} </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{route('products_featured'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                        <span
                            class="fw-600 fs-16"> {{ translate('Featured Products') }}</span>
                    </a>
                </li>
                {{-- <li class="nav-item">
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
                            class="fw-600 fs-16"> {{ translate('random wholesale') }}</span>
                    </a>
                </li> --}}
                <li class="nav-item">
                    <a href="{{route('to_day'). '?unit_price='. request('unit_price') . '&product_referral_code='. request('product_referral_code')}}" class="text-reset">
                        <span
                            class="fw-600 fs-16">{{ translate('Todays Deal') }}</span>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav m-auto">
                <li class="nav-item">
                    <div class="inc-search flex-grow-1">
                        <div class="position-relative flex-grow-1">
                            <form action="{{ route('search') }}" method="GET" class="stop-propagation">
                                <div class="d-flex position-relative align-items-center">
                                    <div class="input-group">
                                        <input style="padding:25px ; border: 1px solid {{get_setting('base_color')}}" type="text" class=" form-control" id="search" name="q" placeholder="{{translate('I am shopping for...')}}" autocomplete="off">
                                    </div>
                                </div>
                            </form>
                            <div class="typed-search-box stop-propagation document-click-d-none d-none bg-white rounded shadow-lg position-absolute left-0 top-100 w-100" style="min-height: 200px">
                                <div class="search-preloader absolute-top-center">
                                    <div class="dot-loader"><div></div><div></div><div></div></div>
                                </div>
                                <div class="search-nothing d-none p-3 text-center fs-16">

                                </div>
                                <div id="search-content" class="text-left">

                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <div class="" id="compare">
                        @include('frontend.partials.compare')
                    </div>
                </li>
                <li class="nav-item">
                    <div class="" id="wishlist">
                        @include('frontend.partials.wishlist')
                    </div>
                </li>
                <li class="nav-item">
                    <div class="nav-cart-box dropdown h-100" id="cart_items">
                        @include('frontend.partials.cart')
                    </div>
                </li>
            </ul>
        </div>
    </div>
</header>
