@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="row align-items-center">
		<div class="col-md-6">
			<h1 class="h3">{{translate('All Shipping Commissions')}}</h1>
		</div>
		<div class="col-md-6 text-md-right">
			<a href="{{ route('commissions.create') }}" class="btn btn-circle btn-info">
				<span>{{translate('Add Shipping Commission')}}</span>
			</a>
		</div>
	</div>
</div>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{translate('Shipping Commissions')}}</h5>
    </div>
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th width="10%">#</th>
                    <th>{{translate('Total Price')}}</th>
                    <th>{{translate('Commission')}}</th>
                    <th width="10%">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($shipping_commissions as $key => $shipping_commission)
                    <tr>
                        <td>{{ ($key+1) + ($shipping_commissions->currentPage() - 1)*$shipping_commissions->perPage() }}</td>
                        <td>{{$shipping_commission->total_price}}</td>
                        <td>{{$shipping_commission->commission}}</td>
                        <td class="text-right">
                                <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('commissions.edit', $shipping_commission)}}" title="{{ translate('Edit') }}">
                                    <i class="las la-edit"></i>
                                </a>
                                <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('commissions.destroy', $shipping_commission)}}" title="{{ translate('Delete') }}">
                                    <i class="las la-trash"></i>
                                </a>
                            </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $shipping_commissions->appends(request()->input())->links() }}
        </div>
    </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection
