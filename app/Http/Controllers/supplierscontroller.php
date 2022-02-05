<?php

namespace App\Http\Controllers;

use App\Http\Requests\supplier\create;
use App\Supplier;
use Illuminate\Http\Request;

class supplierscontroller extends Controller
{
    public function __construct()
    {

    }
    public function index(){
        $this->authorize('1');
        $rows=Supplier::paginate(10);
        return view('backend.suppliers.index',compact('rows'));
    }
    public function create(){
        $this->authorize('1');
        return view('backend.suppliers.create');
    }
    public function store(create $request){
        $this->authorize('1');
        $row=Supplier::create($request->except(['_token']));
        flash(translate('Supplier has been inserted successfully'))->success();
        return redirect()->route('suppliers.index');

    }
    public  function edit($id){
        $this->authorize('1');
        $row=Supplier::find($id);

        return view('backend.suppliers.edite',compact('row'));
    }
    public function update(create $request,$id){
        $this->authorize('1');
        $row=Supplier::find($id);
        $row->update($request->all()
        );
        flash(translate('Supplier has been Update successfully'))->success();
        return redirect()->route('suppliers.index');
    }
    public function show($id){
        $this->authorize('1');
        $row=Supplier::where('id',$id)->delete();
        flash(translate('Supplier has been delete successfully'))->success();
        return redirect()->route('suppliers.index');
    }
}
