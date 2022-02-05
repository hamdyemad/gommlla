@extends('backend.layouts.app')

@section('content')
    <div class="aiz-titlebar text-left mt-2 mb-3">
    	<div class=" align-items-center">
           <h1 class="h3">{{translate('Product wise stock report')}}</h1>
    	</div>
    </div>

    <div class="col-md-12 mx-auto">
        <div class="card">
            <!--card body-->
            <div class="card-body">
                <form action="{{ route('stock_report.index') }}" method="GET">
                    <div class="form-group row offset-lg-2">
                        <label class="col-md-3 col-form-label">{{translate('Sort by Category')}} :</label>
                        <div class="col-md-5">
                            <select id="demo-ease" class="from-control aiz-selectpicker" name="category_id" required>
                                @foreach (\App\Category::all() as $key => $category)
                                    <option value="{{ $category->id }}">{{ $category->getTranslation('name') }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="cil-md-2">
                            <button class="btn btn-light" type="submit">{{ translate('Filter') }}</button>
                        </div>
                    </div>
                </form>
                <table class="table table-bordered aiz-table mb-0">
                    <thead>
                        <tr>
                            <th>{{ translate('Product Name') }}</th>
                             <th>{{ translate('ALL COUNT') }}</th>
                            <th>{{ translate('Stock') }}</th>
                            <th>{{ translate('متوسط التكلفة') }}</th>
                       <th>{{translate('التكلفة')}} </th>
                       <th>{{translate('سعر البيع')}} </th>
                       <th>{{translate('اجمالي البيع')}} </th>
                       <th>{{ translate('متوقع الربح') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $key => $product)
                            @php
                                $qty = 0;
                                if ($product->variant_product) {
                                    foreach ($product->stocks as $key => $stock) {
                                        $qty += $stock->qty;
                                    }
                                }
                                else {
                                    $qty = $product->current_stock;
                                }
                            @endphp
                            <tr>
                                <td>{{ $product->getTranslation('name') }}</td>
                                <td>{{$qty+$product['num_of_sale']}}</td>
                               <td>{{ $qty }}</td>
                               <td>{{$product['purchase_price']}}</td>
                               <td>{{($product['purchase_price']*$qty)}}</td>
                               <td>{{$product['unit_price']}}</td>
                               <td>{{($product['unit_price']*$qty)}}</td>
                               <td>{{($product['unit_price']*$qty)-($product['purchase_price']*$qty)}}</td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot><tr>
                        <td>totle</td>
                        <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                    
                    </tr></tfooter>
                </table>
                <div class="aiz-pagination mt-4">
                    {{ $products->links() }}
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
 <script>
                            $(document).ready(function() {
                            
                            $('table thead th').each(function (i) {
                                if(i>0){
                calculateColumn(i);
                                }
            });
                            });

                            function calculateColumn(index) {

                                var total = 0;
                               $('.table tbody tr').each(function() {
                                  var value = parseInt($('td', this).eq(index).text());

                                    if (!isNaN(value)) {
                                     total += value;
                                 }
                               });

                                $('table tfoot td').eq(index).text( total);
                            }
                            
                        </script>

@endsection


