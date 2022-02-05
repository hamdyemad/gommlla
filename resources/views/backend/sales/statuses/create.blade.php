@extends('backend.layouts.app')

@section('content')

<div class="col-lg-7 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Status Information')}}</h5>
        </div>
        <form action="{{ route('statuses.store') }}" method="POST">
            @csrf
            <div class="card-body">
                <div class="form-group row align-items-center">
                    <label class="col-md-3 col-from-label" for="name">{{translate('Status Name')}}</label>
                    <div class="col-md-9">
                        <input type="text" placeholder="{{translate('Status Name')}}" name="status_name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row align-items-center">
                    <label class="col-md-3 col-from-label" for="name">{{translate('Related User')}}</label>
                    <div class="col-md-9">
                        <select class="form-control" name="related_user">
                            <option value="">{{translate('Choose Related User')}}</option>
                            @foreach ($staffs as $staff)
                                @if($staff->user->user_type !== 'admin')
                                    <option value="{{ $staff->user->id }}">{{ $staff->user->name }}</option>
                                @endif
                            @endforeach
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
