<form action="{{ route('withdraw_request.payment_store') }}" method="POST">
    @csrf
    <div class="modal-header">
    	<h5 class="modal-title h6">{{translate('Affiliate Withdraw Request')}}</h5>
    	<button type="button" class="close" data-dismiss="modal">
    	</button>
    </div>
    <div class="modal-body" style="height: 300px">
      <table class="table table-striped table-bordered" >
          <tbody>
              @if($affiliate_user->paypal_email)
              <tr>
                  <td>{{ translate('Paypal Email') }}</td>
                  <td>{{ $affiliate_user->paypal_email }}</td>
              </tr>
              @endif
              @if($affiliate_user->bank_information)
              <tr>
                  <td>{{ translate('Bank Information') }}</td>
                  <td>{{ $affiliate_user->bank_information }}</td>
              </tr>
              @endif
          </tbody>
      </table>

      <input type="hidden" name="affiliate_user_id" value="{{ $affiliate_user->id }}">
      <input type="hidden" name="affiliate_withdraw_request_id" value="{{ $affiliate_withdraw_request->id }}">
      <div class="form-group">
        <select class="form-control aiz-selectpicker orders_payment" multiple required name="orders_should_pay[]" id="orders_should_pay"  data-live-search="true">
            @foreach ($orders_should_payments as $orders_should_payment)
                <option value="{{ $orders_should_payment->id }}">{{ translate('order code') . "(" . $orders_should_payment->order_detail->order->code . ")" . translate('price') . "(" . format_price($orders_should_payment->amount) . ")" }}</option>
            @endforeach
        </select>
      </div>

      <div class="form-group row">
          <label class="col-sm-3 col-from-label" for="payment_method">{{translate('Payment Method')}}</label>
          <div class="col-sm-9">
              <select name="payment_method" id="payment_method" class="form-control aiz-selectpicker" required>
                  <option value="">{{translate('Select Payment Method')}}</option>
                  <option value="cash">{{translate('cash')}}</option>
              @if($affiliate_user->paypal_email)
                <option value="paypal">{{translate('paypal')}}</option>
                @endif
                @if($affiliate_user->bank_information)
                <option value="bank">{{translate('bank')}}</option>
                @endif
              </select>
          </div>
      </div>
    </div>
    <div class="modal-footer">
      <button class="btn btn-sm btn-primary" type="submit">{{ translate('Pay')}}</button>
      <button type="button" class="btn btn-sm btn-light" data-dismiss="modal">{{translate('Cancel')}}</button>
    </div>
</form>
