@extends('backend.layouts.app')

@section('content')
@php
    $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
@endphp
<div class="card all-orders">
    <div class="card-header row gutters-5">
        <form class="d-flex align-items-center" action="{{ route('all_orders.index') }}" method="GET">
          <div class="row">
              <div class="col-6 col-md-4">
                  <div class="form-group">
                      <input type="text" class="form-control" id="code" name="code" value="{{ request('code') }}" placeholder="{{ translate('code') }}">
                  </div>
              </div>
              <div class="col-6 col-md-4">
                  <div class="form-group">
                      <input type="text" class="form-control" id="customer" name="customer" value="{{ request('customer') }}" placeholder="{{ translate('customer') }}">
                  </div>
              </div>
              <div class="col-6 col-md-4">
                  <div class="form-group">
                      <input type="text" class="form-control" id="seller" name="seller" value="{{ request('seller') }}" placeholder="{{ translate('seller') }}">
                  </div>
              </div>
              <div class="col-6 col-md-4">
                  <div class="form-group">
                      <select name="city" class="form-control">
                          <option value="">{{ translate('select city') }}</option>
                          @foreach ($cities as $city)
                            <option @if(request('city') == $city->id) selected @endif value="{{ $city->id }}">{{ $city->city }}</option>
                          @endforeach
                      </select>
                  </div>
              </div>
              <div class="col-6 col-md-4">
                  <div class="form-group">
                    <select name="delivery_status" class="form-control">
                        <option value="">{{ translate('delivery status') }}</option>
                        <option @if(request('delivery_status') == 'معلق') selected @endif value="معلق">معلق</option>
                        @foreach ($statuses as $status)
                          <option @if(request('delivery_status') == $status->status_name) selected @endif value="{{ $status->status_name }}">{{ $status->status_name }}</option>
                        @endforeach
                    </select>
                </div>
              </div>
              <div class="col-6 col-md-4">
                  @if(Auth::user()->user_type == 'admin')
                      <div class="form-group">
                          <select name="admin_status" class="form-control">
                              <option value="">{{ translate('admin status') }}</option>
                              <option @if(request('admin_status') == 'معلق') selected @endif value="معلق">معلق</option>
                              @foreach ($adminStatuses as $status)
                              <option @if(request('admin_status') == $status->status_name) selected @endif value="{{ $status->status_name }}">{{ $status->status_name }}</option>
                              @endforeach
                              <option @if(request('admin_status') == 1) selected @endif value="1">{{ translate('paid') }}</option>
                          </select>
                      </div>
                  @endif
              </div>
              <div class="col-6 col-md-4">
                  <div class="form-group">
                      <button class="btn btn-primary">{{ translate('search') }}</button>
                  </div>
              </div>
          </div>
        </form>
      <div class="col-md-2 text-center text-md-left">
        <h5 class="mb-md-0 h6">{{ translate('All Orders') }}</h5>
      </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table order-table mb-0">
                <thead>
                    <tr>
                        <th>{{ translate('Order Code') }}</th>
                        <th>{{ translate('Num. of Products') }}</th>
                        <th>{{ translate('Customer') }}</th>
                        <th>{{ translate('Delivery') }}</th>
                        <th>{{ translate('City') }}</th>
                        <th>{{ translate('Shipping') }}</th>
                        <th>{{ translate('Shipping Commission') }}</th>
                        <th>{{ translate('Price With Shipping') }}</th>
                        <th>{{ translate('created_at') }}</th>
                        <th class="text-right" width="15%">{{translate('options')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($orders as $key => $order)
                        <table class="table order">
                            <tbody>
                                <tr>
                                    <td>
                                        {{ $order->code }}
                                    </td>
                                    <td>
                                        {{ count($order->orderDetails) }}
                                    </td>
                                    <td>
                                        @if(Auth::user()->user_type == 'admin')
                                            @if ($order->user != null)
                                                @if(\App\AffiliateUser::where('user_id', $order->user_id)->first())
                                                <div class="badge badge-primary w-100">{{ translate('affiliate') }}</div>
                                                <div class="d-flex" style="width: max-content">
                                                    <span>{{ translate('affiliate name') }}: </span>
                                                    <span>{{ $order->user->name }}</span>
                                                </div>
                                                @endif
                                            @endif
                                        @endif
                                        <div class="d-flex" style="width: max-content">
                                            <span>{{$order->name }}</span>
                                        </div>
                                        <div class="d-flex" style="width: max-content">
                                            <span>{{ $order->phone }}</span>
                                        </div>
                                    </td>
                                    @if($order->orderDetails[0]->delivery)
                                    <td>{{ $order->orderDetails[0]->delivery->name }}</td>
                                    @else
                                    <td>-----</td>
                                    @endif
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
                                        <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('all_orders.show', encrypt($order->id))}}" title="{{ translate('View') }}">
                                            <i class="las la-eye"></i>
                                        </a>
                                        <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('customer.invoice.download', $order->id) }}" title="{{ translate('Download Invoice') }}">
                                            <i class="las la-download"></i>
                                        </a>
                                        @if(Auth::user()->user_type == 'admin')
                                            <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('orders.destroy', $order->id)}}" title="{{ translate('Delete') }}">
                                                <i class="las la-trash"></i>
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                                <table class="table orderDetails">
                                    <tbody>
                                        @foreach ($order->orderDetails as $orderDetail)
                                        @if(request('admin_status') == 1)
                                            @if($orderDetail->payment_status == 1)
                                            <tr>
                                                <td>
                                                    <div class="badge badge-primary w-100">{{ $orderDetail->unit->name }}</div>
                                                    @if(strlen($orderDetail->product->name) > 15)
                                                    <div class="d-flex align-items-center p-1">
                                                        <img src="{{ uploaded_asset($orderDetail->product->thumbnail_img)}}" alt="Image"
                                                     class="w-50px rounded">
                                                        <span class="p-2 pt-0">{{ substr($orderDetail->product->name, 0, 15) . '...' }}</span>
                                                    </div>
                                                    @else
                                                    <div class="d-flex align-items-center p-1">
                                                        <img src="{{ uploaded_asset($orderDetail->product->thumbnail_img)}}" alt="Image"
                                                     class="w-50px rounded">
                                                        <span class="p-2 pt-0">{{ $orderDetail->product->name }}</span>
                                                    </div>
                                                    @endif
                                                </td>
                                                <td>
                                                    <span>{{ translate('seller') }}: {{ $orderDetail->user->name }}</span>
                                                </td>
                                                <td>
                                                    <div class="d-flex">
                                                        <span>{{ translate('amount') . ': ' . $orderDetail->quantity }} </span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex">
                                                        <span>{{ translate('price') . ': ' . $orderDetail->price }} </span>
                                                    </div>
                                                </td>
                                                @if(Auth::user()->user_type == 'admin')
                                                    <td>
                                                        <span class="badge btn w-100 p-1 h-auto @if($orderDetail->admin_status !== 'معلق') badge-success @else badge-danger @endif" data-toggle="modal" data-target="#admin_status_modal_{{ $orderDetail->id }}">
                                                            {{$orderDetail->admin_status }}
                                                        </span>
                                                        <span class="d-block text-center">{{ translate('admin status') }}</span>
                                                        <!-- change status Modal -->
                                                            <div id="admin_status_modal_{{ $orderDetail->id }}" class="modal fade">
                                                                <div class="modal-dialog modal-sm modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                        </div>
                                                                        <div class="modal-body text-center">
                                                                            <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                                @csrf
                                                                                <div class="form-group">
                                                                                    <select name="admin_status" class="form-control">
                                                                                        <option value="">أختر الحالة</option>
                                                                                        @foreach ($adminStatuses as $status)
                                                                                            <option @if($orderDetail->admin_status == $status->status_name) selected @endif value="{{ $status->status_name }}">
                                                                                                {{ $status->status_name }}
                                                                                            </option>
                                                                                        @endforeach
                                                                                    </select>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <input class="form-control" type="text" name="admin_reason" placeholder="{{ translate('reason') }}">
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
                                                @endif
                                                <td>
                                                    <span class="badge btn @if($orderDetail->delivery_status == 'تم التسليم')badge-success @elseif($orderDetail->delivery_status !== 'معلق') badge-info @else badge-danger @endif p-1 w-100 h-auto" data-toggle="modal" data-target="#delivery_status_modal_{{ $orderDetail->id }}">{{ $orderDetail->delivery_status }}</span>
                                                    <span class="d-block text-center">{{ translate('delivery status') }}</span>
                                                    <!-- change status Modal -->
                                                        <div id="delivery_status_modal_{{ $orderDetail->id }}" class="modal fade">
                                                            <div class="modal-dialog modal-sm modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                            @csrf
                                                                            <div class="form-group">
                                                                                <select name="delivery_status" class="form-control">
                                                                                    <option value="">أختر الحالة</option>
                                                                                    @foreach ($statuses as $status)
                                                                                        <option @if($orderDetail->delivery_status == $status->status_name) selected @endif value="{{ $status->status_name }}">
                                                                                            {{ $status->status_name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="text" name="admin_reason" placeholder="{{ translate('reason') }}">
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
                                                    @if(Auth::user()->user_type == 'admin')
                                                        <span class="badge btn @if($orderDetail->seller_status == 'تم التجهيز')badge-success @else badge-danger @endif p-1 w-100 h-auto" data-toggle="modal" data-target="#seller_status_modal_{{ $orderDetail->id }}">
                                                            {{ $orderDetail->seller_status }}
                                                        </span>
                                                        <span class="d-block text-center">{{ translate('seller status') }}</span>
                                                        <!-- change status Modal -->
                                                        <div id="seller_status_modal_{{ $orderDetail->id }}" class="modal fade">
                                                            <div class="modal-dialog modal-sm modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                            @csrf
                                                                            <div class="form-group">
                                                                                <select name="seller_status" class="form-control">
                                                                                    <option value="">أختر الحالة</option>
                                                                                    @foreach ($sellerStatuses as $status)
                                                                                        <option @if($orderDetail->seller_status == $status->status_name) selected @endif value="{{ $status->status_name }}">
                                                                                            {{ $status->status_name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="text" name="admin_reason" placeholder="{{ translate('reason') }}">
                                                                            </div>
                                                                            <button type="button" class="btn btn-danger mt-2" data-dismiss="modal">{{translate('Cancel')}}</button>
                                                                            <button type="submit" class="btn btn-success mt-2">{{translate('Save')}}</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /.change status -->
                                                    @else
                                                    <span class="badge @if($orderDetail->seller_status == 'تم التجهيز')badge-success @else badge-danger @endif p-1 w-100 h-auto">
                                                        {{ $orderDetail->seller_status }}
                                                    </span>
                                                    <span class="d-block text-center">{{ translate('seller status') }}</span>

                                                    @endif
                                                </td>
                                                @if(Auth::user()->staff->role->name !== 'shipping' && $orderDetail->payment_status == 1)
                                                <td><span class="badge badge-success p-1 w-100 h-auto">{{ translate('paid') }}</span></td>
                                                @endif
                                            </tr>
                                            @endif
                                        @else
                                        <tr>
                                            <td>
                                                @if($orderDetail->refundable)
                                                    <div class="badge badge-info w-100">{{ translate('refunded order') }}</div>
                                                @endif
                                                <div class="badge badge-primary w-100">{{ $orderDetail->unit->name }}</div>
                                                @if(strlen($orderDetail->product->name) > 15)
                                                <div class="d-flex align-items-center p-1">
                                                    <img src="{{ uploaded_asset($orderDetail->product->thumbnail_img)}}" alt="Image"
                                                 class="w-50px rounded">
                                                    <span class="p-2 pt-0">{{ substr($orderDetail->product->name, 0, 15) . '...' }}</span>
                                                </div>
                                                @else
                                                <div class="d-flex align-items-center p-1">
                                                    <img src="{{ uploaded_asset($orderDetail->product->thumbnail_img)}}" alt="Image"
                                                 class="w-50px rounded">
                                                    <span class="p-2 pt-0">{{ $orderDetail->product->name }}</span>
                                                </div>
                                                @endif
                                            </td>
                                            <td>
                                                <span>{{ translate('seller') }}: {{ $orderDetail->user->name }}</span>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <span>{{ translate('amount') . ': ' . $orderDetail->quantity }} </span>
                                                </div>
                                                <span class="d-block">
                                                    @if(is_array(json_decode($orderDetail->sizes)))
                                                        @foreach (json_decode($orderDetail->sizes) as $size)
                                                            <div class="badge badge-primary">{{ $size }}</div>
                                                        @endforeach
                                                    @endif
                                                </span>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <span>{{ translate('price') . ': ' . $orderDetail->price }} </span>
                                                </div>
                                            </td>
                                            @if(Auth::user()->user_type == 'admin')
                                                    @php
                                                        if($orderDetail->refundable) {
                                                            $adminStatuses = \App\Status::
                                                            whereIn('status_name', ['تم رد المنتج'])->get();
                                                        }
                                                    @endphp
                                                <td>
                                                    <span class="badge btn w-100 p-1 h-auto @if($orderDetail->admin_status !== 'معلق') badge-success @else badge-danger @endif" data-toggle="modal" data-target="#admin_status_modal_{{ $orderDetail->id }}">
                                                        {{$orderDetail->admin_status }}
                                                    </span>
                                                    <span class="d-block text-center">{{ translate('admin status') }}</span>
                                                    <!-- change status Modal -->
                                                        <div id="admin_status_modal_{{ $orderDetail->id }}" class="modal fade">
                                                            <div class="modal-dialog modal-sm modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                            @csrf
                                                                            <div class="form-group">
                                                                                <select name="admin_status" class="form-control">
                                                                                    <option value="">أختر الحالة</option>
                                                                                    @foreach ($adminStatuses as $status)
                                                                                        <option @if($orderDetail->admin_status == $status->status_name) selected @endif value="{{ $status->status_name }}">
                                                                                            {{ $status->status_name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="text" name="admin_reason" placeholder="{{ translate('reason') }}">
                                                                            </div>
                                                                            <button type="button" class="btn btn-danger mt-2" data-dismiss="modal">{{translate('Cancel')}}</button>
                                                                            <button type="submit" class="btn btn-success mt-2">{{translate('Save')}}</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <!-- /.change status -->
                                                    @if($orderDetail->admin_reason)
                                                    <div class="alert alert-danger text-center p-1">{{ $orderDetail->admin_reason }}</div>
                                                    @endif
                                                </td>
                                            @endif
                                            <td>
                                                @php
                                                    if($orderDetail->refundable) {
                                                        $statuses = \App\Status::
                                                        whereIn('status_name', ['تم الأسترجاع بنجاح'])
                                                        ->whereIn('id', $statuses_permessions_ids)->latest()->get();
                                                    }
                                                @endphp
                                                <span class="badge btn @if($orderDetail->delivery_status == 'تم التسليم')badge-success @elseif($orderDetail->delivery_status !== 'معلق') badge-info @else badge-danger @endif p-1 w-100 h-auto" data-toggle="modal" data-target="#delivery_status_modal_{{ $orderDetail->id }}">{{ $orderDetail->delivery_status }}</span>
                                                <span class="d-block text-center">{{ translate('delivery status') }}</span>
                                                <!-- change status Modal -->
                                                    <div id="delivery_status_modal_{{ $orderDetail->id }}" class="modal fade">
                                                        <div class="modal-dialog modal-sm modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                </div>
                                                                <div class="modal-body text-center">
                                                                    <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                        @csrf
                                                                        <div class="form-group">
                                                                            <select name="delivery_status" class="form-control">
                                                                                <option value="">أختر الحالة</option>
                                                                                @foreach ($statuses as $status)
                                                                                    <option @if($orderDetail->delivery_status == $status->status_name) selected @endif value="{{ $status->status_name }}">
                                                                                        {{ $status->status_name }}
                                                                                    </option>
                                                                                @endforeach
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
                                                @if($orderDetail->delivery_reason)
                                                <div class="alert alert-danger text-center p-1">{{ $orderDetail->delivery_reason }}</div>
                                                @endif
                                            </td>
                                            <td>
                                                @if(Auth::user()->user_type == 'admin')
                                                    <span class="badge btn @if($orderDetail->seller_status == 'تم التجهيز')badge-success @else badge-danger @endif p-1 w-100 h-auto" data-toggle="modal" data-target="#seller_status_modal_{{ $orderDetail->id }}">
                                                        {{ $orderDetail->seller_status }}
                                                    </span>
                                                    <span class="d-block text-center">{{ translate('seller status') }}</span>
                                                    <!-- change status Modal -->
                                                    <div id="seller_status_modal_{{ $orderDetail->id }}" class="modal fade">
                                                        <div class="modal-dialog modal-sm modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title h6">تغيير الحالة</h4>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                </div>
                                                                <div class="modal-body text-center">
                                                                    <form action="{{ route('all_orders.order_status', $orderDetail) }}" method="POST">
                                                                        @csrf
                                                                        <div class="form-group">
                                                                            <select name="seller_status" class="form-control">
                                                                                <option value="">أختر الحالة</option>
                                                                                @foreach ($sellerStatuses as $status)
                                                                                    <option @if($orderDetail->seller_status == $status->status_name) selected @endif value="{{ $status->status_name }}">
                                                                                        {{ $status->status_name }}
                                                                                    </option>
                                                                                @endforeach
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
                                                    @if($orderDetail->seller_reason)
                                                    <div class="alert alert-danger text-center p-1">{{ $orderDetail->seller_reason }}</div>
                                                    @endif
                                                @else
                                                <span class="badge @if($orderDetail->seller_status == 'تم التجهيز')badge-success @else badge-danger @endif p-1 w-100 h-auto">
                                                    {{ $orderDetail->seller_status }}
                                                </span>
                                                <span class="d-block text-center">{{ translate('seller status') }}</span>

                                                @endif
                                            </td>
                                            @if(Auth::user()->staff->role->name !== 'shipping' && $orderDetail->payment_status == 1)
                                            <td><span class="badge badge-success p-1 w-100 h-auto">{{ translate('paid') }}</span></td>
                                            @endif
                                            @if(get_setting('refund_request_time') > 0)
                                                @if(\App\RefundRequest::where('order_detail_id', $orderDetail->id)->first())
                                                <td>
                                                        <div class="badge badge-info w-100">{{ translate('refund sent') }} !</div>
                                                    </td>
                                                @else
                                                    @if(Auth::user()->user_type !== 'shipping' && $orderDetail->admin_status == 'تم التحصيل')
                                                        <td>
                                                            <a href="{{ route('refund_request_send_page', $orderDetail->id) }}" class="badge badge-primary w-100">{{ translate('send refund request') }}</a>
                                                        </td>
                                                    @endif
                                                @endif
                                            @endif
                                        </tr>
                                        @endif
                                        @endforeach
                                    </tbody>
                                </table>
                            </tbody>
                        </table>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="aiz-pagination">
            {{ $orders->appends(request()->input())->links() }}
        </div>
    </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection

@section('script')
    <script type="text/javascript">

        $(".modal form").on('submit', function() {
            $('.modal button[type=submit]').attr('disabled', '');
        })
    </script>
@endsection
