<div class="aiz-sidebar-wrap">
    <div class="aiz-sidebar left ">
        <div class="aiz-side-nav-logo-wrap">
            <a href="{{ route('admin.dashboard') }}" class="d-block text-center active {{ areActiveRoutes(['admin.dashboard']) }}">
                @if(get_setting('system_logo_white') != null)
                    <img style="height:60px" class="mw-100" src="{{ uploaded_asset(get_setting('system_logo_white')) }}" class="brand-icon" alt="{{ get_setting('site_name') }}">
                @else
                    <img class="mw-100" src="{{ static_asset('assets/img/logo.png') }}" class="brand-icon" alt="{{ get_setting('site_name') }}">
                @endif
            </a>
        </div>



        <div class="aiz-side-nav-wrap">

            <div class="dropdown {{ areActiveRoutes(['admin.dashboard']) }}">
                @php
                    $sellersBalance = \App\User::where('user_type', 'seller')->pluck('balance')->sum();
                    $affiliateBalance = \App\User::where('user_type', 'affiliate')->pluck('balance')->sum();
                @endphp
                <div class="balances p-1 d-md-none">
                    <div class="first p-1 d-flex">
                        <div class="badge badge-primary w-100">{{ single_price($sellersBalance) }}</div>
                        <div class="badge badge-info w-100">{{ single_price($affiliateBalance) }}</div>
                    </div>
                    <div class="badge p-1 badge-success w-100 fs-16">{{ single_price(Auth::user()->balance) }}</div>
                </div>
                <a href="{{route('admin.dashboard')}}" class="dropbtn">
                    <i class="las la-home aiz-side-nav-icon"></i>
                    <span class="aiz-side-nav-text">{{translate('Dashboard')}}</span>
                </a>
                <div class="triangle-left"></div>

                 </div>

            @if (\App\Addon::where('unique_identifier', 'pos_system')->first() != null && \App\Addon::where('unique_identifier', 'pos_system')->first()->activated)
                @if(Auth::user()->user_type == 'admin' || in_array('1', json_decode(Auth::user()->staff->role->permissions)))

                    <div class="dropdown {{ areActiveRoutes([
                        'poin-of-sales.index', 'poin-of-sales.create',
                        'poin-of-sales.activation', 'warehouses.index',
                        'suppliers.index', 'units.index', 'expense_categories.index', 'expenses.index']) }}">
                        <a class="dropbtn">
                            <i class="las la-home aiz-side-nav-icon"></i>
                            <span class="aiz-side-nav-text">{{translate('POS System')}}</span>
                        </a>
                        <div class="triangle-left"></div>
                        <div class="c-scrollbar dropdown-content">
                            <a href="{{route('poin-of-sales.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['poin-of-sales.index', 'poin-of-sales.create'])}}">
                                <span class="aiz-side-nav-text">{{translate('POS Manager')}}</span>
                            </a>

                                <a href="{{route('poin-of-sales.activation')}}" class="aiz-side-nav-link {{ areActiveRoutes(['poin-of-sales.activation'])}}">
                                    <span class="aiz-side-nav-text">{{translate('POS Configuration')}}</span>
                                </a>
                            <a href="{{route('warehouses.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['warehouses.index'])}}">
                                    <span class="aiz-side-nav-text">{{translate('warehouses')}}</span>
                                </a>
                            <a href="{{route('suppliers.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['suppliers.index'])}}">
                                    <span class="aiz-side-nav-text">{{translate('suppliers')}}</span>
                                </a>
                            <a href="{{route('units.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['units.index'])}}">
                                    <span class="aiz-side-nav-text">{{translate('units')}}</span>
                                </a>
                            <a href="{{route('expense_categories.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['expense_categories.index'])}}">
                                    <span class="aiz-side-nav-text">{{translate('expense_categories')}}</span>
                                </a>
                            <a href="{{route('expenses.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['expenses.index'])}}">
                                    <span class="aiz-side-nav-text">{{translate('expenses')}}</span>
                                </a>
                        </div>
                    </div>

                @endif
            @endif
            @if(Auth::user()->user_type == 'admin' || in_array('2', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes(['products.create', 'products.all',
                'products.admin', 'products.seller', 'product_bulk_upload.index',
                'product_bulk_export.index', 'categories.index', 'subcategories.index', 'subsubcategories.index',
                'brands.index','attributes.index','reviews.index']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-shopping-cart aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{translate('Products')}}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">
                        <a class="aiz-side-nav-link {{ areActiveRoutes(['products.create']) }}" href="{{route('products.create')}}">
                            <span class="aiz-side-nav-text">{{translate('Add New product')}}</span>
                        </a>

                            <a href="{{route('products.all')}}" class="aiz-side-nav-link {{ areActiveRoutes(['products.all']) }}">
                                <span class="aiz-side-nav-text">{{ translate('All Products') }}</span>
                            </a>
                            <a href="{{route('products.admin')}}" class="aiz-side-nav-link {{ areActiveRoutes(['products.admin']) }}" >
                                <span class="aiz-side-nav-text">{{ translate('In House Products') }}</span>
                            </a>
                        @if(\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                            <a href="{{route('products.seller')}}" class="aiz-side-nav-link {{ areActiveRoutes(['products.seller', 'products.seller.edit']) }}">
                                <span class="aiz-side-nav-text">{{ translate('Seller Products') }}</span>
                            </a>
                        @endif
                        {{-- <a href="{{route('digitalproducts.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['digitalproducts.index', 'digitalproducts.create', 'digitalproducts.edit']) }}">
                            <span class="aiz-side-nav-text">{{ translate('Digital Products') }}</span>
                        </a> --}}

                        <a href="{{ route('product_bulk_upload.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['product_bulk_upload.index']) }}" >
                            <span class="aiz-side-nav-text">{{ translate('Bulk Import') }}</span>
                        </a>
                        <a href="{{route('product_bulk_export.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['product_bulk_export.index']) }}">
                            <span class="aiz-side-nav-text">{{translate('Bulk Export')}}</span>
                        </a>
                        <a href="{{route('categories.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['categories.index', 'categories.create', 'categories.edit'])}}">
                            <span class="aiz-side-nav-text">{{translate('Category')}}</span>
                        </a>
                        <a href="{{route('subcategories.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['subcategories.index', 'subcategories.create', 'subcategories.edit'])}}">
                            <span class="aiz-side-nav-text">{{translate('Subcategory')}}</span>
                        </a>
                        <a href="{{route('subsubcategories.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['subsubcategories.index', 'subsubcategories.create', 'subsubcategories.edit'])}}">
                            <span class="aiz-side-nav-text">{{translate('Sub Subcategory')}}</span>
                        </a>
                        <a href="{{route('brands.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['brands.index', 'brands.create', 'brands.edit'])}}" >
                            <span class="aiz-side-nav-text">{{translate('Brand')}}</span>
                        </a>
                        <a href="{{route('attributes.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['attributes.index','attributes.create','attributes.edit'])}}">
                            <span class="aiz-side-nav-text">{{translate('Attribute')}}</span>
                        </a>
                        <a href="{{route('reviews.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['reviews.index']) }}">
                            <span class="aiz-side-nav-text">{{translate('Product Reviews')}}</span>
                        </a>

                    </div>
                </div>
            @endif
            <div class="dropdown {{ areActiveRoutes([
                'all_orders.index', 'all_orders.show', 'statuses.index',
                'inhouse_orders.index', 'seller_orders.index', 'distribution-of-orders', 'commissions.index'])}}">
                <a href="#" class="dropbtn">
                    <i class="las la-money-bill aiz-side-nav-icon"></i>
                    <span class="aiz-side-nav-text">{{translate('Sales')}}</span>
                    <span class="aiz-side-nav-arrow"></span>
                </a>
                <div class="triangle-left"></div>
                <div class="c-scrollbar dropdown-content">

                    @if(Auth::user()->user_type == 'admin' || in_array('3', json_decode(Auth::user()->staff->role->permissions)))

                            <a href="{{ route('all_orders.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['all_orders.index', 'all_orders.show'])}}">
                                <span class="aiz-side-nav-text">{{translate('All Orders')}}</span>
                            </a>
                    @endif
                    @if(Auth::user()->user_type == 'admin' || in_array('s', json_decode(Auth::user()->staff->role->permissions)))
                        <a href="{{ route('statuses.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['statuses.index'])}}">
                            <span class="aiz-side-nav-text">{{translate('All Statuses')}}</span>
                        </a>
                    @endif

                    @if(Auth::user()->user_type == 'admin' || in_array('4', json_decode(Auth::user()->staff->role->permissions)))

                            <a href="{{ route('inhouse_orders.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['inhouse_orders.index', 'inhouse_orders.show'])}}" >
                                <span class="aiz-side-nav-text">{{translate('Inhouse orders')}}</span>
                            </a>

                    @endif
                    @if(Auth::user()->user_type == 'admin' || in_array('5', json_decode(Auth::user()->staff->role->permissions)))

                            <a href="{{ route('seller_orders.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['seller_orders.index', 'seller_orders.show'])}}">
                                <span class="aiz-side-nav-text">{{translate('Seller Orders')}}</span>
                            </a>

                    @endif
                    {{-- @if(Auth::user()->user_type == 'admin' || in_array('6', json_decode(Auth::user()->staff->role->permissions)))
                            <a href="{{ route('pick_up_point.order_index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['pick_up_point.order_index','pick_up_point.order_show'])}}">
                                <span class="aiz-side-nav-text">{{translate('Pick-up Point Order')}}</span>
                            </a>
                    @endif --}}
                    @if(Auth::user()->user_type == 'admin' || in_array('distribution', json_decode(Auth::user()->staff->role->permissions)))
                        <a href="{{ route('distribution-of-orders') }}" class="aiz-side-nav-link {{ areActiveRoutes(['distribution-of-orders'])}}">
                            <span class="aiz-side-nav-text">{{translate('Distribution of orders')}}</span>
                        </a>
                    @endif
                    @if(Auth::user()->user_type == 'admin' || in_array('commissions', json_decode(Auth::user()->staff->role->permissions)))
                        <a href="{{ route('commissions.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['commissions.index'])}}">
                            <span class="aiz-side-nav-text">{{translate('Shipping Commissions')}}</span>
                        </a>
                    @endif
                </div>
            </div>

            @if (\App\Addon::where('unique_identifier', 'refund_request')->first() != null && \App\Addon::where('unique_identifier', 'refund_request')->first()->activated)
                @if(Auth::user()->user_type == 'admin' || in_array('7', json_decode(Auth::user()->staff->role->permissions)))

                <div class="dropdown {{ areActiveRoutes(['refund_requests_all', 'paid_refund', 'refund_time_config']) }}">
                <a href="#" class="dropbtn">
                    <i class="las la-backward aiz-side-nav-icon"></i>
                    <span class="aiz-side-nav-text">{{ translate('Refunds') }}</span>
                    <span class="aiz-side-nav-arrow"></span>
                </a>
                    <div class="triangle-left"></div>
                <div class="c-scrollbar dropdown-content">


                        <a href="{{route('refund_requests_all')}}" class="aiz-side-nav-link {{ areActiveRoutes(['refund_requests_all', 'reason_show'])}}">
                            <span class="aiz-side-nav-text">{{translate('Refund Requests')}}</span>
                        </a>

                        <a href="{{route('paid_refund')}}" class="aiz-side-nav-link {{ areActiveRoutes(['paid_refund'])}}">
                            <span class="aiz-side-nav-text">{{translate('Approved Refund')}}</span>
                        </a>

                        <a href="{{route('refund_time_config')}}" class="aiz-side-nav-link {{ areActiveRoutes(['refund_time_config'])}}">
                            <span class="aiz-side-nav-text">{{translate('Refund Configuration')}}</span>
                        </a>


                </div>
            </div>

            @endif
            @endif
            @if(Auth::user()->user_type == 'admin' || in_array('8', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes(['customers.index', 'orders_customers']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-user-friends aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{ translate('Customers') }}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">
                        <a href="{{ route('customers.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['customers.index']) }}">
                            <span class="aiz-side-nav-text">{{ translate('registerd customers') }}</span>
                        </a>
                        <a href="{{ route('orders_customers') }}" class="aiz-side-nav-link {{ areActiveRoutes(['orders_customers']) }}">
                            <span class="aiz-side-nav-text">{{ translate('orders customers') }}</span>
                        </a>
                    </div>
                </div>
            @endif
            @if((Auth::user()->user_type == 'admin' || in_array('9', json_decode(Auth::user()->staff->role->permissions))) && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                <div class="dropdown {{ areActiveRoutes(['sellers.index', 'sellers.payment_histories',
                'withdraw_requests_all', 'business_settings.vendor_commission', 'seller_packages.index',
                'seller_verification_form.index']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-user aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{ translate('Sellers') }}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">
                            @php
                                $sellers = \App\Seller::where('verification_status', 0)->where('verification_info', '!=', null)->count();
                            @endphp
                            <a href="{{ route('sellers.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['sellers.index', 'sellers.create', 'sellers.edit', 'sellers.payment_history','sellers.approved','sellers.profile_modal','sellers.show_verification_request'])}}">
                                <span class="aiz-side-nav-text">{{ translate('All Seller') }}</span>
                                @if($sellers > 0)<span class="badge badge-info">{{ $sellers }}</span> @endif
                            </a>

                            <a href="{{ route('sellers.payment_histories') }}" class="aiz-side-nav-link {{ areActiveRoutes(['sellers.payment_histories']) }}">
                                <span class="aiz-side-nav-text">{{ translate('Payouts') }}</span>
                            </a>


                            <a href="{{ route('withdraw_requests_all') }}" class="aiz-side-nav-link {{ areActiveRoutes(['withdraw_requests_all']) }}">
                                <span class="aiz-side-nav-text">{{ translate('Payout Requests') }}</span>
                            </a>


                            <a href="{{ route('business_settings.vendor_commission') }}" class="aiz-side-nav-link {{ areActiveRoutes(['business_settings.vendor_commission']) }}">
                                <span class="aiz-side-nav-text">{{ translate('Seller Commission') }}</span>
                            </a>

                        @if (\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated)

                                <a href="{{ route('seller_packages.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['seller_packages.index', 'seller_packages.create', 'seller_packages.edit'])}}">
                                    <span class="aiz-side-nav-text">{{ translate('Seller Packages') }}</span>
                                </a>

                        @endif

                            <a href="{{ route('seller_verification_form.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['seller_verification_form.index']) }}">
                                <span class="aiz-side-nav-text">{{ translate('Seller Verification Form') }}</span>
                            </a>
                    </div>
                </div>
            @endif
            @if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated)
                @if(Auth::user()->user_type == 'admin' || in_array('15', json_decode(Auth::user()->staff->role->permissions)))

                    <div class="dropdown {{ areActiveRoutes(['affiliate.configs','affiliate.index',
                    'affiliate.users', 'affiliate_users.show_verification_request', 'affiliate_user.payment_history',
                        'refferals.users','affiliate.withdraw_requests']) }}">
                        <a href="#" class="dropbtn">
                            <i class="las la-link aiz-side-nav-icon"></i>
                            <span class="aiz-side-nav-text">{{translate('Affiliate System')}}</span>
                            <span class="aiz-side-nav-arrow"></span>
                        </a>
                        <div class="triangle-left"></div>
                        <div class="c-scrollbar dropdown-content">
                            <a href="{{route('affiliate.configs')}}" class="aiz-side-nav-link {{ areActiveRoutes(['affiliate.configs']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Affiliate Registration Form')}}</span>
                                    </a>
                               <a href="{{route('affiliate.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['affiliate.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Affiliate Configurations')}}</span>
                                    </a>
                             <a href="{{route('affiliate.users')}}" class="aiz-side-nav-link {{ areActiveRoutes(['affiliate.users', 'affiliate_users.show_verification_request', 'affiliate_user.payment_history'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Affiliate Users')}}</span>
                                    </a>
                             <a href="{{route('refferals.users')}}" class="aiz-side-nav-link {{ areActiveRoutes(['refferals.users']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Referral Users')}}</span>
                                    </a>
                         <a href="{{route('affiliate.withdraw_requests')}}" class="aiz-side-nav-link {{ areActiveRoutes(['affiliate.withdraw_requests']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Affiliate Withdraw Requests')}}</span>
                                    </a>

                        </div>
                    </div>
                    @endif

            @endif
            @if(Auth::user()->user_type == 'admin' || in_array('10', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes([
                    'in_house_sale_report.index', 'seller_sale_report.index',
                    'stock_report.index', 'wish_report.index', 'user_search_report.index'
                    ]) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-file-alt aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{ translate('Reports') }}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">
                            <a href="{{ route('in_house_sale_report.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['in_house_sale_report.index'])}}">
                                <span class="aiz-side-nav-text">{{ translate('In House Product Sale') }}</span>
                            </a>
                     <a href="{{ route('seller_sale_report.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['seller_sale_report.index'])}}">
                                <span class="aiz-side-nav-text">{{ translate('Seller Products Sale') }}</span>
                            </a>


                            <a href="{{ route('stock_report.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['stock_report.index'])}}">
                                <span class="aiz-side-nav-text">{{ translate('Products Stock') }}</span>
                            </a>

                            <a href="{{ route('wish_report.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['wish_report.index'])}}">
                                <span class="aiz-side-nav-text">{{ translate('Products wishlist') }}</span>
                            </a>


                            <a href="{{ route('user_search_report.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['user_search_report.index'])}}">
                                <span class="aiz-side-nav-text">{{ translate('User Searches') }}</span>
                            </a>
                    </div>
                </div>
            @endif
            @if(Auth::user()->user_type == 'admin' || in_array('11', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes(['flash_deals.index', 'newsletters.index',
                'sms.index', 'subscribers.index', 'coupon.index']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-bullhorn aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{ translate('Marketing') }}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">

                        @if(Auth::user()->user_type == 'admin' || in_array('2', json_decode(Auth::user()->staff->role->permissions)))

                                <a href="{{ route('flash_deals.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['flash_deals.index', 'flash_deals.create', 'flash_deals.edit'])}}">
                                    <span class="aiz-side-nav-text">{{ translate('Flash deals') }}</span>
                                </a>

                        @endif
                        @if(Auth::user()->user_type == 'admin' || in_array('7', json_decode(Auth::user()->staff->role->permissions)))

                                <a href="{{route('newsletters.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['newsletters.index']) }}">
                                    <span class="aiz-side-nav-text">{{ translate('Newsletters') }}</span>
                                </a>

                            @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)

                                    <a href="{{route('sms.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['sms.index']) }}">
                                        <span class="aiz-side-nav-text">{{ translate('Bulk SMS') }}</span>
                                    </a>

                            @endif
                        @endif

                            <a href="{{ route('subscribers.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['subscribers.index']) }}">
                                <span class="aiz-side-nav-text">{{ translate('Subscribers') }}</span>
                            </a>
                            <a href="{{route('coupon.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['coupon.index','coupon.create','coupon.edit'])}}">
                                <span class="aiz-side-nav-text">{{ translate('Coupon') }}</span>
                            </a>
                    </div>
                </div>

                @endif
            @if(Auth::user()->user_type == 'admin' || in_array('12', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes(['support_ticket.admin_index', 'conversations.admin_index', 'seller_messages']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-link aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{translate('Support')}}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">
                        @if(Auth::user()->user_type == 'admin' || in_array('13', json_decode(Auth::user()->staff->role->permissions)))
                            @php
                                $support_ticket = DB::table('tickets')
                                            ->where('viewed', 0)
                                            ->select('id')
                                            ->count();
                            @endphp
                            <a href="{{ route('support_ticket.admin_index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['support_ticket.admin_index', 'support_ticket.admin_show'])}}">
                                <span class="aiz-side-nav-text">{{translate('Ticket')}}</span>
                                @if($support_ticket > 0)<span class="badge badge-info">{{ $support_ticket }}</span>@endif
                            </a>
                        @endif
                        @php
                            $conversation = \App\Conversation::where('receiver_id', Auth::user()->id)->where('receiver_viewed', '1')->get();
                        @endphp
                        @if(Auth::user()->user_type == 'admin' || in_array('16', json_decode(Auth::user()->staff->role->permissions)))
                                <a href="{{ route('conversations.admin_index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['conversations.admin_index', 'conversations.admin_show'])}}">
                                    <span class="aiz-side-nav-text">{{translate('Conversations')}}</span>
                                    @if (count($conversation) > 0)
                                        <span class="badge badge-info">{{ count($conversation) }}</span>
                                    @endif
                                </a>
                        @endif
                        <a href="{{ route('seller_messages') }}" class="aiz-side-nav-link {{ areActiveRoutes(['seller_messages']) }}">
                            <span class="aiz-side-nav-text">{{translate('Seller Messages')}}</span>
                        </a>
                    </div>
                </div>
                @endif
            @if(Auth::user()->user_type == 'admin' || in_array('13', json_decode(Auth::user()->staff->role->permissions)))

                <div class="dropdown {{ areActiveRoutes(['website.header', 'website.footer','website.pages',
                 'custom-pages.create' ,'custom-pages.edit',
                'website.appearance']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-desktop aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{translate('Website Setup')}}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">
                        <a href="{{ route('website.header') }}" class="aiz-side-nav-link {{ areActiveRoutes(['website.header']) }}">
                                    <span class="aiz-side-nav-text">{{translate('Header')}}</span>
                                </a>
                        <a href="{{ route('website.footer') }}" class="aiz-side-nav-link {{ areActiveRoutes(['website.footer']) }}">
                                    <span class="aiz-side-nav-text">{{translate('Footer')}}</span>
                                </a>
                        <a href="{{ route('website.pages') }}" class="aiz-side-nav-link {{ areActiveRoutes(['website.pages', 'custom-pages.create' ,'custom-pages.edit'])}}">
                                    <span class="aiz-side-nav-text">{{translate('Pages')}}</span>
                                </a>
                         <a href="{{ route('website.appearance') }}" class="aiz-side-nav-link {{ areActiveRoutes(['website.appearance']) }}">
                                    <span class="aiz-side-nav-text">{{translate('Appearance')}}</span>
                                </a>

                    </div>
                </div>

                @endif
            @if(Auth::user()->user_type == 'admin' || in_array('14', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes(['general_setting.index',
                'activation.index', 'languages.index', 'languages.create', 'languages.store', 'languages.show', 'languages.edit',
                'currency.index', 'pick_up_points.index','pick_up_points.create','pick_up_points.edit',
                'smtp_settings.index', 'payment_method.index', 'file_system.index', 'social_login.index', 'google_analytics.index',
                'facebook_chat.index', 'google_recaptcha.index', 'shipping_configuration.index', 'shipping_configuration.index',
                'shipping_configuration.edit','shipping_configuration.update',
                'countries.index']) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-dharmachakra aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{translate('Setup & Configurations')}}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">

                                    <a href="{{route('general_setting.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['general_setting.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('General Settings')}}</span>
                                    </a>

                                    <a href="{{route('activation.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['activation.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Features activation')}}</span>
                                    </a>
                                    <a href="{{route('shipping_configuration.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['shipping_configuration.index','shipping_configuration.edit','shipping_configuration.update'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Shipping Configuration')}}</span>
                                    </a>

                                    <a href="{{route('countries.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['countries.index','countries.edit','countries.update'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Shipping Countries')}}</span>
                                    </a>

                                    <a href="{{route('languages.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['languages.index', 'languages.create', 'languages.store', 'languages.show', 'languages.edit'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Languages')}}</span>
                                    </a>

                                    <a href="{{route('currency.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['currency.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Currency')}}</span>
                                    </a>

                                    <a href="{{route('pick_up_points.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['pick_up_points.index','pick_up_points.create','pick_up_points.edit'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Pickup point')}}</span>
                                    </a>

                                    <a href="{{ route('smtp_settings.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['smtp_settings.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('SMTP Settings')}}</span>
                                    </a>

                                    <a href="{{ route('payment_method.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['payment_method.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Payment Methods')}}</span>
                                    </a>

                                    <a href="{{ route('file_system.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['file_system.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('File System Configuration')}}</span>
                                    </a>

                                    <a href="{{ route('social_login.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['social_login.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Social media Logins')}}</span>
                                    </a>

                                    <a href="{{ route('google_analytics.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['google_analytics.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Analytics Tools')}}</span>
                                    </a>

                                    <a href="{{ route('facebook_chat.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['facebook_chat.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Facebook Chat')}}</span>
                                    </a>

                                    <a href="{{ route('google_recaptcha.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['google_recaptcha.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Google reCAPTCHA')}}</span>
                                    </a>
                    </div>
                </div>
            @endif

            @if (\App\Addon::where('unique_identifier', 'offline_payment')->first() != null && \App\Addon::where('unique_identifier', 'offline_payment')->first()->activated)
                @if(Auth::user()->user_type == 'admin' || in_array('16', json_decode(Auth::user()->staff->role->permissions)))
                    <div class="dropdown {{ areActiveRoutes(['manual_payment_methods.index', 'manual_payment_methods.create', 'manual_payment_methods.edit',
                    'offline_wallet_recharge_request.index',
                    'offline_customer_package_payment_request.index', 'offline_seller_package_payment_request.index']) }}">
                        <a href="#" class="dropbtn">
                            <i class="las la-money-check-alt aiz-side-nav-icon"></i>
                            <span class="aiz-side-nav-text">{{translate('Offline Payment System')}}</span>
                            <span class="aiz-side-nav-arrow"></span>
                        </a>
                        <div class="triangle-left"></div>
                        <div class="c-scrollbar dropdown-content">
                                    <a href="{{ route('manual_payment_methods.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['manual_payment_methods.index', 'manual_payment_methods.create', 'manual_payment_methods.edit'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Manual Payment Methods')}}</span>
                                    </a>

                                    <a href="{{ route('offline_wallet_recharge_request.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['offline_wallet_recharge_request.index']) }}">
                                        <span class="aiz-side-nav-text">{{translate('Offline Wallet Recharge')}}</span>
                                    </a>

                                @if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1)

                                        <a href="{{ route('offline_customer_package_payment_request.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['offline_customer_package_payment_request.index']) }}">
                                            <span class="aiz-side-nav-text">{{translate('Offline Customer Package Payments')}}</span>
                                        </a>

                                @endif
                                @if (\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated)

                                        <a href="{{ route('offline_seller_package_payment_request.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['offline_seller_package_payment_request.index']) }}">
                                            <span class="aiz-side-nav-text">{{translate('Offline Seller Package Payments')}}</span>
                                        </a>

                                @endif

                        </div>
                    </div>
                    @endif
            @endif

            {{-- @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                @if(Auth::user()->user_type == 'admin' || in_array('18', json_decode(Auth::user()->staff->role->permissions)))
                    <div class="dropdown">
                        <a href="#" class="dropbtn">
                            <i class="lab la-btc aiz-side-nav-icon"></i>
                            <span class="aiz-side-nav-text">{{translate('Club Point System')}}</span>
                            <span class="aiz-side-nav-arrow"></span>>
                        </a>
                        <div class="triangle-left"></div>
                        <div class="c-scrollbar dropdown-content">


                                    <a href="{{ route('club_points.configs') }}" class="aiz-side-nav-link">
                                        <span class="aiz-side-nav-text">{{translate('Club Point Configurations')}}</span>
                                    </a>

                                    <a href="{{route('set_product_points')}}" class="aiz-side-nav-link {{ areActiveRoutes(['set_product_points', 'product_club_point.edit'])}}">
                                        <span class="aiz-side-nav-text">{{translate('Set Product Point')}}</span>
                                    </a>

                                    <a href="{{route('club_points.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['club_points.index', 'club_point.details'])}}">
                                        <span class="aiz-side-nav-text">{{translate('User Points')}}</span>
                                    </a>


                        </div>
                    </div>

                    @endif
            @endif --}}
            @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                @if(Auth::user()->user_type == 'admin' || in_array('19', json_decode(Auth::user()->staff->role->permissions)))
                    <div class="dropdown {{ areActiveRoutes(['otp.configconfiguration', 'otp_credentials.index']) }}">
                        <a href="#" class="dropbtn">
                            <i class="las la-phone aiz-side-nav-icon"></i>
                            <span class="aiz-side-nav-text">{{translate('OTP System')}}</span>
                            <span class="aiz-side-nav-arrow"></span>
                        </a>
                        <div class="triangle-left"></div>
                        <div class="c-scrollbar dropdown-content">
                            <a href="{{ route('otp.configconfiguration') }}" class="aiz-side-nav-link {{ areActiveRoutes(['otp.configconfiguration', 'otp_credentials.index']) }}">
                                <span class="aiz-side-nav-text">{{translate('OTP Configurations')}}</span>
                            </a>

                            <a href="{{route('otp_credentials.index')}}" class="aiz-side-nav-link">
                                <span class="aiz-side-nav-text">{{translate('Set OTP Credentials')}}</span>
                            </a>
                        </div>
                    </div>
                    @endif
            @endif
            @if(Auth::user()->user_type == 'admin' || in_array('20', json_decode(Auth::user()->staff->role->permissions)))
                <div class="dropdown {{ areActiveRoutes(['staffs.index', 'staffs.create', 'staffs.edit','roles.index', 'roles.create', 'roles.edit' ]) }}">
                    <a href="#" class="dropbtn">
                        <i class="las la-user-tie aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{translate('Staffs')}}</span>
                        <span class="aiz-side-nav-arrow"></span>
                    </a>
                    <div class="triangle-left"></div>
                    <div class="c-scrollbar dropdown-content">

                                <a href="{{ route('staffs.index') }}" class="aiz-side-nav-link {{ areActiveRoutes(['staffs.index', 'staffs.create', 'staffs.edit'])}}">
                                    <span class="aiz-side-nav-text">{{translate('All staffs')}}</span>
                                </a>

                                <a href="{{route('roles.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['roles.index', 'roles.create', 'roles.edit'])}}">
                                    <span class="aiz-side-nav-text">{{translate('Staff permissions')}}</span>
                                </a>

                    </div>
                </div>

            @endif
            {{-- Auth::user()->user_type == 'admin' || in_array('21', json_decode(Auth::user()->staff->role->permissions) --}}
            {{-- @if() --}}
                {{-- <div class="dropdown">
                    <a href="{{route('addons.index')}}" class="dropbtn {{ areActiveRoutes(['addons.index', 'addons.create'])}}">
                        <i class="las la-wrench aiz-side-nav-icon"></i>
                        <span class="aiz-side-nav-text">{{translate('Addon Manager')}}</span>
                    </a>
                    <div class="triangle-left"></div>
                </div> --}}
            {{-- @endif --}}

        </div><!-- .aiz-side-nav-wrap -->
    </div><!-- .aiz-sidebar -->
    <div class="aiz-sidebar-overlay"></div>
</div><!-- .aiz-sidebar -->
