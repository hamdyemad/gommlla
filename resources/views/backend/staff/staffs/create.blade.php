@extends('backend.layouts.app')

@section('content')

<div class="col-lg-6 mx-auto">
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Staff Information')}}</h5>
        </div>

        <form class="form-horizontal" action="{{ route('staffs.store') }}" method="POST" enctype="multipart/form-data">
        	@csrf
            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="name">{{translate('Name')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Name')}}" id="name" name="name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="email">{{translate('Email')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Email')}}" id="email" name="email" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="mobile">{{translate('Phone')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{translate('Phone')}}" id="mobile" name="mobile" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="password">{{translate('Password')}}</label>
                    <div class="col-sm-9">
                        <input type="password" placeholder="{{translate('Password')}}" id="password" name="password" class="form-control" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-from-label" for="name">{{translate('Role')}}</label>
                    <div class="col-sm-9">
                        <select name="role_id" required class="form-control aiz-selectpicker select_role">
                            @foreach($roles as $role)
                                <option value="{{$role->id}}">{{$role->getTranslation('name')}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                </div>
            </div>
        </form>

    </div>
</div>
@endsection


@section('script')

    <script>

        $('.select_role').on('change', function() {

            let amount_collaboration = `
                <div class="col amount_collaboration">
                    <label class="col-from-label" for="name">{{translate('amount')}}</label>
                    <div>
                        <input type="number" class="form-control" name="amount" value="12" min="1" max="12">
                    </div>
                </div>
            `;
            let amount_price_collaboration = `
                <div class="col amount_price_collaboration">
                    <label class="col-from-label" for="amount_price">{{translate('amount price')}}</label>
                    <div>
                        <input type="number" class="form-control" name="amount_price" value="1" min="1">
                    </div>
                </div>
            `;
            let price_collaboration = `
                <div class="col price_collaboration">
                    <label class="col-from-label" for="name">{{translate('percent of order price %')}}</label>
                    <div>
                        <input type="number" class="form-control" name="price_with_percent" value="1" min="1" max="50">
                    </div>
                </div>
            `;
            if($(this).val() !== '') {
                // 2 == 'seller id';
                if($(this).val() == 2) {
                    $(this).parent().parent().parent().after(`
                        <div class="form-group row collection_commission">
                            <div class="col-12">
                                <div class="row">
                                    <label class="col-3" for="name">{{translate('Collection Commission')}}</label>
                                    <div class="col-9">
                                        <select name="collection_commission" required class="form-control aiz-selectpicker collection_commission">
                                            <option value="amount">{{ translate('amount') }}</option>
                                            <option value="order">{{ translate('order') }}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            ${amount_collaboration}
                            ${amount_price_collaboration}
                        </div>
                    `);

                    $(".collection_commission").on('change', function() {
                        if($(this).val() !== '') {
                            if($(this).val() == 'order') {
                                $(".amount_collaboration").remove();
                                $(".amount_price_collaboration").remove();
                                $(this).parent().parent().after(`
                                    ${price_collaboration}
                                `);
                            } else {
                                $(".price_collaboration").remove();
                                $(this).parent().parent().parent().after(`
                                    ${amount_price_collaboration}
                                `);
                                $(this).parent().parent().parent().after(`
                                    ${amount_collaboration}
                                `);
                            }
                        }
                    });
                } else {
                    $(".collection_commission").remove();
                }
            }
        });
    </script>
@endsection
