<?php

namespace App\Http\Controllers;

use App\expense_category;
use App\Http\Requests\expense_categories\create;
use Illuminate\Http\Request;

class expense_categoriesController extends Controller
{
    public function index(){
        $this->authorize('1');
        $rows=expense_category::paginate(10);
        return view('backend.expense_categories.index',compact('rows'));
    }
    public function create(){
        $this->authorize('1');
        return view('backend.expense_categories.create');
    }
    public function store(create $request){
        $this->authorize('1');
        expense_category::create($request->all());
        flash(translate('expense category has been inserted successfully'))->success();
        return redirect()->route('expense_categories.index');
    }
    public function edit($id){
        $this->authorize('1');
        $row=expense_category::find($id);
        return view('backend.expense_categories.edite',compact('row'));
    }
    public function update(create $request,$id){
        $this->authorize('1');
        $row=expense_category::find($id);
        $row->update($request->all());
        flash(translate('expense category has been update successfully'))->success();
        return redirect()->route('expense_categories.index');
    }
    public function show($id){
        $this->authorize('1');
        $row=expense_category::where('id',$id)->delete();
        flash(translate('expense category has been delete successfully'))->success();
        return redirect()->route('expense_categories.index');
    }
}
