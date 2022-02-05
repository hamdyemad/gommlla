<?php

namespace App\Http\Controllers;

use App\Staff;
use App\Status;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StatusController extends Controller
{
    //

    public function index() {

        if(Auth::user()->user_type == 'admin' || in_array('s', json_decode(Auth::user()->staff->role->permissions))) {
            $statuses = Status::where('default_status', 0)
            ->whereNotIn('status_name', ['معلق', 'غير مدفوع','تم الدفع'])->latest()->paginate(10);
            return view('backend.sales.statuses.index', compact('statuses'));
        } else {
            return redirect()->back();
        }
    }

    public function create() {
        $staffs = Staff::whereHas('role', function($query) {
            return $query->where('name', 'shipping');
        })->get();
        return view('backend.sales.statuses.create', compact('staffs'));
    }

    public function store(Request $request) {
        $request->validate([
            'status_name' => 'required'
        ]);
        Status::create([
            'status_name' => $request->status_name,
            'related_user' => $request->related_user
        ]);
        flash(translate('Status Has Been Added Successfully'))->success();
        return redirect()->back();
    }

    public function edit(Status $status) {
        return view('backend.sales.statuses.edit', compact('status'));
    }

    public function update(Request $request, Status $status) {
        $request->validate([
            'status_name' => 'required',
            'payment_status' => 'required'
        ]);
        $status->update([
            'status_name' => $request->status_name,
            'payment_status' => $request->payment_status
        ]);
        flash(translate('Status Has Been Updated Successfully'))->info();
        return redirect()->back();
    }
}
