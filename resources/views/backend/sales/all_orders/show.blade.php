@extends('backend.layouts.app')

@section('content')

    <div class="card">
      <div class="card-header">
        <h1 class="h2">{{ translate('Order Details') }}</h1>
      </div>
    	<div class="card-body">
        <div class="card-header row gutters-6">
  				<div class="col text-center text-md-left">
            <address>
                <strong class="text-main d-block">{{ $order->name  }}</strong>
                <strong class="text-main d-block">{{ $order->phone  }}</strong>
                <strong class="text-main d-block">{{ $order->email  }}</strong>
                <strong class="text-main d-block">{{ $order->address  }}</strong>
                <strong class="text-main d-block">{{ $order->zone  }}</strong>
                <strong class="text-main d-block">{{ $order->city->city  }}</strong>
                <strong class="text-main d-block">{{ $order->city->country->name  }}</strong>
            </address>
            @if ($order->manual_payment && is_array(json_decode($order->manual_payment_data, true)))
                <br>
                <strong class="text-main">{{ translate('Payment Information') }}</strong><br>
                {{ translate('Name') }}: {{ json_decode($order->manual_payment_data)->name }}, {{ translate('Amount') }}: {{ single_price(json_decode($order->manual_payment_data)->amount) }}, {{ translate('TRX ID') }}: {{ json_decode($order->manual_payment_data)->trx_id }}
                <br>
                <a href="{{ uploaded_asset(json_decode($order->manual_payment_data)->photo) }}" target="_blank"><img src="{{ uploaded_asset(json_decode($order->manual_payment_data)->photo) }}" alt="" height="100"></a>
            @endif
  				</div>
  				<div class="col-md-4 ml-auto">
            <table>
        				<tbody>
            				<tr>
            					<td class="text-main text-bold">{{translate('Order #')}}</td>
            					<td class="text-right text-info text-bold">	{{ $order->code }}</td>
            				</tr>
            				<tr>
                        <td class="text-main text-bold">{{translate('Order Status')}}</td>
                        @php
                            $status = '';
                            if($order->orderDetails->first()){
                                $status = $order->orderDetails->first()->delivery_status;
                            }
                        @endphp
                        @if($status)
                            <td class="text-right">
                                @if($status == 'delivered')
                                    <span class="badge badge-inline badge-success">{{ ucfirst(str_replace('_', ' ', $status)) }}</span>
                                @else
                                    <span class="badge badge-inline badge-info">{{ ucfirst(str_replace('_', ' ', $status)) }}</span>
                                @endif
                            </td>
                        @endif
            				</tr>
            				<tr>
            					<td class="text-main text-bold">{{translate('Order Date')}}	</td>
            					<td class="text-right">{{ date('d-m-Y h:i A', $order->date) }}</td>
            				</tr>
                    <tr>
            					<td class="text-main text-bold">{{translate('Total amount')}}	</td>
            					<td class="text-right">
            						{{ single_price($order->orderDetails->sum('price') + $order->orderDetails->sum('tax')) }}
            					</td>
            				</tr>
                    <tr>
            					<td class="text-main text-bold">{{translate('Payment method')}}</td>
            					<td class="text-right">{{ ucfirst(str_replace('_', ' ', $order->payment_type)) }}</td>
            				</tr>
        				</tbody>
    				</table>
  				</div>
  			</div>
    		<hr class="new-section-sm bord-no">
    		<div class="row">
    			<div class="col-lg-12 table-responsive">
    				<table class="table table-bordered invoice-summary">
        				<thead>
                            <tr class="bg-trans-dark">
                                <th class="min-col">#</th>
                                <th width="10%">{{translate('Photo')}}</th>
                                <th class="text-uppercase">{{translate('Description')}}</th>
                                <th class="text-uppercase">{{translate('Delivery Type')}}</th>
                                <th class="min-col text-center text-uppercase">{{translate('Qty')}}</th>
                                <th class="min-col text-center text-uppercase">{{ translate('Sizes') }}</th>
                                <th class="min-col text-center text-uppercase">{{translate('Price')}}</th>
                                <th class="min-col text-right text-uppercase">{{translate('Total')}}</th>
                            </tr>
        				</thead>
        				<tbody>
                    @foreach ($order->orderDetails as $key => $orderDetail)
                      <tr>
                        <td>{{ $key+1 }}</td>
                        <td>
                          @if ($orderDetail->product != null)
                            <a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank"><img height="50" src={{ uploaded_asset($orderDetail->product->thumbnail_img) }}/></a>
                          @else
                            <strong>{{ translate('N/A') }}</strong>
                          @endif
                          </td>
                        <td>
                          @if ($orderDetail->product != null)
                            <strong><a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank" class="text-muted">{{ $orderDetail->product->getTranslation('name') }}</a></strong>
                            <small>{{ $orderDetail->variation }}</small>
                          @else
                            <strong>{{ translate('Product Unavailable') }}</strong>
                          @endif
                        </td>
                        <td>
                          @if ($orderDetail->shipping_type != null && $orderDetail->shipping_type == 'home_delivery')
                            {{ translate('Home Delivery') }}
                          @elseif ($orderDetail->shipping_type == 'pickup_point')

                            @if ($orderDetail->pickup_point != null)
                              {{ $orderDetail->pickup_point->getTranslation('name') }} ({{ translate('Pickup Point') }})
                            @else
                              {{ translate('Pickup Point') }}
                            @endif
                          @endif
                        </td>
                        <td class="text-center">{{ $orderDetail->quantity }}</td>
                        <td>
                            @if(is_array(json_decode($orderDetail->sizes)))
                                @foreach (json_decode($orderDetail->sizes) as $size)
                                    <div class="badge badge-primary">{{ $size }}</div>
                                @endforeach
                            @endif
                        </td>
                        <td class="text-center">{{ single_price($orderDetail->price/$orderDetail->quantity) }}</td>
                        <td class="text-center">{{ single_price($orderDetail->price) }}</td>
                      </tr>
                    @endforeach
        				</tbody>
    				</table>
    			</div>
    		</div>
    		<div class="clearfix float-right">
    			<table class="table">
        			<tbody>
        			<tr>
        				<td>
        					<strong class="text-muted">{{translate('Sub Total')}} :</strong>
        				</td>
        				<td>
        					{{ single_price($order->orderDetails->sum('price')) }}
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<strong class="text-muted">{{translate('Shipping Commission')}} :</strong>
        				</td>
        				<td>
        					{{ single_price($order->shipping_commission) }}
        				</td>
        			</tr>
                    <tr>
        				<td>
        					<strong class="text-muted">{{translate('Shipping')}} :</strong>
        				</td>
        				<td>
        					{{ single_price($order->shipping) }}
        				</td>
        			</tr>
        			<tr>
        				<td>
        					<strong class="text-muted">{{translate('TOTAL')}} :</strong>
        				</td>
        				<td class="text-muted h5">
        					{{ single_price($order->grand_total) }}
        				</td>
        			</tr>
        			</tbody>
    			</table>
          <div class="text-right no-print">
            <a href="{{ route('customer.invoice.download', $order->id) }}" type="button" class="btn btn-icon btn-light"><i class="las la-print"></i></a>
          </div>
    		</div>

    	</div>
    </div>
@endsection
