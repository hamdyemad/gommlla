@extends('backend.layouts.app')

@section('content')

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h6">{{translate('Add New purchases')}}</h5>
    </div>

    <div class="col-lg-10 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('purchases Information')}}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('purchases.store') }}" method="POST">
                    @csrf
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('date')}}</label>
                        <div class="col-sm-9">
                            <input type="date" value="{{old('date')}}" placeholder="{{translate('date')}}" id="date" name="date" class="form-control" required>
                            @error('date')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('supplier')}}</label>
                        <div class="col-sm-9">

                            <select class="form-control aiz-selectpicker" name="supplier_id" id="supplier_id">
                                <option value="">{{translate('select option')}}</option>
                                @foreach($suppliers as $supplire)
                                    <option value="{{$supplire['id']}}">{{$supplire['name']}}</option>
                                    @endforeach

                            </select>
                            @error('date')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Warehouse')}}</label>
                        <div class="col-sm-9">

                            <select class="form-control aiz-selectpicker" name="Warehouse_id" id="Warehouse_id">
                                <option value="">{{translate('select option')}}</option>
                                @foreach($Warehouses as $Warehouse)
                                    <option value="{{$Warehouse['id']}}">{{$Warehouse['name']}}</option>
                                    @endforeach

                            </select>
                            @error('date')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Search product')}}</label>
                        <div class="col-sm-9">
                            <input onkeyup="get_product($(this))" type="text" value="{{old('search')}}" placeholder="{{translate('search')}}" id="search" name="search" class="form-control" >
                            @error('search')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                            <div id="search_product" style="max-height: 200px;overflow-y: scroll">


                            </div>

                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered tab">
                                <thead>

                                <tr>
                                    <th>#</th>
                                    <th>{{translate('product')}}</th>
                                    <th>{{translate('price unite')}}</th>
                                    <th>{{translate('qty')}}</th>
                                    <th>{{translate('total')}}</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>


                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="old_attri">
                        <div class="card-body">
                            <div class="form-group row">
                                <div class="col-md-3">
                                    <input type="text" class="form-control" value="{{translate('Colors')}}" >
                                </div>
                                <div class="col-md-8">
                                    <select class="form-control aiz-selectpicker" data-live-search="true" name="colors[]" id="colors" multiple >
                                        @foreach (\App\Color::orderBy('name', 'asc')->get() as $key => $color)
                                            <option  value="{{ $color->code }}" data-content="<span><span class='size-15px d-inline-block mr-2 rounded border' style='background:{{ $color->code }}'></span><span>{{ translate($color->name) }}</span></span>"></option>
                                        @endforeach
                                    </select>
                                </div>

                            </div>

                            <div class="form-group row">
                                <div class="col-md-3">
                                    <input type="text" class="form-control" value="{{translate('Attributes')}}" disabled>
                                </div>
                                <div class="col-md-8">
                                    <select name="choice_attributes[]" id="choice_attributes" class="form-control aiz-selectpicker" data-live-search="true" multiple data-placeholder="{{ translate('Choose Attributes') }}">
                                        @foreach (\App\Attribute::all() as $key => $attribute)
                                            <option value="{{ $attribute->id }}">{{ $attribute->getTranslation('name') }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div>
                                <p>{{ translate('Choose the attributes of this product and then input values of each attribute') }}</p>
                                <br>
                            </div>

                            <div class="customer_choice_options" id="customer_choice_options">

                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <div class="attripute_product">





                        </div>
                    </div>


                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-primary">{{translate('Save')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">خصائص المنتج</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
{{--                <div class="modal-footer">--}}
{{--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--}}
{{--                    <button type="button" class="btn btn-primary">Save changes</button>--}}
{{--                </div>--}}
            </div>
        </div>
    </div>


@endsection
@section('script')
    <script>
        function get_product(element){
            $('#search_product').html('');
            var op="<ul class='list-unstyled'>"
            if($(element).val().length>2){
$.ajax({
    type:"get",
    url:"{{route('get_product')}}",
    data:{'name':$(element).val()},
    success:function (data){
        $('#search_product').html('');
       for(i=0;i<data.length;i++){
        op+="<li onclick='add_product_to_purchase($(this))' data-id='"+data[i]['id']+"'>"+data[i]['name']+"("+data[i]['barcode']+")</li>"
       }
       op+="</ul>";
       console.log(op)
        var child="<div class='child'></div>"
       $("#search_product").append(op)
    }

})
            }
        }
function add_product_to_purchase(element){
    var count = $("table tbody").children().length;

$.ajax({
    type:"get",
    url:"{{route('add_product_to_purchase')}}",
    data:{'id':$(element).data('id')},
    success:function (data){
        console.log(data)
        count_child = $("table tbody .child-"+data['id']).length;
     if(count_child==0) {
         op = "<tr class='child-" + data['id'] + "'><td>" + (count + 1) + "</td>" +
             "<td>" + data['name'] + "</td>" +
             "<td>" + data['purchase_price'] + "</td>" +
             "<td><input class='form-control' name='product["+data['id']+"][]' type='number' min='1' value='1'></td>" +
             "<td>" + data['purchase_price'] + "</td>" +
             "<td>" +
             "<span onclick='remove_product($(this))' class='btn btn-primary'><i class='las la-trash'></i></span>" +
             "<span class='btn btn-success' onclick='edit_attr("+data['id']+")'><i class='las la-edit'></i></span>" +
             "</td>" +
             "</div>" +
             "</tr>"
         $('table tbody').append(op)

         var x=$('.old_attri').clone();
         console.log(x);


     }else {
         alert("تم اضافة هذا المنتج من قبل ")
     }
    }
})

}

function remove_product(element){
            $(element).parents('tr').remove();
}
function edit_attr(id){
            alert(id)
}

        function add_more_customer_choice_option(i, name){
            $('#customer_choice_options').append('<div class="form-group row"><div class="col-md-3"><input type="hidden" name="choice_no[]" value="'+i+'"><input type="text" class="form-control" name="choice[]" value="'+name+'" placeholder="{{ translate('Choice Title') }}" readonly></div><div class="col-md-8"><input type="text" class="form-control aiz-tag-input" name="choice_options_'+i+'[]" placeholder="{{ translate('Enter choice values') }}" data-on-change="update_sku"></div></div>');

            AIZ.plugins.tagify();
        }

        $('#choice_attributes').on('change', function() {
            $('#customer_choice_options').html(null);
            $.each($("#choice_attributes option:selected"), function(){
                add_more_customer_choice_option($(this).val(), $(this).text());
            });
            update_sku();
        });
    </script>
@endsection
