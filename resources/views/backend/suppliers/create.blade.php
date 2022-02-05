@extends('backend.layouts.app')

@section('content')

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h6">{{translate('Add New Supplier')}}</h5>
    </div>

    <div class="col-lg-6 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('Supplier Information')}}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('suppliers.store') }}" method="POST">
                    @csrf
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Name')}}</label>
                        <div class="col-sm-9">
                            <input type="text" value="{{old('name')}}" placeholder="{{translate('Name')}}" id="name" name="name" class="form-control" required>
                            @error('name')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('phone')}}</label>
                        <div class="col-sm-9">
                            <input type="text"value="{{old('phone')}}" placeholder="{{translate('phone')}}" id="phone" name="phone" class="form-control" >
                       @error('phone')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="email">{{translate('Address')}}</label>
                        <div class="col-sm-9">
                            <input type="text" value="{{old('address')}}" placeholder="{{translate('Address')}}" id="address" name="address" class="form-control" >
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
