@extends('backend.layouts.app')

@section('content')

<div class="col-lg-7 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Status Information')}}</h5>
        </div>
        <form action="{{ route('statuses.update', $status) }}" method="POST">
            @method('PATCH')
            @csrf
            <div class="card-body">
                <div class="form-group row align-items-center">
                    <label class="col-md-3 col-from-label" for="name">{{translate('Status Name')}}</label>
                    <div class="col-md-9">
                        <input type="text" value="{{ $status->status_name }}" placeholder="{{translate('Status Name')}}" name="status_name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label class="col-md-3 col-from-label" for="name">{{translate('Payment Status')}}</label>
                    <div class="col-md-9">
                        <select class="form-control" name="payment_status">
                            <option value="0" @if($status->payment_status == 0) selected @endif>{{translate('No')}}</option>
                            <option value="1" @if($status->payment_status == 1) selected @endif>{{translate('Yes')}}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                    <a href="{{ route('statuses.index') }}" class="btn btn-sm btn-info">{{translate('Return To Statuses')}}</a>
                </div>
            </div>
        </form>
    </div>
</div>

@endsection
