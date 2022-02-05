@extends('backend.layouts.app')

@section('content')

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h6">{{translate('Edite expense category')}}</h5>
    </div>

    <div class="col-lg-6 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('expense category Information')}}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('expense_categories.update',$row['id']) }}" method="post">
                    <input type="hidden" name="_method" value="PUT">
                    @csrf
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Name')}}</label>
                        <div class="col-sm-9">
                            <input value="{{$row['name']}}"  type="text" placeholder="{{translate('Name')}}" id="name" name="name" class="form-control" required>
                            @error('name')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('description')}}</label>
                        <div class="col-sm-9">
                            <textarea rows="5" class="form-control" name="description" id="description">{{$row['description']}}</textarea>
                            @error('description')

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
