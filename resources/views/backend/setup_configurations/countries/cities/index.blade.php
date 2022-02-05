@extends('backend.layouts.app')

@section('content')

    <div class="card">
        <div class="card-header align-items-center">
            <div class="col">
                <h3 class="mb-0 h6">{{ $country->name  . ' Cities'}}</h3>
            </div>
            <div class="col">
                <div class="form-group">
                    <form action="{{ route('countries.cities.index', $country) }}" method="GET">
                        <input class="form-control" type="text" name="name" value="{{ request('name') }}" placeholder="{{ translate('City Name') }}">
                    </form>
                </div>
            </div>
        </div>
        <div class="card-header">
            <a class="btn btn-primary" href="{{ route('countries.cities.create', $country) }}">{{ translate('Create City') }}</a>
        </div>
        <div class="card-body">
            <table class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th width="10%">#</th>
                        <th>{{translate('City Name')}}</th>
                        <th>{{translate('Cost')}}</th>
                        <th>{{translate('Options')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($shippings as $key => $shipping)
                        <tr>
                            <td>{{ ($key+1) + ($shippings->currentPage() - 1)*$shippings->perPage() }}</td>
                            <td>{{ $shipping->city }}</td>
                            <td>{{ $shipping->cost }}</td>
                            <td class="text-right">
                                <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('countries.cities.edit', ['country' => $country, 'city' => $shipping]) }}" title="{{ translate('View') }}">
                                    <i class="las la-edit"></i>
                                </a>
                                <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-toggle="modal" data-target="#remove-city-modal-{{ $shipping->id }}" title="{{ translate('Delete') }}">
                                    <i class="las la-trash"></i>
                                </a>
                                <!-- change status Modal -->
                                    <div id="remove-city-modal-{{ $shipping->id }}" class="modal fade">
                                        <div class="modal-dialog modal-sm modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title h6">remove city</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <form>
                                                        @csrf
                                                        <p>are you sure you want to delete it ?</p>
                                                        <button type="button" class="btn btn-danger mt-2" data-dismiss="modal">{{translate('Cancel')}}</button>
                                                        <button class="btn btn-success mt-2">{{translate('Save')}}</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <!-- /.change status -->
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $shippings->links() }}
            </div>
        </div>
    </div>
@endsection
