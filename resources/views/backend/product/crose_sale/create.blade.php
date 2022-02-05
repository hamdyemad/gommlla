@extends('backend.layouts.app')

@section('content')

<div class="col-lg-10 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('cross sale Product')}}</h5>
        </div>
        <div class="card-body">
           
            <form action="{{route('products.save_upcrose_sale', ['id'=>$row['id']]  )}}" method="POST">
                @csrf
               

                <div class="form-group row mb-3">
                    <label class="col-sm-3 control-label" for="products">{{translate('Products')}}</label>
                    <div class="col-sm-9">
                        <select name="products[]" id="products" class="form-control aiz-selectpicker" multiple required data-placeholder="{{ translate('Choose Products') }}" data-live-search="true" data-selected-text-format="count">
                            @foreach(\App\Product::orderBy('created_at', 'desc')->get() as $product)
                                <option value="{{$product->id}}" {{isset($row['crose_sale'])&&in_array($product->id,$cros)?'selected':''}}>{{ $product->getTranslation('name') }}</option>
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
