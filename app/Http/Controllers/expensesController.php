<?php

namespace App\Http\Controllers;

use App\expense_category;
use App\expenses;
use App\Http\Requests\expense\create;
use Illuminate\Http\Request;

class expensesController extends Controller
{
    public function index(){
        $this->authorize('1');
        $rows=expenses::orderBy('id','desc')->paginate(10);
        return view('backend.expenses.index',compact('rows'));
    }
    public function create(){
        $this->authorize('1');
        $categories=expense_category::all();
        return view('backend.expenses.create',compact('categories'));
    }
    public function store(create $request){
        $this->authorize('1');
        expenses::create($request->all());
        flash(translate('expenses has been inserted successfully'))->success();
        return redirect()->route('expenses.index');
    }
    public function edit($id){
        $this->authorize('1');
        $row=expenses::find($id);
        $categories=expense_category::all();
        return view('backend.expenses.edite',compact('row','categories'));
    }
    public function update(create $request,$id){
        $this->authorize('1');
        $row=expenses::find($id);
        $row->update($request->all());
        flash(translate('expenses has been Update successfully'))->success();
        return redirect()->route('expenses.index');

    }
    public function show($id){
        $this->authorize('1');
        expenses::where('id',$id)->delete();
        flash(translate('expenses has been Delete successfully'))->success();
        return redirect()->route('expenses.index');
    }
}
