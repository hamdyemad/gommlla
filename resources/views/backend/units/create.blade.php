@extends('backend.layouts.app')

@section('content')

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h6">{{translate('Add New Units')}}</h5>
    </div>

    <div class="col-lg-6 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('units Information')}}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('units.store') }}" method="POST">
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
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Short Name')}}</label>
                        <div class="col-sm-9">
                            <input type="text" value="{{old('short')}}" placeholder="{{translate('short')}}" id="short" name="short" class="form-control" required>
                            @error('short')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('parent')}}</label>
                        <div class="col-sm-9">
                            <select class="form-control aiz-selectpicker" name="top" id="top">
                                <option value="0">{{translate('No parent')}}</option>
                                @foreach($units as $unit)

                                    <option value="{{$unit['id']}}">{{$unit['name']}}</option>
                                @endforeach

                            </select>
                            @error('top')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('opration')}}</label>
                        <div class="col-sm-9">
                            <select class="form-control aiz-selectpicker" name="opration" id="opration">
                                <option value="*">{{translate('*')}}</option>
                                <option value="/">{{translate('/')}}</option>

                            </select>
                            @error('top')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('value')}}</label>
                        <div class="col-sm-9">
                            <input type="number" value="{{old('value')}}" min="1"step="1" placeholder="{{translate('value')}}" id="value" name="value" class="form-control" required>
                            @error('name')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
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
