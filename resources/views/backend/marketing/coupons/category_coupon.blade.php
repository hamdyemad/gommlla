<div class="card-header mb-2">
    <h3 class="h6">اضف قسيمة خاصة بالفئات </h3>
</div>
<div class="form-group row">
    <label class="col-lg-3 col-from-label" for="coupon_code">{{translate('Coupon code')}}</label>
    <div class="col-lg-9">
        <input type="text" placeholder="{{translate('Coupon code')}}" id="coupon_code" name="coupon_code" class="form-control" required>
    </div>
</div>
<div class="product-choose-list">
    <div class="product-choose">
        <div class="form-group row">
            <label class="col-lg-3 col-from-label" for="name">{{translate('categories')}}</label>
            <div class="col-lg-9">
                <select name="category_ids[]" class="form-control product_id aiz-selectpicker" data-live-search="true" data-selected-text-format="count" required multiple>
                    @foreach(\App\Category::where('level', 0)->get() as $category)
                        <option value="{{$category->id}}">{{ $category->getTranslation('name') }}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
</div>
<br>
<div class="form-group row">
    <label class="col-sm-3 control-label" for="start_date">{{translate('Date')}}</label>
    <div class="col-sm-9">
      <input type="text" class="form-control aiz-date-range" name="date_range" placeholder="Select Date">
    </div>
</div>
<div class="form-group row">
   <label class="col-lg-3 col-from-label">{{translate('Discount')}}</label>
   <div class="col-lg-5">
      <input type="number" min="0" step="0.01" placeholder="{{translate('Discount')}}" name="discount" class="form-control" required>
   </div>
   <div class="col-lg-4">
       <select class="form-control aiz-selectpicker" name="discount_type">
           <option value="amount">{{translate('Amount')}}</option>
           <option value="percent">{{translate('Percent')}}</option>
       </select>
   </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 control-label" for="start_date">الشحن مجانا</label>
    <div class="col-sm-9">
        <label class="aiz-switch aiz-switch-success mb-0">
      	<input  value="yes" name="free_shipping" type="checkbox"  >
								<span class="slider round"></span>
								</label>
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 control-label" for="start_date">عدد مرات الاستخدام</label>
    <div class="col-sm-9">
       
      	<input class="form-control"  value="1" min="1" name="count" type="number"  >
							
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function(){
        $('.aiz-date-range').daterangepicker();
        AIZ.plugins.bootstrapSelect('refresh');
    });

</script>
