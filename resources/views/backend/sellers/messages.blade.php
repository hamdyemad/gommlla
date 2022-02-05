@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="row align-items-center">
		<div class="col-md-6">
			<h1 class="h3">{{translate('All Messages')}}</h1>
		</div>
	</div>
</div>

<div class="card all-sellers">
    {{-- <form class="" id="sort_sellers" action="" method="GET">
      <div class="card-header row gutters-5">
        <div class="col text-center text-md-left">
          <h5 class="mb-md-0 h6">{{ translate('Sellers') }}</h5>
        </div>
          <div class="col-md-3 ml-auto">
            <select class="form-control aiz-selectpicker" name="approved_status" id="approved_status" onchange="sort_sellers()">
                <option value="">{{translate('Filter by Approval')}}</option>
                <option value="1"  @isset($approved) @if($approved == 'paid') selected @endif @endisset>{{translate('Approved')}}</option>
                <option value="0"  @isset($approved) @if($approved == 'unpaid') selected @endif @endisset>{{translate('Non-Approved')}}</option>
            </select>
          </div>
          <div class="col-md-3">
            <div class="input-group input-group-sm">
              <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type name or email & Enter') }}">
            </div>
          </div>
      </div>
    </form> --}}
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
            <tr>
                <th>#</th>
                <th>{{translate('Product Name')}}</th>
                <th>{{translate('Name')}}</th>
                <th>{{translate('Phone')}}</th>
                <th>{{translate('Message')}}</th>
                <th width="10%">{{translate('Options')}}</th>
            </tr>
            </thead>
            <tbody>
                @foreach($selller_messages as $key => $message)
                <tr>
                    <td>{{ ($key+1) + ($selller_messages->currentPage() - 1)*$selller_messages->perPage() }}</td>
                    <td>{{$message->product->name}}</td>
                    <td>{{$message->name}}</td>
                    <td>{{$message->phone}}</td>
                    <td>{{$message->message}}</td>
                    <td class="text-right">
                        <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('seller_messages.destroy', $message->id)}}" title="{{ translate('Delete') }}">
                            <i class="las la-trash"></i>
                        </a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
          {{ $selller_messages->appends(request()->input())->links() }}
        </div>
    </div>
</div>

@endsection

@section('modal')
	<!-- Delete Modal -->
	@include('modals.delete_modal')
@endsection
