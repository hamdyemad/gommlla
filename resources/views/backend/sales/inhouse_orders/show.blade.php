@extends('backend.layouts.app')

@section('content')

    <div class="card">
      <div class="card-header">
        <h1 class="h2">{{ translate('Order Details') }}</h1>
      </div>
      <div class="card-header row gutters-5">
			<div class="col text-center text-md-left">
			</div>
            @php
                $delivery_status = $order->orderDetails->first()->delivery_status;
                $payment_status = $order->orderDetails->first()->payment_status;
            @endphp
            <div class="col-md-3 ml-auto">
                <label for=update_payment_status"">{{translate('Payment Status')}}</label>
                <select class="form-control aiz-selectpicker"  data-minimum-results-for-search="Infinity" id="update_payment_status">
                    <option value="paid" @if ($payment_status == 'paid') selected @endif>{{translate('Paid')}}</option>
                    <option value="unpaid" @if ($payment_status == 'unpaid') selected @endif>{{translate('Unpaid')}}</option>
                </select>
            </div>
			<div class="col-md-3 ml-auto">
                <label for=update_delivery_status"">{{translate('Delivery Status')}}</label>
                <select class="form-control aiz-selectpicker"  data-minimum-results-for-search="Infinity" id="update_delivery_status">
                    <option value="pending" @if ($delivery_status == 'pending') selected @endif>{{translate('Pending')}}</option>
                    <option value="confirmed" @if ($delivery_status == 'confirmed') selected @endif>{{translate('Confirmed')}}</option>
                    <option value="on_delivery" @if ($delivery_status == 'on_delivery') selected @endif>{{translate('On delivery')}}</option>
                    <option value="delivered" @if ($delivery_status == 'delivered') selected @endif>{{translate('Delivered')}}</option>
                </select>
			</div>
		</div>
        <div class="card-header row gutters-6">
			<div class="col text-center text-md-left">
              <address>
                  <strong class="text-main">{{isset( json_decode($order->shipping_address)->name)?json_decode($order->shipping_address)->name:'' }}</strong><br>
                   {{isset( json_decode($order->shipping_address)->email)?json_decode($order->shipping_address)->email:'' }}<br>
                   {{isset( json_decode($order->shipping_address)->phone)?json_decode($order->shipping_address)->phone:'' }}<br>
                   {{isset( json_decode($order->shipping_address)->address)?json_decode($order->shipping_address)->address:'' }}, {{isset( json_decode($order->shipping_address)->city)?json_decode($order->shipping_address)->city:''}}, {{ isset(json_decode($order->shipping_address)->postal_code)?json_decode($order->shipping_address)->postal_code :'' }}<br>
                   {{ isset(json_decode($order->shipping_address)->country)?json_decode($order->shipping_address)->country:'' }}
                </address>
                  @if ($order->manual_payment && is_array(json_decode($order->manual_payment_data, true)))
                      <br>
                      <strong class="text-main">{{ translate('Payment Information') }}</strong><br>
                      Name: {{ json_decode($order->manual_payment_data)->name }}, Amount: {{ single_price(json_decode($order->manual_payment_data)->amount) }}, TRX ID: {{ json_decode($order->manual_payment_data)->trx_id }}
                      <br>
                      <a href="{{ uploaded_asset(json_decode($order->manual_payment_data)->photo) }}" target="_blank"><img src="{{ uploaded_asset(json_decode($order->manual_payment_data)->photo) }}" alt="" height="100"></a>
                  @endif
			</div>
			<div class="col-md-4 ml-auto">
              <table>
                  <tbody>
                    <tr>
                        <td class="text-main text-bold">{{translate('Order #')}}</td>
                        <td class="text-right text-info text-bold">{{ $order->code }}</td>
                        
                    </tr>
                    <tr>
                        <td class="text-main text-bold">{{translate('Order Status')}}</td>
                        @php
                        $status = $order->orderDetails->first()->delivery_status;
                        @endphp
                        <td class="text-right">
                            @if($status == 'delivered')
                              <span class="badge badge-inline badge-success">{{ ucfirst(str_replace('_', ' ', $status)) }}</span>
                            @else
                              <span class="badge badge-inline badge-info">{{ ucfirst(str_replace('_', ' ', $status)) }}</span>
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td class="text-main text-bold">{{translate('Order Date')}}</td>
                        <td class="text-right">{{ date('d-m-Y h:i A', $order->date) }}</td>
                    </tr>
                    <tr>
                        <td class="text-main text-bold">{{translate('Total amount')}}</td>
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

    	<div class="card-body">
    		<div class="invoice-bill row">
    			<div class="col-sm-6">

    			</div>
    			<div class="col-sm-6">

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
              					<th class="min-col text-center text-uppercase">{{translate('Price')}}</th>
              					<th class="min-col text-right text-uppercase">{{translate('Total')}}</th>
              					<th class="min-col text-right text-uppercase">{{translate('Refund')}}</th>
            				</tr>
        				</thead>
        				<tbody>
                            @php
                            $admin_user_id = \App\User::where('user_type', 'admin')->first()->id;
                            @endphp
                            @foreach ($order->orderDetails->where('seller_id', $admin_user_id) as $key => $orderDetail)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>
                                        @if ($orderDetail->product != null)
                                          <a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank"><img height="50px" src={{ uploaded_asset($orderDetail->product->thumbnail_img) }}/></a>
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
                                    <td class="text-center">
                                        {{ single_price($orderDetail->price/$orderDetail->quantity) }}
                                    </td>
                                    <td class="text-center">{{ single_price($orderDetail->price) }}</td>
                                     @php
                                            $no_of_max_day = \App\BusinessSetting::where('type', 'refund_request_time')->first()->value;
                                            $last_refund_date = $orderDetail->created_at->addDays($no_of_max_day);
                                            $today_date = Carbon\Carbon::now();
                                        @endphp
                                    <td>
                                        
                                        @if ($orderDetail->product != null && $orderDetail->product->refundable != 0&& $orderDetail->refund_request == null && $today_date <= $last_refund_date && $orderDetail->delivery_status == 'delivered' )
                                       <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" onclick="refund_request('{{ $orderDetail->id }}')" title="{{ translate('Refund Now') }}">
                                <i class="las la-backward"></i>
                            </a>
                            @elseif($orderDetail->refund_request !=null)
                            Refuned
                            @else
                            no refund
                                        @endif
                                        
                                    </td>
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
            				<td><strong class="text-muted">{{translate('Sub Total')}} :</strong></td>
            				<td>
            					{{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('price')) }}
            				</td>
            			</tr>
            			<tr>
            				<td><strong class="text-muted">{{translate('Tax')}} :</strong></td>
            				<td>{{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('tax')) }}</td>
            			</tr>
                        <tr>
            				<td><strong class="text-muted"> {{translate('Shipping')}} :</strong></td>
            				<td>{{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('shipping_cost')) }}</td>
            			</tr>
            			<tr>
            				<td><strong class="text-muted">{{translate('TOTAL')}} :</strong></td>
            				<td class="text-muted h5">
            					{{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('price') + $order->orderDetails->where('seller_id', $admin_user_id)->sum('tax') + $order->orderDetails->where('seller_id', $admin_user_id)->sum('shipping_cost')) }}
            				</td>
            			</tr>
          			</tbody>
    			</table>
                <div class="text-right no-print">
                    <a href="{{ route('seller.invoice.download', $order->id) }}" type="button" class="btn btn-icon btn-light"><i class="las la-print"></i></a>
                </div>
    		</div>
    	</div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">
        $('#update_delivery_status').on('change', function(){
            var order_id = {{ $order->id }};
            var status = $('#update_delivery_status').val();
            $.post('{{ route('orders.update_delivery_status') }}', {_token:'{{ @csrf_token() }}',order_id:order_id,status:status}, function(data){
                AIZ.plugins.notify('success', '{{ translate('Delivery status has been updated') }}');
            });
        });

        $('#update_payment_status').on('change', function(){
            var order_id = {{ $order->id }};
            var status = $('#update_payment_status').val();
            $.post('{{ route('orders.update_payment_status') }}', {_token:'{{ @csrf_token() }}',order_id:order_id,status:status}, function(data){
                AIZ.plugins.notify('success', '{{ translate('Payment status has been updated') }}');
            });
        });
        
        function refund_request(el){
            $.post('{{ route('admin_refund_request') }}',{_token:'{{ @csrf_token() }}', el:el}, function(data){
                if (data == 1) {
                    location.reload();
                    AIZ.plugins.notify('success', '{{ translate('Refund has been  successfully') }}');
                }
                else {
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }
    </script>
@endsection
