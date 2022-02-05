@extends('backend.layouts.app')

@section('content')
<div class="col-lg-7 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{ $country->name . ' Create City' }}</h5>
        </div>
        <form method="POST" action="{{ route('countries.cities.store', $country) }}">
            @csrf
            <input hidden name="country_id" value="{{ $country->id }}" type="text">
            <div class="card-body">
                <div class="form-group row align-items-center">
                    <label class="col-md-2 col-from-label" for="name">{{translate('City Name')}}</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="{{translate('City Name')}}" id="city" name="city" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label class="col-md-2 col-from-label" for="name">{{translate('Cost')}}</label>
                    <div class="col-md-10">
                        <input type="text" placeholder="{{translate('Cost')}}" id="cost" name="cost" class="form-control" required>
                    </div>
                </div>
                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                    <a href="{{ route('countries.cities.index', $country) }}" class="btn btn-sm btn-info">{{translate('Return')}}</a>
                </div>
            </div>
        </form>
    </div>
</div>

@endsection
