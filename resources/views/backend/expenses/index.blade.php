@extends('backend.layouts.app')

@section('content')

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="h3">{{translate('expenses')}}</h1>
            </div>
            <div class="col-md-6 text-md-right">
                <a href="{{ route('expenses.create') }}" class="btn btn-circle btn-info">
                    <span>{{translate('Add New expense')}}</span>
                </a>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('expenses')}}</h5>
        </div>
        <div class="card-body">
            <table class="table aiz-table">
                <thead>
                <tr>
                    <th width="10%">#</th>
                    <th>{{translate('date')}}</th>
                    <th>{{translate('category')}}</th>
                    <th>{{translate('amount')}}</th>
                    <th>{{translate('notes')}}</th>


                    <th width="10%">{{translate('Options')}}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($rows as $key => $role)
                    <tr>
                        <td>{{ ($key+1) + ($rows->currentPage() - 1)*$rows->perPage() }}</td>
                        <td>{{ $role['date']}}</td>
                        <td>{{ $role['amount']}}</td>
                        <td>{{ $role['category']['name']}}</td>
                        <td>{{ $role['notes']}}</td>

                        <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('expenses.edit', $role->id )}}" title="{{ translate('Edit') }}">
                                <i class="las la-edit"></i>
                            </a>
                            <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('expenses.destroy', $role->id)}}" title="{{ translate('Delete') }}">
                                <i class="las la-trash"></i>
                            </a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $rows->appends(request()->input())->links() }}
            </div>
        </div>
    </div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection
