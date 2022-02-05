@extends('frontend.layouts.app')

@section('content')

<section class="pt-5 mb-4">
    <div class="container">
        <div class="row aiz-steps arrow-divider">
            <div class="col">
                <div class="text-center text-success">
                    <i class="la-3x mb-2 las la-shopping-cart"></i>
                    <h3 class="fs-14 fw-600 d-none d-lg-block text-capitalize">{{ translate('1. My Cart')}}</h3>
                </div>
            </div>
            <div class="col">
                <div class="text-center text-primary">
                    <i class="la-3x mb-2 active las la-map"></i>
                    <h3 class="fs-14 fw-600 d-none d-lg-block text-capitalize">{{ translate('2. Shipping info')}}</h3>
                </div>
            </div>
            <div class="col">
                <div class="text-center">
                    <i class="la-3x mb-2 opacity-50 las la-credit-card"></i>
                    <h3 class="fs-14 fw-600 d-none d-lg-block opacity-50 text-capitalize">{{ translate('4. Payment')}}</h3>
                </div>
            </div>
            <div class="col">
                <div class="text-center">
                    <i class="la-3x mb-2 opacity-50 las la-check-circle"></i>
                    <h3 class="fs-14 fw-600 d-none d-lg-block opacity-50 text-capitalize">{{ translate('5. Confirmation')}}</h3>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="mb-4 gry-bg">
    <div class="container">
        <form class="form-default" data-toggle="validator" action="{{ route('checkout.store_shipping_infostore') }}" role="form" method="POST">
            @csrf
                @if(Auth::check())
                    <div class="shadow-sm bg-white p-4 rounded mb-4">
                        @if(Auth::user()->user_type !== 'affiliate')
                            <div class="row gutters-5">
                                @foreach (Auth::user()->addresses as $key => $address)
                                    <div class="col-md-6 mb-3">
                                        <label class="aiz-megabox d-block bg-white mb-0">
                                            <input type="radio" name="address_id" value="{{ $address->id }}" @if ($address->set_default)
                                                checked
                                            @endif required>
                                            <span class="d-flex p-3 aiz-megabox-elem">
                                                <span class="aiz-rounded-check flex-shrink-0 mt-1"></span>
                                                <span class="flex-grow-1 pl-3 text-left">
                                                    <div>
                                                        <span class="opacity-60">{{ translate('Address') }}:</span>
                                                        <span class="fw-600 ml-2">{{ $address->address }}</span>
                                                    </div>
                                                    <div>
                                                        <span class="opacity-60">{{ translate('Zone') }}:</span>
                                                        <span class="fw-600 ml-2">{{ $address->zone }}</span>
                                                    </div>
                                                    <div>
                                                        <span class="opacity-60">{{ translate('City') }}:</span>
                                                        <span class="fw-600 ml-2">{{ $address->city->city }}</span>
                                                    </div>
                                                    <div>
                                                        <span class="opacity-60">{{ translate('Country') }}:</span>
                                                        <span class="fw-600 ml-2">{{ $address->country->name }}</span>
                                                    </div>
                                                    <div>
                                                        <span class="opacity-60">{{ translate('Phone') }}:</span>
                                                        <span class="fw-600 ml-2">{{ $address->phone }}</span>
                                                    </div>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                @endforeach
                                <input type="hidden" name="checkout_type" value="logged">
                                <div class="col-md-6 mx-auto mb-3" >
                                    <div class="border p-3 rounded mb-3 c-pointer text-center bg-white h-100 d-flex flex-column justify-content-center" onclick="add_new_address()">
                                        <i class="las la-plus la-2x mb-3"></i>
                                        <div class="alpha-7">{{ translate('Add New Address') }}</div>
                                    </div>
                                </div>
                            </div>
                        @else
                            <div class="shadow-sm bg-white p-4 rounded mb-4">
                                <div class="form-group">
                                    <label class="control-label">{{ translate('Name')}}</label>
                                    <input type="text" class="form-control" name="name" placeholder="{{ translate('Name')}}" required>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">{{ translate('Address')}}</label>
                                    <input type="text" class="form-control" name="address" placeholder="{{ translate('Address')}}" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">{{ translate('Zone')}}</label>
                                    <input type="text" class="form-control" name="zone" placeholder="{{ translate('Zone')}}" required>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">{{ translate('Country')}}</label>
                                        <select class="form-control aiz-selectpicker country-selectable" data-live-search="true" name="country" required>
                                            @foreach ($countries as $key => $country)
                                                <option value="{{ $country->id }}">{{ $country->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group has-feedback">
                                            <label class="control-label">{{ translate('City')}}</label>
                                            <select class="form-control aiz-selectpicker city-selectable" data-live-search="true" name="city" required>
                                                @foreach ($countries[0]->cities as $key => $shipping)
                                                    <option value="{{ $shipping->id }}">{{ $shipping->city . ' : ' . $shipping->cost . ' EGP' }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group has-feedback">
                                            <label class="control-label">{{ translate('Phone')}}</label>
                                            <input type="number" min="0" class="form-control" placeholder="{{ translate('Phone')}}" name="phone" required>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="checkout_type" value="affiliate">
                            </div>
                        @endif
                    </div>
                @else
                    <div class="shadow-sm bg-white p-4 rounded mb-4">
                        <div class="form-group">
                            <label class="control-label">{{ translate('Name')}}</label>
                            <input type="text" class="form-control" name="name" placeholder="{{ translate('Name')}}" required>
                        </div>

                        <div class="form-group">
                            <label class="control-label">{{ translate('Email')}}</label>
                            <input type="text" class="form-control" name="email" placeholder="{{ translate('Email')}}" required>
                        </div>

                        <div class="form-group">
                            <label class="control-label">{{ translate('Address')}}</label>
                            <input type="text" class="form-control" name="address" placeholder="{{ translate('Address')}}" required>
                        </div>

                        <div class="form-group">
                            <label class="control-label">{{ translate('Zone')}}</label>
                            <input type="text" class="form-control" name="zone" placeholder="{{ translate('Zone')}}" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label class="control-label">{{ translate('Country')}}</label>
                                <select class="form-control aiz-selectpicker country-selectable" data-live-search="true" name="country" required>
                                    @foreach ($countries as $key => $country)
                                        <option value="{{ $country->name }}">{{ $country->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label class="control-label">{{ translate('City')}}</label>
                                    <select class="form-control aiz-selectpicker city-selectable" data-live-search="true" name="city" required>
                                        @foreach ($countries[0]->cities as $key => $shipping)
                                            <option value="{{ $shipping->city }}">{{ $shipping->city . ' : ' . $shipping->cost . ' EGP' }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label class="control-label">{{ translate('Phone')}}</label>
                                    <input type="number" min="0" class="form-control" placeholder="{{ translate('Phone')}}" name="phone" required>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="checkout_type" value="guest">
                    </div>
                @endif
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-left order-1 order-md-0">
                    <a href="{{ route('home') }}" class="btn btn-link">
                        <i class="las la-arrow-left"></i>
                        {{ translate('Return to shop')}}
                    </a>
                </div>
                <div class="col-md-6 text-center text-md-right">
                    <button type="submit" class="btn btn-primary fw-600">{{ translate('Continue to Payment')}}</a>
                </div>
            </div>
        </form>
    </div>
</section>
@endsection

@section('modal')
<div class="modal fade" id="new-address-modal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="exampleModalLabel">{{ translate('New Address')}}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-default" role="form" action="{{ route('addresses.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="p-3">
                        <div class="row">
                            <div class="col-md-2">
                                <label class="control-label">{{ translate('Country')}}</label>
                            </div>
                            <div class="col-md-10">
                                <select class="form-control aiz-selectpicker country-selectable" data-live-search="true" name="country" required>
                                    @foreach ($countries as $key => $country)
                                        <option value="{{ $country->name }}">{{ $country->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-2">
                                <label class="control-label">{{ translate('City')}}</label>
                            </div>
                            <div class="col-md-10">
                                <div class="form-group has-feedback">
                                    <select class="form-control aiz-selectpicker city-selectable" data-live-search="true" name="city" required>
                                        @foreach ($countries[0]->cities as $key => $shipping)
                                            <option value="{{ $shipping->id }}">{{ $shipping->city . ' : ' . $shipping->cost . ' EGP' }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Address')}}</label>
                            </div>
                            <div class="col-md-10">
                                <textarea class="form-control textarea-autogrow mb-3" placeholder="{{ translate('Your Address')}}" rows="1" name="address" required></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Zone')}}</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control mb-3" placeholder="{{ translate('Your Zone')}}" name="zone" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Phone')}}</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control mb-3" placeholder="{{ translate('Your Phone')}}" name="phone" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">{{  translate('Save') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section('script')
<script type="text/javascript">
    function add_new_address(){
        $('#new-address-modal').modal('show');
    }
    $('.country-selectable').on('change', function() {
        $.ajax({
            method: 'POST',
            url: "{{ route('country.cities') }}",
            data: {
                '_token': "{{ csrf_token() }}",
                'country': this.value
            },
            success: function(data) {
                if(data.length !== 0) {
                    $('.city-selectable select').empty();
                    data.forEach((obj) => {
                        let option = `<option value='${obj.city}'>${obj.city}:${obj.cost} EGP</option>`;
                        $('.city-selectable select').append(option);
                    });
                }
            },
            error: function (err) {
                console.log(err)
            }
        });
    });
</script>
@endsection
