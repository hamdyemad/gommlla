@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <h5 class="mb-0 h6">{{translate('Add New Seller')}}</h5>
</div>

<div class="col-lg-6 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Seller Information')}}</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('sellers.store') }}" method="POST">
            	@csrf
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="name">{{translate('Name')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Name')}}" id="name" name="name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="email">{{translate('Email Address')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Email Address')}}" id="email" name="email" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label">{{translate('product sell type')}}</label>
                    <div class="col-sm-9">
                        <select class="form-control aiz-selectpicker" required  multiple name="sell_type[]" id="sell_type"  data-live-search="true">
                            @foreach (\App\Unit::all() as $unit)
                                <option value="{{ $unit->id }}" @if($unit->id == 2) selected @endif>{{ $unit->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="password">{{translate('Password')}}</label>
                    <div class="col-sm-9">
                        <input type="password" placeholder="{{translate('Password')}}" id="password" name="password" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-from-label" for="name">{{translate('commission type')}}</label>
                    <div class="col-sm-9">
                        <select class="form-control aiz-selectpicker" name="commission_type" id="commission_type"  data-live-search="true">
                            <option value="percent">نسبة مئوية</option>
                            <option value="amount">رقم عادى</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col 1 d-none">
                        <label class="col-from-label" for="commission">{{translate('unit commission')}}</label>
                        <div>
                            <input type="number" class="form-control" name="unit_commission" placeholder="{{translate('unit commission')}}" min="1">
                        </div>
                    </div>
                    <div class="col 2">
                        <label class="col-from-label" for="commission">{{translate('wholesale commission')}}</label>
                        <div>
                            <input type="number" class="form-control" name="wholesale_commission" placeholder="{{translate('wholesale commission')}}" min="1">
                        </div>
                    </div>
                </div>
                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-primary">{{translate('Save')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection


@section('script')
    <script>
        $('#sell_type').on('change', function() {
            ['1', '2'].forEach((val) => {
                $("." + val).addClass('d-none');
            });
            $(this).val().forEach((val) => {
                $("." + val).removeClass('d-none');
            });
        });
    </script>
@endsection
