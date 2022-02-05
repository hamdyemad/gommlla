@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="row align-items-center">
		<div class="col-md-6">
			<h1 class="h3">{{translate('All Statuses')}}</h1>
		</div>
		<div class="col-md-6 text-md-right">
			<a href="{{ route('statuses.create') }}" class="btn btn-circle btn-info">
				<span>{{translate('Add New Status')}}</span>
			</a>
		</div>
	</div>
</div>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{translate('Statuses')}}</h5>
    </div>
    <div class="card-body">
        <table class="table aiz-table">
            <thead>
                <tr>
                    <th width="10%">#</th>
                    <th>{{translate('Name')}}</th>
                    <th>{{translate('Related User')}}</th>
                    <th width="10%">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($statuses as $key => $status)
                    <tr>
                        <td>{{ ($key+1) + ($statuses->currentPage() - 1)*$statuses->perPage() }}</td>
                        <td>{{ $status->status_name}}</td>
                        <td>
                            @if($status->user)
                            {{ $status->user->name }}
                            @else
                            {{ $status->related_user }}
                            @endif
                        </td>
                        <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('statuses.edit', $status )}}" title="{{ translate('Edit') }}">
                                <i class="las la-edit"></i>
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $statuses->appends(request()->input())->links() }}
        </div>
    </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection
