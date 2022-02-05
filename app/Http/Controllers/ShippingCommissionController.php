<?php

namespace App\Http\Controllers;

use App\shipping_commission;
use Illuminate\Http\Request;

class ShippingCommissionController extends Controller
{
    //

    public function index() {
        $this->authorize('commissions');
        $shipping_commissions = shipping_commission::paginate(15);
        return view('backend.sales.shipping_commissions.index', compact('shipping_commissions'));
    }

    public function create() {
        return view('backend.sales.shipping_commissions.create');
    }

    public function store(Request $request) {
        $request->validate([
            'total_price' => 'required',
            'commission' => 'required'
        ]);
        shipping_commission::create([
            'total_price' => $request->total_price,
            'commission' => $request->commission
        ]);
        flash(translate('commission added successfully'))->success();
        return redirect()->back();
    }

    public function edit(shipping_commission $shipping_commission) {
        return view('backend.sales.shipping_commissions.edit', compact('shipping_commission'));
    }

    public function update(Request $request,shipping_commission $shipping_commission) {
        $request->validate([
            'total_price' => 'required',
            'commission' => 'required'
        ]);
        $shipping_commission->update([
            'total_price' => $request->total_price,
            'commission' => $request->commission
        ]);
        flash(translate('commission updated successfully'))->info();
        return redirect()->back();
    }

    public function destroy(shipping_commission $shipping_commission) {
        shipping_commission::destroy($shipping_commission->id);
        flash(translate('commission removed successfully'))->error();
        return redirect()->back();
    }
}
