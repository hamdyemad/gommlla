@extends('backend.layouts.app')

@section('content')



<div class="col-lg-10 mx-auto">
  
    
    @foreach($row['product_saller'] as $upsale)
    @if(count($upsale['upsale'])>0)
    <h3>اشتري {{ $upsale['number']}} واحصل</h3>
    
      <table class="table table-bordered">
    <thead>
    	<tr>
    		<td width="50%">
            <span>{{translate('Product')}}</span>
    		</td>
        <td width="20%">
            <span>{{translate('Base Price')}}</span>
    		</td>
    		<td width="20%">
            <span>{{translate('Discount')}}</span>
    		</td>
        <td width="10%">
            <span>{{translate('delet')}}</span>
        </td>
    	</tr>
    </thead>
    <tbody>
        @foreach ($upsale['upsale'] as $key => $product)
      
            <tr>
              <td>
                <div class="from-group row">
                  <div class="col-auto">
                    <img class="size-60px img-fit" src="{{ uploaded_asset($product->thumbnail_img)}}">
                  </div>
                  <div class="col">
                    <span>{{  $product->getTranslation('name')  }}</span>
                  </div>
                </div>
              </td>
              <td>
                  <span>{{ $product->unit_price }}</span>
              </td>
              <td>
                  <input type="number" name="discount" value="{{ $product['pivot']['discount'] }}" min="0" step="1" class="form-control" required>
              </td>
              <td>
                  <a  class="btn btn-soft-danger btn-icon btn-circle btn-sm " href="{{route('products.delet_upsale', $product['pivot']['id'])}}" title="{{ translate('Delete') }}">
                              <i class="las la-trash"></i>
                           </a>
              </td>
            </tr>
        @endforeach
    </tbody>
  </table>
    
   
    @endif
    @endforeach
    
    
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('upsale Product')}}</h5>
        </div>
        <div class="card-body">
           
            <form action="{{route('products.save_upsale', ['id'=>$row['id']]  )}}" method="POST">
                @csrf
               
                <div class="form-group row mb-3">
                    <label class="col-sm-3 control-label" for="products">{{translate('number')}}</label>
                    <div class="col-sm-9">
                    	<input type="number" class="form-control" name="min_qty" value="1" min="1" required>
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <label class="col-sm-3 control-label" for="products">{{translate('Products')}}</label>
                    <div class="col-sm-9">
                        <select name="products[]" id="products" class="form-control aiz-selectpicker" multiple required data-placeholder="{{ translate('Choose Products') }}" data-live-search="true" data-selected-text-format="count">
                            @foreach(\App\Product::orderBy('created_at', 'desc')->get() as $product)
                                <option value="{{$product->id}}">{{ $product->getTranslation('name') }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <br>
                <div class="form-group row" id="discount_table">

                </div>
                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-primary">{{translate('Save')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@section('script')
    <script type="text/javascript">
        $(document).ready(function(){
            $('#products').on('change', function(){
                var product_ids = $('#products').val();
                if(product_ids.length > 0){
                    $.post('{{ route('flash_deals.product_discount') }}', {_token:'{{ csrf_token() }}', product_ids:product_ids}, function(data){
                        $('#discount_table').html(data);
                        $(".aiz-selectpicker").selectpicker();
                    });
                }
                else{
                    $('#discount_table').html(null);
                }
            });
        });
    </script>
@endsection
