@extends('backend.layouts.app')

@section('content')

<div class="col-lg-6 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Shipping Commission')}}</h5>
        </div>

        <form class="form-horizontal" action="{{ route('commissions.store') }}" method="POST" enctype="multipart/form-data">
        	@csrf
            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="total_price">{{translate('Total Price')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Total Price')}}" name="total_price" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="commission">{{translate('Commission')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Commission')}}" name="commission" class="form-control" required>
                    </div>
                </div>
                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                    <a href="{{ route('commissions.index') }}" class="btn btn-sm btn-danger">{{translate('back')}}</a>
                </div>
            </div>
        </form>

    </div>
</div>

@endsection
