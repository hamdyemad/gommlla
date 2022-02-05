@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="align-items-center">
			<h1 class="h3">{{$title}}</h1>
	</div>
</div>


<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{$model}}</h5>
        <div class="pull-right clearfix">
            <form class="" id="sort_customers" action="" method="GET">
                <div class="box-inline pad-rgt pull-left">
                    <div class="" style="min-width: 200px;">
                        <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type email or name & Enter') }}">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="card-body">
        @if(request('orders'))
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{translate('Name')}}</th>
                    <th>{{translate('Email Address')}}</th>
                    <th>{{translate('Address')}}</th>
                    <th>{{translate('Zone')}}</th>
                    <th>{{translate('Phone')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($customers as $key => $customer)
                    <tr>
                        <td>{{ ($key+1) + ($customers->currentPage() - 1)*$customers->perPage() }}</td>
                        <td>{{$customer->name}}</td>
                        <td>{{$customer->email}}</td>
                        <td>{{$customer->address}}</td>
                        <td>{{$customer->zone}}</td>
                        <td>{{$customer->phone}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        @else
            <table class="table aiz-table mb-0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>{{translate('Name')}}</th>
                        <th>{{translate('Email Address')}}</th>
                        <th>{{translate('Phone')}}</th>
                        <th>{{translate('Package')}}</th>
                        <th>{{translate('Wallet Balance')}}</th>
                        <th>{{translate('Options')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($customers as $key => $customer)
                        @if ($customer->user != null)
                            <tr>
                                <td>{{ ($key+1) + ($customers->currentPage() - 1)*$customers->perPage() }}</td>
                                <td>@if($customer->user->banned == 1) <i class="fa fa-ban text-danger" aria-hidden="true"></i> @endif {{$customer->user->name}}</td>
                                <td>{{$customer->user->email}}</td>
                                <td>{{$customer->user->phone}}</td>
                                <td>
                                    @if ($customer->user->customer_package != null)
                                        {{$customer->user->customer_package->getTranslation('name')}}
                                    @endif
                                </td>
                                <td>{{single_price($customer->user->balance)}}</td>
                                <td class="text-right">
                                <a href="{{route('customers.login', encrypt($customer->id))}}" class="btn btn-soft-primary btn-icon btn-circle btn-sm" title="{{ translate('Log in as this Customer') }}">
                                    <i class="las la-edit"></i>
                                </a>
                                @if($customer->user->banned != 1)
                                    <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm" onclick="confirm_ban('{{route('customers.ban', $customer->id)}}');" title="{{ translate('Ban this Customer') }}">
                                        <i class="las la-user-slash"></i>
                                    </a>
                                @else
                                    <a href="#" class="btn btn-soft-success btn-icon btn-circle btn-sm" onclick="confirm_unban('{{route('customers.ban', $customer->id)}}');" title="{{ translate('Unban this Customer') }}">
                                        <i class="las la-user-check"></i>
                                    </a>
                                @endif
                                <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('customers.destroy', $customer->id)}}" title="{{ translate('Delete') }}">
                                    <i class="las la-trash"></i>
                                </a>


                                @if($active=='true')

                                    <a href="{{route('wholesale_active',['type'=>'active','id'=>$customer->id])}}" class="btn btn-soft-danger btn-icon btn-circle btn-sm " title="{{ translate('Accipt') }}">
                                    <i class="las la-edit"></i>
                                </a>
                                @elseif($active=="not_accept")

                                    <a href="{{route('wholesale_active',['type'=>'not','id'=>$customer->id])}}" class="btn btn-soft-danger btn-icon btn-circle btn-sm "  title="{{ translate('Remove') }}">
                                    <i class="las la-edit"></i>
                                </a>
                                @endif
                            </td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>

        @endif
        <div class="aiz-pagination">
            {{ $customers->appends(request()->input())->links() }}
        </div>
    </div>
</div>


<div class="modal fade" id="confirm-ban">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h6">{{translate('Confirmation')}}</h5>
                <button type="button" class="close" data-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>{{translate('Do you really want to ban this Customer?')}}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">{{translate('Cancel')}}</button>
                <a type="button" id="confirmation" class="btn btn-primary">{{translate('Proceed!')}}</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="confirm-unban">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h6">{{translate('Confirmation')}}</h5>
                <button type="button" class="close" data-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>{{translate('Do you really want to unban this Customer?')}}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">{{translate('Cancel')}}</button>
                <a type="button" id="confirmationunban" class="btn btn-primary">{{translate('Proceed!')}}</a>
            </div>
        </div>
    </div>
</div>
@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection

@section('script')
    <script type="text/javascript">
        function sort_customers(el){
            $('#sort_customers').submit();
        }
        function confirm_ban(url)
        {
            $('#confirm-ban').modal('show', {backdrop: 'static'});
            document.getElementById('confirmation').setAttribute('href' , url);
        }

        function confirm_unban(url)
        {
            $('#confirm-unban').modal('show', {backdrop: 'static'});
            document.getElementById('confirmationunban').setAttribute('href' , url);
        }
    </script>
@endsection
