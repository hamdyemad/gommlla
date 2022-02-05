<?php

namespace App\Http\Controllers;

use App\Http\Requests\units\create;
use App\unit;
use Illuminate\Http\Request;

class UnitsController extends Controller
{
    public function index(){
        $this->authorize('1');
        $rows=unit::paginate(10);
        return view('backend.units.index',compact('rows'));
    }
    public function getUnits() {
        $this->authorize('1');
        $rows=unit::all();
        return response()->json($rows);
    }
    public function create(){
        $this->authorize('1');
        $units=unit::all();
        return view('backend.units.create',compact('units'));
    }
    public function store(create $request){
        $this->authorize('1');
        unit::create($request->all());
        flash(translate('Unit has been inserted successfully'))->success();
        return redirect()->route('units.index');

    }
    public  function edit($id){
        $this->authorize('1');
        $row=unit::find($id);
        $units=unit::all();
        return view('backend.units.edite',compact('row','units'));
    }
    public function update(create $request,$id){
        $this->authorize('1');
        $row=unit::find($id);
        $row->update($request->all()
        );
        flash(translate('unit has been Update successfully'))->success();
        return redirect()->route('units.index');
    }
    public function show($id){
        $this->authorize('1');
        $row=unit::where('id',$id)->delete();
        flash(translate('unit has been delete successfully'))->success();
        return redirect()->route('units.index');
    }
}
