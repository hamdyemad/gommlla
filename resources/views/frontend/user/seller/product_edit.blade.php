@extends('frontend.layouts.app')

@section('content')


    <section class="py-5">
        <div class="container">
            <div class="d-flex align-items-start">
                @include('frontend.inc.user_side_nav')

                <div class="aiz-user-panel">

                    <div class="aiz-titlebar mt-2 mb-4">
                      <div class="row align-items-center">
                        <div class="col-md-6">
                            <h1 class="h3">{{ translate('Update your product') }}</h1>
                        </div>
                      </div>
                    </div>

                    <form class="" action="{{route('products.update', $product->id)}}" method="POST" enctype="multipart/form-data" id="choice_form">
                        <input name="_method" type="hidden" value="POST">
                        <input type="hidden" name="lang" value="{{ $lang }}">
                        <input type="hidden" name="id" value="{{ $product->id }}">
                        @csrf
                		<input type="hidden" name="added_by" value="seller">
                        <div class="card">
                            <div class="card-body">
                                <ul class="nav nav-tabs nav-fill border-light">
                                    @foreach (\App\Language::all() as $key => $language)
                                        <li class="nav-item">
                                            <a class="nav-link text-reset @if ($language->code == $lang) bg-soft-dark @else border-light border-left-0 @endif py-3" href="{{ route('seller.products.edit', ['id'=>$product->id, 'lang'=> $language->code] ) }}">
                                                <img src="{{ static_asset('assets/img/flags/'.$language->code.'.png') }}" height="11" class="mr-1">
                                                <span>{{$language->name}}</span>
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0 h6">{{translate('Product Images')}}</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('Gallery Images')}}</label>
                                    <div class="col-md-8">
                                        <div class="input-group" data-toggle="aizuploader" data-type="image" data-multiple="true">
                                            <div class="input-group-prepend w-100">
                                                <button type="button" class="btn btn-primary w-100 rounded">
                                                    <i class="fas fa-lg fa-plus"></i>
                                                </button>
                                            </div>
                                            <input type="hidden" name="photos" value="{{ $product->photos }}" class="selected-files">
                                        </div>
                                        <div class="file-preview box sm">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-from-label">{{translate('Product Name')}}</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" name="name" placeholder="{{translate('Product Name')}}" value="{{$product->getTranslation('name')}}" required>
                                    </div>
                                </div>
                                <div class="form-group row" id="category">
                                    <label class="col-lg-3 col-from-label">{{translate('Category')}}</label>
                                    <div class="col-lg-8">
                                        <select class="form-control aiz-selectpicker" name="category_id" id="category_id" required>
                                            <option>{{ translate('Select an option') }}</option>
                                            @foreach($categories as $category)
                                                <option value="{{$category->id}}" <?php if($product->category_id == $category->id) echo "selected"; ?> >{{ $category->getTranslation('name') }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row" id="subcategory">
                                    <label class="col-lg-3 col-from-label">{{translate('Subcategory')}}</label>
                                    <div class="col-lg-8">
                                        <select class="form-control aiz-selectpicker" name="subcategory_id" id="subcategory_id" required>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row" id="subsubcategory">
                                    <label class="col-lg-3 col-from-label">{{translate('Sub Subcategory')}}</label>
                                    <div class="col-lg-8">
                                        <select class="form-control aiz-selectpicker" name="subsubcategory_id" id="subsubcategory_id">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row" id="brand">
                                    <label class="col-lg-3 col-from-label">{{translate('Brand')}}</label>
                                    <div class="col-lg-8">
                                        <select class="form-control aiz-selectpicker" name="brand_id" id="brand_id">
                                            <option value="">{{ ('Select Brand') }}</option>
                                            @foreach (\App\Brand::all() as $brand)
                                                <option value="{{ $brand->id }}" @if($product->brand_id == $brand->id) selected @endif>{{ $brand->getTranslation('name') }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                @php
                                    $sell_types = json_decode(Auth::user()->seller->sell_type);
                                @endphp
                                <div class="form-group row">
                                    <label class="col-md-3 col-from-label">{{translate('product sell type')}}</label>
                                    <div class="col-md-8">
                                        <select class="form-control aiz-selectpicker" required  multiple name="product_sell_type[]" id="product_sell_type"  data-live-search="true">
                                            @foreach (\App\Unit::whereIn('id', $sell_types)->get() as $unit)
                                                <option
                                                @if(is_array(json_decode($product->product_sell_type))))
                                                    @if(in_array($unit->id, json_decode($product->product_sell_type)) == $unit->id) selected @endif
                                                @endif
                                                 value="{{ $unit->id }}">{{ $unit->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0 h6">{{translate('Product price + stock')}}</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col 1 @if(in_array('1', json_decode($product->product_sell_type))) @else d-none @endif">
                                        <div class="form-group">
                                            <label>{{translate('Unit price')}}</label>
                                            <input type="number" min="0" value="{{ $product->unit_price }}" step="0.01" placeholder="{{ translate('Unit price') }}" name="unit_price" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col 2 @if(in_array('2', json_decode($product->product_sell_type))) @else d-none @endif">
                                        <div class="form-group">
                                            <label>{{translate('Wholesale price')}}</label>
                                            <input type="number" min="0" value="{{ $product->wholesale_price }}" step="0.01" placeholder="{{ translate('Wholesale price') }}" name="wholesale_price" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="discount_type">{{ translate('Discount type') }}</label>
                                    <select class="form-control aiz-selectpicker price_type" name="discount_type">
                                        <option @if($product->discount_type == 'amount') selected @endif value="amount">{{translate('Amount')}}</option>
                                        <option @if($product->discount_type == 'percent') selected @endif value="percent">{{translate('Percent')}}</option>
                                    </select>
                                    @if($product->discount_type == 'amount')
                                        <div class="alert alert-info p-1 mt-2 amount-discount">{{ translate('discount with number') }}</div>
                                    @else
                                        <div class="alert alert-info p-1 mt-2 percent-discount">{{ translate('discount with percentage') }}</div>
                                    @endif
                                </div>
                                <div class="form-group row">
                                    <div class="col 1 @if(in_array('1', json_decode($product->product_sell_type))) @else d-none @endif">
                                        <label>{{translate('Discount')}}</label>
                                        <input type="number" min="0" value="{{ $product->discount }}" step="0.01" placeholder="{{ translate('Discount') }}" name="discount" class="form-control">
                                    </div>
                                    <div class="col 2 @if(in_array('2', json_decode($product->product_sell_type))) @else d-none @endif">
                                        <label>{{translate('Wholesale Discount')}}</label>
                                        <input type="number" min="0" value="{{ $product->wholesale_discount }}" step="0.01" placeholder="{{ translate('Wholesale Discount') }}" name="Wholesale_discount" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group" id="quantity">
                                    <label>{{translate('Quantity')}}</label>
                                    <input type="number" min="0" value="{{ $product->current_stock }}" step="1" placeholder="{{ translate('Quantity') }}" name="current_stock" class="form-control" required>
                                </div>
                                <br>
                                <div class="sku_combination" id="sku_combination">

                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0 h6">{{translate('Product Variation')}}</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control" value="{{translate('Colors')}}" disabled>
                                    </div>
                                    <div class="col-lg-8">
                                        <select class="form-control aiz-selectpicker" data-live-search="true" name="colors[]" id="colors" multiple>
                                            @foreach (\App\Color::orderBy('name', 'asc')->get() as $key => $color)
                                                <option
                                                    value="{{ $color->code }}"
                                                    data-content="<span><span class='size-15px d-inline-block mr-2 rounded border' style='background:{{ $color->code }}'></span><span>{{ translate($color->name) }}</span></span>"
                                                    <?php if(in_array($color->code, json_decode($product->colors))) echo 'selected'?>
                                                ></option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-lg-1">
                                        <label class="aiz-switch aiz-switch-success mb-0">
                                            <input value="1" type="checkbox" name="colors_active" <?php if(count(json_decode($product->colors)) > 0) echo "checked";?> >
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-from-label">{{translate('Sizes')}}</label>
                                    <div class="col-md-8">
                                        @php
                                        $sizes = json_decode($product->sizes);
                                        @endphp
                                        @if(is_array($sizes))
                                            <select class="form-control aiz-selectpicker" required  multiple name="sizes[]" id="sizes"  data-live-search="true">
                                                <option value="XS" @if(in_array('XS', $sizes)) selected @endif>XS</option>
                                                <option value="S" @if(in_array("S", $sizes)) selected @endif>S</option>
                                                <option value="M" @if(in_array("M", $sizes)) selected @endif>M</option>
                                                <option value="L" @if(in_array("L", $sizes)) selected @endif>L</option>
                                                <option value="XL" @if(in_array("XL", $sizes)) selected @endif>XL</option>
                                                <option value="XXL" @if(in_array("XXL", $sizes)) selected @endif>XXL</option>
                                                <option value="XXXL" @if(in_array("XXXL", $sizes)) selected @endif>XXXL</option>
                                                <option value="XXXL" @if(in_array("XXXL", $sizes)) selected @endif>XXXL</option>
                                            </select>
                                            @else
                                            <select class="form-control aiz-selectpicker" required  multiple name="sizes[]" id="sizes"  data-live-search="true">
                                                <option value="XS">XS</option>
                                                <option value="S">S</option>
                                                <option value="M">M</option>
                                                <option value="L">L</option>
                                                <option value="XL">XL</option>
                                                <option value="XXL">XXL</option>
                                                <option value="XXXL">XXXL</option>
                                                <option value="XXXL">XXXL</option>
                                            </select>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0 h6">{{translate('other additions')}}</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-from-label">{{translate('Tags')}}</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control aiz-tag-input" name="tags[]" id="tags" value="{{ $product->tags }}" placeholder="{{ translate('Type to add a tag') }}" data-role="tagsinput">
                                    </div>
                                </div>
                                @php
                                    $pos_addon = \App\Addon::where('unique_identifier', 'pos_system')->first();
                                @endphp
                                @if ($pos_addon != null && $pos_addon->activated == 1)
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-from-label">{{translate('Barcode')}}</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="barcode" placeholder="{{ translate('Barcode') }}" value="{{ $product->barcode }}">
                                        </div>
                                    </div>
                                @endif
                                <div class="form-group row">
                                    <label class="col-lg-3 col-from-label">{{translate('Video Provider')}}</label>
                                    <div class="col-lg-8">
                                        <select class="form-control aiz-selectpicker" name="video_provider" id="video_provider">
                                            <option value="youtube" <?php if($product->video_provider == 'youtube') echo "selected";?> >{{translate('Youtube')}}</option>
                                            <option value="dailymotion" <?php if($product->video_provider == 'dailymotion') echo "selected";?> >{{translate('Dailymotion')}}</option>
                                            <option value="vimeo" <?php if($product->video_provider == 'vimeo') echo "selected";?> >{{translate('Vimeo')}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-from-label">{{translate('Video Link')}}</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" name="video_link" value="{{ $product->video_link }}" placeholder="{{ translate('Video Link') }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0 h6">{{translate('Product Description')}}</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group row 1 @if(in_array('1', json_decode($product->product_sell_type))) @else d-none @endif">
                                    <label class="col-lg-3 col-from-label">{{translate('Product Unit Description')}}</label>
                                    <div class="col-lg-9">
                                        <textarea class="aiz-text-editor" name="description">{{$product->getTranslation('description')}}</textarea>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row 2 @if(in_array('2', json_decode($product->product_sell_type))) @else d-none @endif">
                                        <label class="col-lg-3 col-from-label">{{translate('Product Wholesale Description')}}</label>
                                        <div class="col-lg-9">
                                            <textarea class="aiz-text-editor" name="wholesale_description">{{$product->getTranslation('wholesale_description')}}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0 h6">{{translate('SEO Meta Tags')}}</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-from-label">{{translate('Meta Title')}}</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" name="meta_title" value="{{ $product->meta_title }}" placeholder="{{translate('Meta Title')}}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-from-label">{{translate('Description')}}</label>
                                    <div class="col-lg-8">
                                        <textarea name="meta_description" rows="8" class="form-control">{{ $product->meta_description }}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('Meta Images')}}</label>
                                    <div class="col-md-8">
                                        <div class="input-group" data-toggle="aizuploader" data-type="image" data-multiple="true">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                            </div>
                                            <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                            <input type="hidden" name="meta_img" value="{{ $product->meta_img }}" class="selected-files">
                                        </div>
                                        <div class="file-preview box sm">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mar-all text-right">
                            <button type="submit" name="button" class="btn btn-primary">{{ translate('Update Product') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="categorySelectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">{{ translate('Select Category')}}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="target-category heading-6">
                        <span class="mr-3">{{ translate('Target Category')}}:</span>
                        <span>{{ translate('Category')}} > {{ translate('Subcategory')}} > {{ translate('Sub Subcategory')}}</span>
                    </div>
                    <div class="row no-gutters modal-categories mt-4 mb-2">
                        <div class="col-4">
                            <div class="modal-category-box c-scrollbar">
                                <div class="sort-by-box">
                                    <form role="form" class="search-widget">
                                        <input class="form-control input-lg" type="text" placeholder="{{ translate('Search Category') }}" onkeyup="filterListItems(this, 'categories')">
                                        <button type="button" class="btn-inner">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="modal-category-list has-right-arrow">
                                    <ul id="categories">
                                        @foreach ($categories as $key => $category)
                                            <li onclick="get_subcategories_by_category(this, {{ $category->id }})">{{ $category->getTranslation('name') }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="modal-category-box c-scrollbar" id="subcategory_list">
                                <div class="sort-by-box">
                                    <form role="form" class="search-widget">
                                        <input class="form-control input-lg" type="text" placeholder="{{ translate('Search SubCategory') }}" onkeyup="filterListItems(this, 'subcategories')">
                                        <button type="button" class="btn-inner">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="modal-category-list has-right-arrow">
                                    <ul id="subcategories">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="modal-category-box c-scrollbar" id="subsubcategory_list">
                                <div class="sort-by-box">
                                    <form role="form" class="search-widget">
                                        <input class="form-control input-lg" type="text" placeholder="{{ translate('Search SubSubCategory') }}" onkeyup="filterListItems(this, 'subsubcategories')">
                                        <button type="button" class="btn-inner">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="modal-category-list">
                                    <ul id="subsubcategories">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ translate('Cancel')}}</button>
                    <button type="button" class="btn btn-primary" onclick="closeModal()">{{ translate('Confirm')}}</button>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">

        $('#product_sell_type').on('change', function() {
            ['1', '2'].forEach((val) => {
                $("." + val).addClass('d-none');
            });
            $(this).val().forEach((val) => {
                $("." + val).removeClass('d-none');
            });
        });

        $(".price_type").on('change', function() {
                    if($(this).val() !== '') {
                    let amount = `<div class="alert alert-info p-1 mt-2 amount-discount">{{ translate('discount with number') }}</div>`,
                        percent = `<div class="alert alert-info p-1 mt-2 percent-discount">{{ translate('discount with percentage') }}</div>`;
                    if($(this).val() == 'amount') {
                        $(this).parent().after(amount);
                        $('.percent-discount').remove();

                    } else {
                        $(this).parent().after(percent);
                        $('.amount-discount').remove();
                    }

                    }
                });

        function add_more_customer_choice_option(i, name){
        $('#customer_choice_options').append('<div class="form-group row"><div class="col-md-3"><input type="hidden" name="choice_no[]" value="'+i+'"><input type="text" class="form-control" name="choice[]" value="'+name+'" placeholder="{{ translate('Choice Title') }}" readonly></div><div class="col-md-8"><input type="text" class="form-control aiz-tag-input" name="choice_options_'+i+'[]" placeholder="{{ translate('Enter choice values') }}" data-on-change="update_sku"></div></div>');

        AIZ.plugins.tagify();
    }

    $('input[name="colors_active"]').on('change', function() {
        console.log('asd');
        if(!$('input[name="colors_active"]').is(':checked')){
            $('#colors').prop('disabled', true);
        }
        else{
            $('#colors').prop('disabled', false);
        }
        update_sku();
    });

    $('#colors').on('change', function() {
        update_sku();
    });

    function delete_row(em){
        $(em).closest('.form-group').remove();
        update_sku();
    }

    function delete_variant(em){
        $(em).closest('.variant').remove();
    }

    function update_sku(){
        $.ajax({
           type:"POST",
           url:'{{ route('products.sku_combination_edit') }}',
           data:$('#choice_form').serialize(),
           success: function(data){
               $('#sku_combination').html(data);
               if (data.length > 1) {
                   $('#quantity').hide();
               }
               else {
                    $('#quantity').show();
               }
           }
       });
    }

    AIZ.plugins.tagify();
    function get_subcategories_by_category(){
        var category_id = $('#category_id').val();
        $.post('{{ route('subcategories.get_subcategories_by_category') }}',{_token:'{{ csrf_token() }}', category_id:category_id}, function(data){
            $('#subcategory_id').html(null);
            for (var i = 0; i < data.length; i++) {
                $('#subcategory_id').append($('<option>', {
                    value: data[i].id,
                    text: data[i].name
                }));
            }

            $("#subcategory_id > option").each(function() {
                if(this.value == '{{$product->subcategory_id}}'){
                    $("#subcategory_id").val(this.value).change();
                }
            });

            $(".aiz-selectpicker").selectpicker();

            get_subsubcategories_by_subcategory();
        });
    }

    function get_subsubcategories_by_subcategory(){
        var subcategory_id = $('#subcategory_id').val();
        $.post('{{ route('subsubcategories.get_subsubcategories_by_subcategory') }}',{_token:'{{ csrf_token() }}', subcategory_id:subcategory_id}, function(data){
            $('#subsubcategory_id').html(null);
            $('#subsubcategory_id').append($('<option>', {
                value: null,
                text: null
            }));
            for (var i = 0; i < data.length; i++) {
                $('#subsubcategory_id').append($('<option>', {
                    value: data[i].id,
                    text: data[i].name
                }));
            }
            $("#subsubcategory_id > option").each(function() {
                if(this.value == '{{$product->subsubcategory_id}}'){
                    $("#subsubcategory_id").val(this.value).change();
                }
            });

            $(".aiz-selectpicker").selectpicker();

            //get_brands_by_subsubcategory();
            //get_attributes_by_subsubcategory();
        });
    }

    function get_attributes_by_subsubcategory(){
        var subsubcategory_id = $('#subsubcategory_id').val();
        $.post('{{ route('subsubcategories.get_attributes_by_subsubcategory') }}',{_token:'{{ csrf_token() }}', subsubcategory_id:subsubcategory_id}, function(data){
            $('#choice_attributes').html(null);
            for (var i = 0; i < data.length; i++) {
                $('#choice_attributes').append($('<option>', {
                    value: data[i].id,
                    text: data[i].name
                }));
            }
            $("#choice_attributes > option").each(function() {
                var str = @php echo $product->attributes @endphp;
                $("#choice_attributes").val(str).change();
            });

            $(".aiz-selectpicker").selectpicker();
        });
    }

    $(document).ready(function(){
        get_subcategories_by_category();
        // $("#photos").spartanMultiImagePicker({
        //  fieldName:        'photos[]',
        //  maxCount:         10,
        //  rowHeight:        '200px',
        //  groupClassName:   'col-md-4 col-sm-4 col-xs-6',
        //  maxFileSize:      '',
        //  dropFileLabel : "Drop Here",
        //  onExtensionErr : function(index, file){
        //      console.log(index, file,  'extension err');
        //      alert('Please only input png or jpg type file')
        //  },
        //  onSizeErr : function(index, file){
        //      console.log(index, file,  'file size too big');
        //      alert('File size too big');
        //  }
        // });
        // $("#thumbnail_img").spartanMultiImagePicker({
        //  fieldName:        'thumbnail_img',
        //  maxCount:         1,
        //  rowHeight:        '200px',
        //  groupClassName:   'col-md-4 col-sm-4 col-xs-6',
        //  maxFileSize:      '',
        //  dropFileLabel : "Drop Here",
        //  onExtensionErr : function(index, file){
        //      console.log(index, file,  'extension err');
        //      alert('Please only input png or jpg type file')
        //  },
        //  onSizeErr : function(index, file){
        //      console.log(index, file,  'file size too big');
        //      alert('File size too big');
        //  }
        // });
        // $("#meta_photo").spartanMultiImagePicker({
        //  fieldName:        'meta_img',
        //  maxCount:         1,
        //  rowHeight:        '200px',
        //  groupClassName:   'col-md-4 col-sm-4 col-xs-6',
        //  maxFileSize:      '',
        //  dropFileLabel : "Drop Here",
        //  onExtensionErr : function(index, file){
        //      console.log(index, file,  'extension err');
        //      alert('Please only input png or jpg type file')
        //  },
        //  onSizeErr : function(index, file){
        //      console.log(index, file,  'file size too big');
        //      alert('File size too big');
        //  }
        // });

        update_sku();

        $('.remove-files').on('click', function(){
            $(this).parents(".col-md-4").remove();
        });
    });

    $('#category_id').on('change', function() {
        get_subcategories_by_category();
    });

    $('#subcategory_id').on('change', function() {
        get_subsubcategories_by_subcategory();
    });

    $('#subsubcategory_id').on('change', function() {
        //get_brands_by_subsubcategory();
        //get_attributes_by_subsubcategory();
    });

    $('#choice_attributes').on('change', function() {
        //$('#customer_choice_options').html(null);
        $.each($("#choice_attributes option:selected"), function(j, attribute){
            flag = false;
            $('input[name="choice_no[]"]').each(function(i, choice_no) {
                if($(attribute).val() == $(choice_no).val()){
                    flag = true;
                }
            });
            if(!flag){
                add_more_customer_choice_option($(attribute).val(), $(attribute).text());
            }
        });

        var str = @php echo $product->attributes @endphp;

        $.each(str, function(index, value){
            flag = false;
            $.each($("#choice_attributes option:selected"), function(j, attribute){
                if(value == $(attribute).val()){
                    flag = true;
                }
            });
            if(!flag){
                //console.log();
                $('input[name="choice_no[]"][value="'+value+'"]').parent().parent().remove();
            }
        });

        update_sku();
    });


    </script>
@endsection
