@extends('frontend.layouts.app')

@section('content')

    <section class="py-5">
        <div class="container">
            <div class="d-flex align-items-start">
                @include('frontend.inc.user_side_nav')
                <div class="aiz-user-panel">
                    <div class="card">
                        <div class="container">
                            <form action="{{ route('orders.index') }}" method="GET">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="customer">{{ translate('from') }}</label>
                                            <input type="date" class="form-control" value="{{ request('from') }}" name="from">
                                        </div>
                                      </div>
                                      <div class="col-6">
                                        <div class="form-group">
                                            <label for="customer">{{ translate('to') }}</label>
                                            <input type="date" class="form-control" value="{{ request('to') }}" name="to">
                                        </div>
                                      </div>
                                    <div class="col-3">
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
                                          <button class="btn btn-primary">{{ translate('search') }}</button>
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
                                                                    @if ($order->user != null)
                                                                        @if(Auth::user()->user_type == 'affiliate')
                                                                            <div class="d-flex">
                                                                                <span>{{ translate('name') }}: </span>
                                                                                <span>{{ $order->name }}</span>
                                                                            </div>
                                                                            <div class="d-flex">
                                                                                <span>{{ translate('phone') }}: </span>
                                                                                <span>{{ $order->phone }}</span>
                                                                            </div>
                                                                        @else
                                                                        <div class="d-flex">
                                                                            <span>{{ $order->name }}</span>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <span>{{ $order->phone }}</span>
                                                                        </div>
                                                                        @endif
                                                                    @else
                                                                        <div class="d-flex">
                                                                            <span>{{ $order->name }}</span>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <span>{{ $order->phone }}</span>
                                                                        </div>
                                                                    @endif
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
                                                                        @if($orderDetail->user->id == Auth::user()->id)
                                                                            <tr>
                                                                                <td>{{ $orderDetail->product->name }}</td>
                                                                                <td>
                                                                                    <span>{{ translate('quantity') }}: {{ $orderDetail->quantity }}</span>
                                                                                </td>
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

                                                                                <td>
                                                                                    <span class="badge btn p-1 w-100 h-auto @if($orderDetail->seller_status == 'معلق')badge-danger @else badge-success @endif" data-toggle="modal" data-target="#status-modal-{{ $orderDetail->id }}">{{ $orderDetail->seller_status }}</span>
                                                                                    <span class="text-center d-block">{{ translate('seller status') }}</span>
                                                                                    <!-- change status Modal -->
                                                                                        <div id="status-modal-{{ $orderDetail->id }}" class="modal fade">
                                                                                            <div class="modal-dialog modal-sm modal-dialog-centered">
                                                                                                <div class="modal-content">
                                                                                                    <div class="modal-header">
                                                                                                        <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                                                        <button type="button" class="close" data-toggle="modal" data-target="#status-modal-{{ $orderDetail->id }}">{{ $orderDetail->seller_status }}</button>
                                                                                                    </div>
                                                                                                    <div class="modal-body text-center">
                                                                                                        <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                                                            @csrf
                                                                                                            <div class="form-group">
                                                                                                                <select name="seller_status" class="form-control">
                                                                                                                    <option value="">أختر الحالة</option>
                                                                                                                    <option value="تم التجهيز">تم التجهيز</option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                            <div class="form-group">
                                                                                                                <input class="form-control" type="text" name="seller_reason" placeholder="{{ translate('reason') }}">
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
                                                                            </tr>
                                                                        @endif
                                                                @endforeach
                                                                </tbody>
                                                            </table>
                                                        </tbody>
                                                    </table>
                                                @endif
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <div class="aiz-pagination">
                                    {{ $orders->appends(request()->input())->links() }}
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
    <div class="modal fade" id="order_details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div id="order-details-modal-body">

                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">


    </script>
@endsection
