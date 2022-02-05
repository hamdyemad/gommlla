@extends('backend.layouts.app')

@section('content')

<!-- Basic Data Tables -->
<!--===================================================-->
<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{translate('Refund Request All')}}</h5>
    </div>
    <div class="card-body">
        <table class="table aiz-table table-responsive">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{translate('Order Code')}}</th>
                    <th>{{ translate('Customer Name') }}</th>
                    <th>{{translate('Seller Name')}}</th>
                    <th>{{translate('Delivery')}}</th>
                    <th>{{translate('Product')}}</th>
                    <th>{{translate('Seller Price')}}</th>
                    <th>{{translate('Admin Commission')}}</th>
                    <th>{{translate('Affiliate Commission')}}</th>
                    <th>{{translate('Main Price')}}</th>
                    <th>{{translate('Refund Status')}}</th>
                    <th width="10%">{{translate('Options')}}</th>
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
                        <td>
                            {{ $refund->orderDetail->delivery->name }}
                        </td>
                        <td>
                            @if ($refund->orderDetail != null && $refund->orderDetail->product != null)
                              <a href="{{ route('product', $refund->orderDetail->product->slug) }}" target="_blank" class="media-block">
                                <div class="form-group d-flex">
                                    <img src="{{ uploaded_asset($refund->orderDetail->product->thumbnail_img) }}" alt="Image" class="w-50px h-50px rounded">
                                    <div class="media-body p-3 pt-0" style="padding-top: 0 !important">{{ $refund->orderDetail->product->getTranslation('name') }}</div>
                                </div>
                              </a>
                            @endif
                        </td>
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
                        <td>
                            @php
                               $affiliate = \App\orders_should_payments::where('user_id', $refund->orderDetail->order->user->id)
                            ->where('order_id', $refund->orderDetail->id)
                            ->first();
                            @endphp
                            @if($affiliate)
                                {{ format_price(\App\orders_should_payments::where('user_id', $refund->orderDetail->order->user->id)
                                ->where('order_id', $refund->orderDetail->id)
                                ->first()->amount) }}
                            @else
                            ------
                            @endif
                        </td>
                        <td>{{ format_price($refund->orderDetail->price) }}</td>
                        <td>
                            @if ($refund->refund_status == 1)
                              <span class="badge badge-inline badge-success">{{translate('Paid')}}</span>
                            @else
                              <span class="badge badge-inline badge-warning">{{translate('Non-Paid')}}</span>
                            @endif
                        </td>
                        <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" onclick="refund_request_money(this,'{{ $refund->id }}')" title="{{ translate('Refund Now') }}">
                                <i class="las la-backward"></i>
                            </a>
                            <a href="{{ route('reason_show', $refund->id) }}" class="btn btn-soft-primary btn-icon btn-circle btn-sm" title="{{ translate('View Reason') }}">
                                <i class="las la-eye"></i>
                            </a>
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
@section('script')
    <script type="text/javascript">

        function update_refund_approval(el){
            console.log(el);
        }

        function refund_request_money(a,el){
            $(a).css('display', 'none');
            $(a).parent().append(`
                <div class="badge badge-primary w-100">{{ translate('please wait..') }}</div>
            `);
            $.post('{{ route('refund_request_money_by_admin') }}',{_token:'{{ @csrf_token() }}', el:el}, function(data){
                if (data == 1) {
                    location.reload();
                    AIZ.plugins.notify('success', '{{ translate('Refund has been sent successfully') }}');
                }
                else {
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }
    </script>
@endsection
