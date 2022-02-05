@extends('backend.layouts.app')

@section('content')

<div class="col-lg-10 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Distribution Of Orders')}}</h5>
        </div>

        <div class="card-body">
            <form action="{{ route('distribution-of-orders') }}" method="GET">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <select class="form-control" name="country">
                                <option value="">{{ translate('select country') }}</option>
                                @foreach ($countries as $country)
                                    <option value="{{ $country->id }}" @if(request('country') == $country->id) selected @endif>{{ $country->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <input class="form-control" value="{{ request('city') }}" type="text" name="city" placeholder="{{ translate('city name') }}">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <button class="btn btn-success">{{ translate('search') }}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th width="10%">#</th>
                    <th>{{translate('Name')}}</th>
                    <th>{{translate('Cost')}}</th>
                    <th width="10%">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @if(count($cities) > 0)
                    @foreach($cities as $key => $city)
                    <tr>
                        <td>{{ ($key+1) + ($cities->currentPage() - 1)*$cities->perPage() }}</td>
                        <td>{{$city->city}}</td>
                        <td>{{single_price($city->cost)}}</td>
                        <td>
                            <form style="width: max-content" action="{{ route('distribution-of-orders') }}" method="POST">
                                @csrf
                                <input type="text" name="city_id" hidden value="{{ $city->id }}">
                                <select class="form-control" name="user_id" onchange="this.form.submit()">
                                    <option value="">{{ translate('select shipping') }}</option>
                                    @foreach ($staffs as $staff)
                                        <option value="{{ $staff->user_id }}"
                                            @if(count($staff->user->distributions) > 0)
                                                @foreach ($staff->user->distributions as $distribution)
                                                    @if($distribution->city_id == $city->id)
                                                        selected
                                                    @endif
                                                @endforeach
                                            @endif
                                        >
                                            {{ $staff->user->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                @endif
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $cities->appends(request()->input())->links() }}
        </div>

    </div>
</div>

@endsection
