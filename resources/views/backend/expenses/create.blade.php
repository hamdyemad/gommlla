@extends('backend.layouts.app')

@section('content')

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h6">{{translate('Add New Expense')}}</h5>
    </div>

    <div class="col-lg-6 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('Expense Information')}}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('expenses.store') }}" method="POST">
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
                        <label class="col-sm-3 col-from-label" for="name">{{translate('category')}}</label>
                        <div class="col-sm-9">
                            <select class="form-control aiz-selectpicker" name="category_id" id="category_id">
                                <option value="">{{translate("select option")}}</option>
                                @foreach($categories as $category)

                                    <option value="{{$category['id']}}">{{$category['name']}}</option>
                                @endforeach

                            </select>
                            @error('category_id')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>



                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('amount')}}</label>
                        <div class="col-sm-9">
                            <input type="number" value="{{old('amount')}}" min="1"step=".1" placeholder="{{translate('amount')}}" id="amount"
                                   name="amount" class="form-control" required>
                            @error('amount')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('notes')}}</label>
                        <div class="col-sm-9">
                            <input type="text" value="{{old('notes')}}" placeholder="{{translate('notes')}}"
                                   id="notes" name="notes" class="form-control" >
                            @error('notes')

                            <h5 style="color:#f92d00">{{$message}}</h5>
                            @enderror
                        </div>
                    </div>

                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-primary">{{translate('Save')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection
