@extends('backend.layouts.app')

@section('content')
@if(env('MAIL_USERNAME') == null && env('MAIL_PASSWORD') == null)
    <div class="">
        <div class="alert alert-danger d-flex align-items-center">
            {{translate('Please Configure SMTP Setting to work all email sending funtionality')}},
            <a class="alert-link ml-2" href="{{ route('smtp_settings.index') }}">{{ translate('Configure Now') }}</a>
        </div>
    </div>
@endif
@if(Auth::user()->user_type == 'admin' || in_array('1', json_decode(Auth::user()->staff->role->permissions)))
<div class="row gutters-10">
    <div class="col-lg-12">
        <div class="row gutters-10">
            <div class="col-6 col-md-3">
                <div class="bg-grad-1 text-white rounded-lg mb-4 overflow-hidden">
                    <div class="px-3 pt-3">
                        <div class="opacity-50">
                            <span class="fs-12 d-block">{{ translate('Total') }}</span>
                            {{ translate('Product category') }}
                        </div>
                        <div class="h3 fw-700 mb-3">{{ \App\Category::all()->count() }}</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                        <path fill="rgba(255,255,255,0.3)" fill-opacity="1" d="M0,128L34.3,112C68.6,96,137,64,206,96C274.3,128,343,224,411,250.7C480,277,549,235,617,213.3C685.7,192,754,192,823,181.3C891.4,171,960,149,1029,117.3C1097.1,85,1166,43,1234,58.7C1302.9,75,1371,149,1406,186.7L1440,224L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z"></path>
                    </svg>
                </div>
            </div>
              <div class="col-6 col-md-3">
                <div class="bg-grad-1 text-white rounded-lg mb-4 overflow-hidden">
                    <div class="px-3 pt-3">
                        <div class="opacity-50">
                            <span class="fs-12 d-block">{{ translate('Total') }}</span>
                            {{ translate('Product sub category') }}
                        </div>
                        <div class="h3 fw-700 mb-3">{{ \App\SubCategory::all()->count() }}</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                        <path fill="rgba(255,255,255,0.3)" fill-opacity="1" d="M0,128L34.3,112C68.6,96,137,64,206,96C274.3,128,343,224,411,250.7C480,277,549,235,617,213.3C685.7,192,754,192,823,181.3C891.4,171,960,149,1029,117.3C1097.1,85,1166,43,1234,58.7C1302.9,75,1371,149,1406,186.7L1440,224L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z"></path>
                    </svg>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="bg-grad-1 text-white rounded-lg mb-4 overflow-hidden">
                    <div class="px-3 pt-3">
                        <div class="opacity-50">
                            <span class="fs-12 d-block">{{ translate('Total') }}</span>
                            {{ translate('Product sub sub category') }}
                        </div>
                        <div class="h3 fw-700 mb-3">{{ \App\SubSubCategory::all()->count() }}</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                        <path fill="rgba(255,255,255,0.3)" fill-opacity="1" d="M0,128L34.3,112C68.6,96,137,64,206,96C274.3,128,343,224,411,250.7C480,277,549,235,617,213.3C685.7,192,754,192,823,181.3C891.4,171,960,149,1029,117.3C1097.1,85,1166,43,1234,58.7C1302.9,75,1371,149,1406,186.7L1440,224L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z"></path>
                    </svg>
                </div>
            </div>

            <div class="col-6 col-md-3">
                <div class="bg-grad-1 text-white rounded-lg mb-4 overflow-hidden">
                    <div class="px-3 pt-3">
                        <div class="opacity-50">
                            <span class="fs-12 d-block">{{ translate('Total') }}</span>
                            {{ translate('Product brand') }}
                        </div>
                        <div class="h3 fw-700 mb-3">{{ \App\Brand::all()->count() }}</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                        <path fill="rgba(255,255,255,0.3)" fill-opacity="1" d="M0,128L34.3,112C68.6,96,137,64,206,96C274.3,128,343,224,411,250.7C480,277,549,235,617,213.3C685.7,192,754,192,823,181.3C891.4,171,960,149,1029,117.3C1097.1,85,1166,43,1234,58.7C1302.9,75,1371,149,1406,186.7L1440,224L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z"></path>
                    </svg>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
         <div class="row gutters-10">

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0 fs-14">{{ translate('sale in Hour') }}</h6>
                        </div>
                        <div class="card-body">
                            <canvas id="report_hour" class="w-100" height="500"></canvas>
                        </div>
                    </div>
                </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('sale in week') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="report_day" class="w-100" height="500"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('sale in Month') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="report_month" class="w-100" height="500"></canvas>
                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('sale in Year') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="report_year" class="w-100" height="500"></canvas>
                    </div>
                </div>
            </div>

             </div>
    </div>
    <div class="col-lg-12">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Customers in Days') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="customer_day" class="w-100" height="500"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Affiliate in Days') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="affiliate_day" class="w-100" height="500"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Seller in Days') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="seller_day" class="w-100" height="500"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="row gutters-10">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Orders') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="pie-5" class="w-100" height="305"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Products') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="pie-1" class="w-100" height="305"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Sellers') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="pie-2" class="w-100" height="305"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="row gutters-10">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Customers') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="pie-3" class="w-100" height="305"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h6 class="mb-0 fs-14">{{ translate('Affiliates') }}</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="pie-4" class="w-100" height="305"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endif


@if(Auth::user()->user_type == 'admin' || in_array('1', json_decode(Auth::user()->staff->role->permissions)))
    <div class="row gutters-10">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h6 class="mb-0 fs-14">{{ translate('Category wise product sale') }}</h6>
                </div>
                <div class="card-body">
                    <canvas id="graph-1" class="w-100" height="500"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h6 class="mb-0 fs-14">{{ translate('Category wise product stock') }}</h6>
                </div>
                <div class="card-body">
                    <canvas id="graph-2" class="w-100" height="500"></canvas>
                </div>
            </div>
        </div>
    </div>
@endif

@if(Auth::user()->user_type == 'admin')
<div class="card">
    <div class="card-header">
        <h6 class="mb-0">{{ translate('Top 12 Products') }}</h6>
    </div>
    <div class="card-body">
        <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5" data-lg-items="4" data-md-items="3" data-sm-items="2" data-arrows='true'>
            @foreach (filter_products(\App\Product::where('published', 1)->orderBy('num_of_sale', 'desc'))->limit(12)->get() as $key => $product)
                <div class="carousel-box">
                    <div class="aiz-card-box border border-light rounded shadow-sm hov-shadow-md mb-2 has-transition bg-white">
                        <div class="position-relative">
                            <a href="{{ route('product', $product->slug) }}" class="d-block">
                                <img
                                    class="img-fit lazyload mx-auto h-210px"
                                    src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                    data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                    alt="{{  $product->getTranslation('name')  }}"
                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                >
                            </a>
                        </div>
                        <div class="p-md-3 p-2 text-left">
                            <div class="fs-15">
                                <div class="badge badge-primary w-100">سعر الجملة</div>
                                @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                    <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, 'wholesale_price', true) }}</del>
                                @endif
                                <span class="fw-700 text-primary">{{ home_discounted_base_price($product->id, 'wholesale_price', true) }}</span>
                                <div class="badge badge-primary w-100">سعر القطاعى</div>
                                    <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product->id, null, true) }}</del>
                                <span class="fw-700 text-primary">{{ home_discounted_base_price($product->id, null, true) }}</span>

                            </div>
                            <div class="rating rating-sm mt-1">
                                {{ renderStarRating($product->rating) }}
                            </div>
                            <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0">
                                <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{ $product->getTranslation('name') }}</a>
                            </h3>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
@endif


@endsection
@section('script')
<script type="text/javascript">
    AIZ.plugins.chart('#pie-1',{
        type: 'doughnut',
        data: {
            labels: [
                '{{translate('Total published products')}}',
                '{{translate('Total sellers products')}}',
                '{{translate('Total admin products')}}'
            ],
            datasets: [
                {
                    data: [
                        {{ \App\Product::where('published', 1)->get()->count() }},
                        {{ \App\Product::where('published', 1)->where('added_by', 'seller')->get()->count() }},
                        {{ \App\Product::where('published', 1)->where('added_by', 'admin')->get()->count() }}
                    ],
                    backgroundColor: [
                        // "#fd3995",
                        // "#34bfa3",
                        // "#5d78ff",
                        // '#fdcb6e',
                        // '#d35400',
                        // '#8e44ad',
                        // '#006442',
                        // '#68ac41',
                        // '#CA6924',
                        // '#C91F37'
                        "#77be44",
                        '#68ac41',
                        "#ff6702",
                    ]
                }
            ]
        },
        options: {
            cutoutPercentage: 70,
            legend: {
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
                position: 'bottom'
            }
        }
    });

    AIZ.plugins.chart('#pie-2',{
        type: 'doughnut',
        data: {
            labels: [
                '{{translate('Total sellers')}}',
                '{{translate('Total approved sellers')}}',
                '{{translate('Total pending sellers')}}'
            ],
            datasets: [
                {
                    data: [
                        {{ \App\Seller::all()->count() }},
                        {{ \App\Seller::where('verification_status', 1)->get()->count() }},
                        {{ \App\Seller::where('verification_status', 0)->count() }}
                    ],
                    backgroundColor: [
                        // "#fd3995",
                        // "#34bfa3",
                        // "#5d78ff",
                        // '#fdcb6e',
                        // '#d35400',
                        // '#8e44ad',
                        // '#006442',
                        // '#68ac41',
                        // '#CA6924',
                        // '#C91F37'
                          "#77be44",
                          "#ff6702",
                        '#68ac41',

                    ]
                }
            ]
        },
        options: {
            cutoutPercentage: 70,
            legend: {
                labels: {
                    fontFamily: 'Montserrat',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
                position: 'bottom'
            }
        }
    });
    AIZ.plugins.chart('#pie-3',{
        type: 'doughnut',
        data: {
            labels: [
                '{{translate('Total Customers')}}',
                '{{translate('Banned Customers')}}'
            ],
            datasets: [
                {
                    data: [
                        {{ \App\User::where('user_type', 'customer')->get()->count() }},
                        {{ \App\User::where('user_type', 'customer')->where('banned', 1)->get()->count() }}
                    ],
                    backgroundColor: [
                        // "#fd3995",
                        // "#34bfa3",
                        // "#5d78ff",
                        // '#fdcb6e',
                        // '#d35400',
                        // '#8e44ad',
                        // '#006442',
                        // '#68ac41',
                        // '#CA6924',
                        // '#C91F37'
                          "#77be44",
                          "#ff6702",
                        // '#68ac41',

                    ]
                }
            ]
        },
        options: {
            cutoutPercentage: 70,
            legend: {
                labels: {
                    fontFamily: 'Montserrat',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
                position: 'bottom'
            }
        }
    });
    AIZ.plugins.chart('#pie-4',{
        type: 'doughnut',
        data: {
            labels: [
                '{{translate('Total Affiliates')}}'
            ],
            datasets: [
                {
                    data: [
                        {{ \App\User::where('user_type', 'affiliate')->get()->count() }}
                    ],
                    backgroundColor: [
                        // "#fd3995",
                        // "#34bfa3",
                        // "#5d78ff",
                        // '#fdcb6e',
                        // '#d35400',
                        // '#8e44ad',
                        // '#006442',
                        // '#68ac41',
                        // '#CA6924',
                        // '#C91F37'
                          "#77be44",
                        //   "#ff6702",
                        // '#68ac41',

                    ]
                }
            ]
        },
        options: {
            cutoutPercentage: 70,
            legend: {
                labels: {
                    fontFamily: 'Montserrat',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
                position: 'bottom'
            }
        }
    });
    AIZ.plugins.chart('#pie-5',{
        type: 'doughnut',
        data: {
            labels: [
                '{{translate('Total Orders')}}',
                '{{translate('Orders Status') . "(تم التجهيز)" }}',
                '{{translate('Orders Status') . "(مرتجع)" }}',
                '{{translate('Orders Status') . "(مرتجع بعد التحصيل)" }}',
            ],
            datasets: [
                {
                    data: [
                        {{ \App\Order::all()->count() }},
                        {{ \App\OrderDetail::where('seller_status', 'تم التجهيز')->get()->count() }},
                        {{ \App\OrderDetail::where('delivery_status', 'مرتجع')->get()->count() }},
                        {{ \App\OrderDetail::where('refundable', 1)->get()->count() }},
                    ],
                    backgroundColor: [
                        // "#fd3995",
                        // "#34bfa3",
                        // "#5d78ff",
                        // '#fdcb6e',
                        // '#d35400',
                        // '#8e44ad',
                        // '#006442',
                        // '#68ac41',
                        // '#CA6924',
                          "#77be44",
                          "#ff6702",
                        '#C91F37',
                        '#C91F37',

                    ]
                }
            ]
        },
        options: {
            cutoutPercentage: 70,
            legend: {
                labels: {
                    fontFamily: 'Montserrat',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
                position: 'bottom'
            }
        }
    });
    var sfs = {
            labels: [
                @foreach (\App\Category::all() as $key => $category)
                '{{ $category->getTranslation('name') }}',
                @endforeach
            ],
            datasets: [
                @foreach (\App\Category::all() as $key => $category)
                {{ \App\Product::where('category_id', $category->id)->sum('num_of_sale') }},
                @endforeach
            ]
    }
    AIZ.plugins.chart('#graph-1',{
        type: 'bar',
        data: {
            labels: [
                @foreach (\App\Category::all() as $key => $category)
                '{{ $category->getTranslation('name') }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Number of sale') }}',
                data: [
                    @foreach (\App\Category::all() as $key => $category)
                    {{ \App\Product::where('category_id', $category->id)->sum('num_of_sale') }},
                    @endforeach
                ],

                backgroundColor: [
                    @foreach (\App\Category::all() as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach (\App\Category::all() as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });
    AIZ.plugins.chart('#graph-2',{
        type: 'bar',
        data: {
            labels: [
                @foreach (\App\Category::all() as $key => $category)
                '{{ $category->getTranslation('name') }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Number of Stock') }}',
                data: [
                    @foreach (\App\Category::all() as $key => $category)
                        @php
                            $products = \App\Product::where('category_id', $category->id)->get();
                            $qty = 0;
                            foreach ($products as $key => $product) {
                                if ($product->variant_product) {
                                    foreach ($product->stocks as $key => $stock) {
                                        $qty += $stock->qty;
                                    }
                                }
                                else {
                                    $qty = $product->current_stock;
                                }
                            }
                        @endphp
                        {{ $qty }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach (\App\Category::all() as $key => $category)
                        'rgba(119, 190, 68,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach (\App\Category::all() as $key => $category)
                        'rgba(119, 190, 68,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });





     AIZ.plugins.chart('#report_day',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($date_day as $key => $day)

                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Sall IN weekly') }}',
                data: [
                    @foreach ($data_day  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($data_day as $key => $category)
                        'rgba(119, 190, 68,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($data_day as $key => $category)
                        'rgba(119, 190, 68,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });


      AIZ.plugins.chart('#report_month',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($date_month as $key => $day)

                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Sall IN month') }}',
                data: [
                    @foreach ($data_month  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($data_month as $key => $category)
                       'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($data_month as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });


      AIZ.plugins.chart('#report_year',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($date_year as $key => $day)

                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Sall IN Year') }}',
                data: [
                    @foreach ($data_year  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($data_year as $key => $category)
                       'rgba(119, 190, 68,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($data_year as $key => $category)
                        'rgba(119, 190, 68,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });
     AIZ.plugins.chart('#report_hour',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($date_hour as $key => $day)

                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Sall IN Hour') }}',
                data: [
                    @foreach ($data_hour  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($data_hour as $key => $category)
                       'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($data_hour as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });
    AIZ.plugins.chart('#customer_day',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($customer_date_day as $key => $day)
                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Customers IN Days') }}',
                data: [
                    @foreach ($customer_data_day  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($customer_data_day as $key => $category)
                       'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($customer_data_day as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });
    AIZ.plugins.chart('#affiliate_day',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($affiliate_date_day as $key => $day)
                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Affiliates IN Days') }}',
                data: [
                    @foreach ($affiliate_data_day  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($affiliate_data_day as $key => $category)
                       'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($affiliate_data_day as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });
    AIZ.plugins.chart('#seller_day',{
        type: 'bar',
        data: {
            labels: [
                @foreach ($seller_date_day as $key => $day)
                '{{$day }}',
                @endforeach
            ],
            datasets: [{
                label: '{{ translate('Sellers IN Days') }}',
                data: [
                    @foreach ($seller_data_day  as $key=> $dat_day)

                       {{$dat_day }},
                    @endforeach
                ],
                backgroundColor: [
                    @foreach ($seller_data_day as $key => $category)
                       'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderColor: [
                    @foreach ($seller_data_day as $key => $category)
                        'rgba(6, 68, 115,1)',
                    @endforeach
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    gridLines: {
                        color: '#f2f3f8',
                        zeroLineColor: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    gridLines: {
                        color: '#f2f3f8'
                    },
                    ticks: {
                        fontColor: "#8b8b8b",
                        fontFamily: 'Poppins',
                        fontSize: 10
                    }
                }]
            },
            legend:{
                labels: {
                    fontFamily: 'Poppins',
                    boxWidth: 10,
                    usePointStyle: true
                },
                onClick: function () {
                    return '';
                },
            }
        }
    });


</script>
@endsection
