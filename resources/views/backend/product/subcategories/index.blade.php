@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="row align-items-center">
		<div class="col-md-6">
			<h1 class="h3">{{translate('All Subcategories')}}</h1>
		</div>
		<div class="col-md-6 text-md-right">
			<a href="{{ route('subcategories.create') }}" class="btn btn-circle btn-info">
				<span>{{translate('Add New Subcategory')}}</span>
			</a>
		</div>
	</div>
</div>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{ translate('Sub-Categories') }}</h5>
        <div class="form-group text-center">
            <label class="d-block" for="">{{ translate('Sub Categories Show') }}</label>
            <label class="aiz-switch aiz-switch-success mb-0">
                <input type="checkbox" onchange="update_show(this)" value="{{ get_setting('sub_categories_show') }}" <?php if(get_setting('sub_categories_show') == 1) echo "checked";?>>
                <span></span>
            </label>
        </div>
        <div class="pull-right clearfix">
            <form class="" id="sort_subcategories" action="" method="GET">
                <div class="box-inline pad-rgt pull-left">
                    <div class="" style="min-width: 200px;">
                        <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type name & Enter') }}">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{translate('Subcategory')}}</th>
                    <th>{{translate('Category')}}</th>
                    <th>{{translate('Order Show')}}</th>
                    <th width="10%" class="text-right">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($subcategories as $key => $subcategory)
                    @if ($subcategory->category != null)
                        <tr>
                            <td>{{ ($key+1) + ($subcategories->currentPage() - 1)*$subcategories->perPage() }}</td>
                            <td>{{ $subcategory->getTranslation('name') }}</td>
                            <td>{{ $subcategory->category->getTranslation('name')}}</td>
                            <td>{{ $subcategory->order_show}}</td>
                            <td class="text-right">
                                <a href="{{route('subcategories.edit', ['id'=>$subcategory->id, 'lang'=>env("DEFAULT_LANGUAGE")] )}}" class="btn btn-soft-primary btn-icon btn-circle btn-sm" title="{{ translate('Edit') }}">
                                    <i class="las la-edit"></i>
                                </a>
																<a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('subcategories.destroy', $subcategory->id)}}" title="{{ translate('Delete') }}">
																		<i class="las la-trash"></i>
																</a>
                            </td>
                        </tr>
                    @endif
                @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $subcategories->appends(request()->input())->links() }}
        </div>
    </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection
@section('script')
<script>
    function update_show(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('sub_categories_show') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Sub Categories Header Updated') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }
</script>
@endsection
