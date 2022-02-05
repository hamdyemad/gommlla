<?php

namespace App\Http\Controllers;

use App\Product;
use App\Purchase;
use App\Supplier;
use App\Warehouse;
use Illuminate\Http\Request;

class purchasesController extends Controller
{
    public function  index(){
        $rows=Purchase::orderby('id','desc')->get();
        return view('backend.purchases.index',compact('rows'));
    }
    public  function create(){
        $suppliers=Supplier::all();
        $Warehouses=Warehouse::all();
        return view('backend.purchases.create',compact('suppliers','Warehouses'));
    }
    public function get_product(Request $request){
        $rows=Product::where('name','like','%'.$request['name'].'%')
            ->orwhere('barcode','like','%'.$request['name'].'%')->get();
        return $rows;

    }
    public function add_product_to_purchase(Request $request){
        $row=Product::where('id',$request['id'])->first();
        return $row;
    }
}
