@extends('backend.layouts.app')

@section('content')

<div class="card">
    <div class="card-header">
        <h3 class="mb-0 h6">{{translate('Pickup Point Orders')}}</h3>
    </div>
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{translate('Pickup Id')}}</th>
                    <th>{{translate('Num. of Orders')}}</th>
                    <th>{{translate('Amount')}}</th>
                    <th>{{translate('Delivery Status')}}</th>
                    <th>{{translate('Payment Method')}}</th>
                    <th>{{translate('Payment Status')}}</th>
                    <th class="text-right" width="15%">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($pickups as $key => $pickup)
                <tr>
                    <td>
                        {{ $pickup->id }}
                    </td>
                    <td>
                        {{ $pickup->name }}
                    </td>
                    <td>
                        {{ $pickup->address }}
                    </td>
                    <td>
                        {{ $pickup->phone }}
                    </td>
                    <td>
                        <button class="btn btn-primary w-100 p-1" data-toggle="modal" data-target="#status-modal-{{ $pickup->id }}">
                            {{ $pickup->pick_up_status }}
                        </button>
                        <!-- change status Modal -->
                            <div id="status-modal-{{ $pickup->id }}" class="modal fade">
                                <div class="modal-dialog modal-sm modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title h6">تغيير الحالة</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                        </div>
                                        <div class="modal-body text-center">
                                            <form action="{{ route('all_orders.order_status', $pickup) }}" method="POST">
                                                @csrf
                                                <div class="form-group">
                                                    <select name="delivery_status" class="form-control">
                                                        <option value="">أختر الحالة</option>
                                                        {{-- @foreach ($statuses as $status)
                                                            <option value="{{ $status->status_name }}">{{ $status->status_name }}</option>
                                                        @endforeach --}}
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <input class="form-control" type="text" name="delivery_reason" placeholder="{{ translate('reason') }}">
                                                </div>
                                                <button type="button" class="btn btn-danger mt-2" data-dismiss="modal">{{translate('Cancel')}}</button>
                                                <button type="submit" class="btn btn-success mt-2">{{translate('Save')}}</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!-- /.change status -->
                    </td>
                    <td class="text-right">
                        {{-- <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('pick_up_point.order_show', encrypt($order->id)) }}" title="{{ translate('View') }}">
                            <i class="las la-eye"></i>
                        </a>
                        <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('admin.invoice.download', $order->id) }}" title="{{ translate('Download Invoice') }}">
                            <i class="las la-download"></i>
                        </a>
                        <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('orders.destroy', $order->id)}}" title="{{ translate('Delete') }}">
                            <i class="las la-trash"></i>
                        </a> --}}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $pickups->links() }}
        </div>
    </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection


@section('script')
    <script type="text/javascript">

    </script>
@endsection
