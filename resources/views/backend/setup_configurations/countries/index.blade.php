@extends('backend.layouts.app')

@section('content')

    <div class="card">
        <div class="card-header align-items-center">
            <div class="col">
                <h3 class="mb-0 h6">{{translate('Countries')}}</h3>
            </div>
            <div class="col">
                <div class="form-group">
                    <form action="{{ route('countries.index') }}" method="GET">
                        <input class="form-control" type="text" name="name" value="{{ request('name') }}" placeholder="{{ translate('Country Name') }}">
                    </form>
                </div>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th width="10%">#</th>
                        <th>{{translate('Name')}}</th>
                        <th>{{translate('Code')}}</th>
                        <th>{{translate('Show/Hide')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($countries as $key => $country)
                        <tr>
                            <td>{{ ($key+1) + ($countries->currentPage() - 1)*$countries->perPage() }}</td>
                            <td><a href="{{ route('countries.cities.index',  $country) }}">{{ $country->name }}</a></td>
                            <td>{{ $country->code }}</td>
                            <td>
                              <label class="aiz-switch aiz-switch-success mb-0">
                                <input onchange="update_status(this)" value="{{ $country->id }}" type="checkbox" <?php if($country->status == 1) echo "checked";?> >
                                <span class="slider round"></span>
                              </label>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $countries->links() }}
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">

        function update_status(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('countries.status') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Country status updated successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }

    </script>
@endsection
