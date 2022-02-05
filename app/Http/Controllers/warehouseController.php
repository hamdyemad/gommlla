<?php

namespace App\Http\Controllers;

use App\Warehouse;
use Illuminate\Http\Request;

class warehouseController extends Controller
{

    public function __construct()
    {

    }
    public function index(){
        $this->authorize('1');
        $rows=Warehouse::paginate(10);
        return view('backend.warehouses.index',compact('rows'));
    }
    public function create(){
        $this->authorize('1');
        return view('backend.warehouses.create');
    }
    public function store(Request $request){
        $this->authorize('1');
        Warehouse::create($request->all());
        flash(translate('warehouses has been inserted successfully'))->success();
        return redirect()->route('warehouses.index');
    }
    public function edit($id){
        $this->authorize('1');
        $row=Warehouse::find($id);
        return view('backend.warehouses.edite',compact('row'));
    }
    public function update(Request $request,$id){
        $this->authorize('1');
        $row=Warehouse::find($id);
        $row->update($request->all());
        flash(translate('warehouses has been Update successfully'))->success();
        return redirect()->route('warehouses.index');

    }
    public function show($id){
        $this->authorize('1');
        Warehouse::where('id',$id)->delete();
        flash(translate('warehouses has been Delete successfully'))->success();
        return redirect()->route('warehouses.index');
    }

}
