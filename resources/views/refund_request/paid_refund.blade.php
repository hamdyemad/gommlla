@extends('backend.layouts.app')

@section('content')

<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{translate('Refund Request All')}}</h5>
    </div>
    <div class="card-body">
        <table class="table aiz-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{translate('Order Code')}}</th>
                    <th>{{ translate('Name') }}</th>
                    <th>{{translate('Seller Name')}}</th>
                    <th>{{translate('Delivery')}}</th>
                    <th>{{translate('Product')}}</th>
                    <th>{{translate('Seller Price')}}</th>
                    <th>{{translate('Admin Commission')}}</th>
                    <th>{{translate('Main Price')}}</th>
                    <th>{{translate('Admin Approval')}}</th>
                    <th>{{translate('Refund Status')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($refunds as $key => $refund)

                    <tr>
                        <td>{{ ($key+1) + ($refunds->currentPage() - 1)*$refunds->perPage() }}</td>
                        <td>
                          @if($refund->order != null)
                              {{ $refund->order->code }}
                          @else
                              {{ translate('Order deleted') }}
                          @endif
                        </td>
                        <td>
                            {{ $refund->user->name }}
                        </td>
                        <td>
                            @if ($refund->seller != null)
                                {{ $refund->seller->name }}
                            @endif
                        </td>
                        @if($refund->orderDetail)
                            <td>
                                {{ $refund->orderDetail->delivery->name }}
                            </td>
                        @endif
                        <td>
                            @if ($refund->orderDetail != null && $refund->orderDetail->product != null)
                              <a href="{{ route('product', $refund->orderDetail->product->slug) }}" target="_blank" class="media-block">
                                <div class="form-group d-flex">
                                    <img src="{{ uploaded_asset($refund->orderDetail->product->thumbnail_img)}}" alt="Image" class="w-50px h-50px">
                                    <div class="media-body p-3 pt-0" style="padding-top: 0 !important">{{ $refund->orderDetail->product->getTranslation('name') }}</div>
                                </div>
                              </a>
                            @endif
                        </td>
                        @if($refund->orderDetail)
                            <td>
                                @if ($refund->orderDetail != null)
                                    {{ single_price(\App\orders_should_payments::where('seller_id', $refund->orderDetail->user->seller->id)
                                    ->where('order_id', $refund->orderDetail->id)
                                    ->first()->amount) }}
                                @endif
                            </td>
                            <td>
                                {{ format_price(\App\wallet_history::where('order_id', $refund->order_detail_id)->first()->amount) }}
                            </td>
                            <td>{{ format_price($refund->orderDetail->price) }}</td>
                        @endif

                        <td>
                            @if ($refund->admin_approval == 1)
                              <span class="badge badge-inline badge-success">{{translate('Approved')}}</span>
                            @endif
                        </td>
                        <td>
                            @if ($refund->refund_status == 1)
                              <span class="badge badge-inline badge-success">{{translate('Paid')}}</span>
                            @else
                              <span class="badge badge-inline badge-warning">{{translate('Non-Paid')}}</span>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="clearfix">
            <div class="pull-right">
                {{ $refunds->appends(request()->input())->links() }}
            </div>
        </div>
    </div>
</div>

@endsection
