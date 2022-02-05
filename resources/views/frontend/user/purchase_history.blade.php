@extends('frontend.layouts.app')

@section('content')

    <section class="py-5">
        <div class="container">
            <div class="d-flex align-items-start">
                @include('frontend.inc.user_side_nav')
                <div class="aiz-user-panel">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 h6">{{ translate('Purchase History') }}</h5>
                        </div>
                        <div class="container">
                            <form class="d-flex align-items-center" action="{{ route('purchase_history.index') }}" method="GET">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="customer">{{ translate('from') }}</label>
                                            <input type="date" class="form-control" value="{{ request('from') }}" name="from">
                                        </div>
                                      </div>
                                      <div class="col-4">
                                        <div class="form-group">
                                            <label for="customer">{{ translate('to') }}</label>
                                            <input type="date" class="form-control" value="{{ request('to') }}" name="to">
                                        </div>
                                      </div>
                                      <div class="col-4">
                                        <div class="form-group">
                                            <label for="code">{{ translate('code') }}</label>
                                            <input type="text" class="form-control" id="code" name="code" value="{{ request('code') }}" placeholder="{{ translate('code') }}">
                                        </div>
                                      </div>
                                      <div class="col-3">
                                        <div class="form-group">
                                            <label for="customer">{{ translate('customer name') }}</label>
                                            <input type="text" class="form-control" id="code" name="customer" value="{{ request('customer') }}" placeholder="{{ translate('customer') }}">
                                        </div>
                                      </div>
                                      <div class="col-3">
                                        <div class="form-group">
                                            <label for="city">{{ translate('city') }}</label>
                                            <select name="city" class="form-control">
                                                <option value="">{{ translate('select city') }}</option>
                                                @foreach ($cities as $city)
                                                  <option @if(request('city') == $city->id) selected @endif value="{{ $city->id }}">{{ $city->city }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                      </div>
                                      <div class="col-3">
                                        <div class="form-group">
                                            <label for="status_name">{{ translate('delivery status') }}</label>
                                          <select name="status_name" class="form-control">
                                              <option value="">{{ translate('delivery status') }}</option>
                                              @foreach ($statuses as $status)
                                                <option @if(request('status_name') == $status->status_name) selected @endif value="{{ $status->status_name }}">{{ $status->status_name }}</option>
                                              @endforeach
                                          </select>
                                      </div>
                                      </div>
                                      <div class="col">
                                        <div class="form-group">
                                            <label for=""></label>
                                            <input class="form-control btn btn-primary" type="submit" value="{{ translate('search') }}">
                                        </div>
                                      </div>
                                </div>
                            </form>
                        </div>
                        @if (count($orders) > 0)
                            <div class="card-body" style="display: grid">
                                <div class="table-responsive">
                                    <table class="table order-table mb-0">
                                        <thead>
                                        <tr>
                                            <th>{{ translate('Code')}}</th>
                                            <th>{{ translate('Customer')}}</th>
                                            <th>{{ translate('City')}}</th>
                                            <th>{{ translate('Shipping')}}</th>
                                            <th>{{ translate('Shipping Commission')}}</th>
                                            <th>{{ translate('Price With Shipping')}}</th>
                                            <th>{{ translate('created_at')}}</th>
                                            <th class="text-right">{{ translate('Options')}}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($orders as $key => $order)
                                                @if (count($order->orderDetails) > 0)
                                                    <table class="table order">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a href="#{{ $order->code }}"
                                                                    onclick="show_purchase_history_details({{ $order->id }})">{{ $order->code }}</a>
                                                                </td>
                                                                <td>
                                                                    <div class="d-flex">
                                                                        <span>{{ $order->name }}</span>
                                                                    </div>
                                                                    <div class="d-flex">
                                                                        <span>{{ $order->phone }}</span>
                                                                    </div>
                                                                </td>
                                                                <td>{{ $order->city->city }}</td>
                                                                <td>{{ single_price($order->shipping) }}</td>
                                                                <td>{{ single_price($order->shipping_commission) }}</td>
                                                                <td>
                                                                    {{ single_price($order->grand_total) }}
                                                                </td>
                                                                <td>
                                                                    {{ $order->created_at->diffForHumans() }}
                                                                </td>
                                                                <td class="text-right">
                                                                    @if ($order->orderDetails->first()->delivery_status == 'pending' && $order->payment_status == 'unpaid')
                                                                        <a href="javascript:void(0)"
                                                                        class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete"
                                                                        data-href="{{route('orders.destroy', $order->id)}}"
                                                                        title="{{ translate('Cancel') }}">
                                                                            <i class="las la-trash"></i>
                                                                        </a>
                                                                    @endif
                                                                    <a href="javascript:void(0)"
                                                                    class="btn btn-soft-info btn-icon btn-circle btn-sm"
                                                                    onclick="show_purchase_history_details({{ $order->id }})"
                                                                    title="{{ translate('Order Details') }}">
                                                                        <i class="las la-eye"></i>
                                                                    </a>
                                                                    <a class="btn btn-soft-warning btn-icon btn-circle btn-sm"
                                                                    href="{{ route('customer.invoice.download', $order->id) }}"
                                                                    title="{{ translate('Download Invoice') }}">
                                                                        <i class="las la-download"></i>
                                                                    </a>

                                                                    @if(Auth::user()->user_type == 'seller')
                                                                        <a href="{{route('seller.add_products_order', $order->id)}}"
                                                                        class="btn btn-soft-info btn-icon btn-circle btn-sm"
                                                                        title="{{ translate('Import Products') }}">
                                                                            <i class="las la-upload"></i>
                                                                        </a>
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                            <table class="table orderDetails">
                                                                <tbody>
                                                                    @foreach ($order->orderDetails as $orderDetail)
                                                                        <tr>
                                                                            <td>{{ $orderDetail->product->name }}</td>
                                                                            <td>
                                                                                <span>{{ translate('price') }}: {{ $orderDetail->price }}</span>
                                                                                <span class="d-block">
                                                                                    @if(is_array(json_decode($orderDetail->sizes)))
                                                                                        @foreach (json_decode($orderDetail->sizes) as $size)
                                                                                            <div class="badge badge-primary">{{ $size }}</div>
                                                                                        @endforeach
                                                                                    @endif
                                                                                </span>
                                                                            </td>

                                                                            @if(Auth::user()->user_type !== 'customer')
                                                                                <td>
                                                                                    <span class="badge p-1 w-100 h-auto @if($orderDetail->seller_status == 'معلق')badge-danger @else badge-success @endif">{{ $orderDetail->seller_status }}</span>
                                                                                    <span class="text-center d-block">{{ translate('seller status') }}</span>
                                                                                </td>
                                                                            @endif
                                                                            <td>
                                                                                <span class="badge @if($orderDetail->delivery_status == 'تم التسليم')badge-success @else badge-danger @endif p-1 w-100 h-auto">{{ $orderDetail->delivery_status }}</span>
                                                                                <span class="text-center d-block">{{ translate('delivery status')}}</span>
                                                                            </td>
                                                                            @if($orderDetail->payment_status == 1)
                                                                                <td>
                                                                                    <span class="badge badge-success p-1 w-100 h-auto">{{ translate('paid') }}</span>
                                                                                    <span class="text-center d-block">{{ translate('payment status') }}</span>
                                                                                </td>
                                                                            @endif
                                                                            @if(Auth::user()->user_type !== 'affiliate' && get_setting('refund_request_time') > 0)
                                                                                @if(\App\RefundRequest::where('order_detail_id', $orderDetail->id)->first())
                                                                                <td>
                                                                                    <div class="badge badge-info w-100">{{ translate('refund sent') }} !</div>
                                                                                </td>
                                                                                @else
                                                                                    @php
                                                                                    $orders_should_pay = \App\orders_should_payments::where('order_id', $orderDetail->id)->first();
                                                                                    @endphp
                                                                                    @if($orders_should_pay)
                                                                                        <td>
                                                                                            <a href="{{ route('user_refund_request_send_page', $orderDetail->id) }}" class="badge badge-primary w-100">{{ translate('send refund request') }}</a>
                                                                                        </td>
                                                                                    @endif
                                                                                @endif
                                                                            @endif
                                                                        </tr>
                                                                    @endforeach
                                                                </tbody>
                                                            </table>
                                                        </tbody>
                                                    </table>
                                                @endif
                                            @endforeach
                                        </tbody>
                                    </table>
                                    <div class="aiz-pagination">
                                        {{ $orders->links() }}
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

@section('modal')
    @include('modals.delete_modal')

    <div class="modal fade" id="order_details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div id="order-details-modal-body">

                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="payment_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div id="payment_modal_body">

                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">
        $('#order_details').on('hidden.bs.modal', function () {
            location.reload();
        })
    </script>

@endsection
