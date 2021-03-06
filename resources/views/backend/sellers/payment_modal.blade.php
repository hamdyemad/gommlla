<form action="{{ route('commissions.pay_to_seller') }}" method="POST">
    @csrf
    <div class="modal-header">
    	<h5 class="modal-title h6">{{translate('Pay to seller')}}</h5>
    	<button type="button" class="close" data-dismiss="modal">
    	</button>
    </div>
    <div class="modal-body" style="overflow-y: unset !important">
      <table class="table table-striped table-bordered" >
          <tbody>
              <tr>
                  @if($seller->admin_to_pay >= 0)
                      <td>{{ translate('Due to seller') }}</td>
                      <td>{{ single_price($seller->admin_to_pay) }}</td>
                  @endif
              </tr>
              @if ($seller->bank_payment_status == 1)
                  <tr>
                      <td>{{ translate('Bank Name') }}</td>
                      <td>{{ $seller->bank_name }}</td>
                  </tr>
                  <tr>
                      <td>{{ translate('Bank Account Name') }}</td>
                      <td>{{ $seller->bank_acc_name }}</td>
                  </tr>
                  <tr>
                      <td>{{ translate('Bank Account Number') }}</td>
                      <td>{{ $seller->bank_acc_no }}</td>
                  </tr>
                  <tr>
                      <td>{{ translate('Bank Routing Number') }}</td>
                      <td>{{ $seller->bank_routing_no }}</td>
                  </tr>
              @endif
          </tbody>
      </table>

      @if ($seller->admin_to_pay > 0)
          <input type="hidden" name="seller_id" value="{{ $seller->id }}">
          <div class="form-group">
            <select class="form-control aiz-selectpicker orders_payment" multiple required name="orders_should_pay[]" id="orders_should_pay"  data-live-search="true">
                @foreach ($orders_should_payments as $orders_should_payment)
                    <option value="{{ $orders_should_payment->id }}">{{ translate('order code') . "(" . $orders_should_payment->order_detail->order->code . ")" . translate('price') . "(" . format_price($orders_should_payment->amount) . ")" }}</option>
                @endforeach
            </select>
          </div>
          <div class="form-group row">
              <label class="col-md-3 col-from-label" for="payment_option">{{translate('Payment Method')}}</label>
              <div class="col-md-9">
                  <select name="payment_option" id="payment_option" class="form-control aiz-selectpicker" required>
                      <option value="">{{translate('Select Payment Method')}}</option>
                      @if($seller->cash_on_delivery_status == 1)
                          <option value="cash">{{translate('Cash')}}</option>
                      @endif
                      @if($seller->bank_payment_status == 1)
                          <option value="bank_payment">{{translate('Bank Payment')}}</option>
                      @endif
                  </select>
              </div>
          </div>
          <div class="form-group row" id="txn_div">
              <label class="col-md-3 col-from-label" for="txn_code">{{translate('Txn Code')}}</label>
              <div class="col-md-9">
                  <input type="text" name="txn_code" id="txn_code" class="form-control">
              </div>
          </div>
      @endif
    </div>
    <div class="modal-footer">
      @if ($seller->admin_to_pay > 0)
        <button type="submit" class="btn btn-primary">{{translate('Pay')}}</button>
      @endif
      <button type="button" class="btn btn-light" data-dismiss="modal">{{translate('Cancel')}}</button>
    </div>
</form>

<script>
  $(document).ready(function(){
      $('#payment_option').on('change', function() {
        if ( this.value == 'bank_payment')
        {
          $("#txn_div").show();
        }
        else
        {
          $("#txn_div").hide();
        }
      });
      $("#txn_div").hide();
      AIZ.plugins.bootstrapSelect('refresh');
  });
</script>
