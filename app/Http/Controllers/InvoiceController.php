<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use PDF;
use Auth;
use View;
use   App\ClubPoint;
use App\User;
use App\BusinessSetting;
class InvoiceController extends Controller
{
    //downloads customer invoice
    public function customer_invoice_download($id)
    {
        $order = Order::findOrFail($id);
        $pdf = PDF::setOptions([
                        'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                        'logOutputFile' => storage_path('logs/log.htm'),
                        'tempDir' => storage_path('logs/')
                    ])->loadView('backend.invoices.customer_invoice', compact('order'));
        return $pdf->download('order-'.$order->code.'.pdf');
    }

    //downloads seller invoice
    public function seller_invoice_download($id)
    {
        $order = Order::findOrFail($id);
        $pdf = PDF::setOptions([
                        'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                        'logOutputFile' => storage_path('logs/log.htm'),
                        'tempDir' => storage_path('logs/')
                    ])->loadView('backend.invoices.seller_invoice', compact('order'));
        return $pdf->download('order-'.$order->code.'.pdf');
    }
public function seller_invoice_print(Request $request){
   
    $order = Order::findOrFail($request['id']);
     $last_boint= ClubPoint::orderby('id','desc')->where('order_id',$order['id'])->first();
                  $user = User::findOrFail($order->user_id);
                   $club_point_convert_rate = BusinessSetting::where('type', 'club_point_convert_rate')->first()->value;
                $all_boint=$user['balance']*$club_point_convert_rate;
   
    $html = View::make('backend.invoices.print', compact('order','last_boint','all_boint'));
             $response = $html->render();
             return $response;
    
}
    //downloads admin invoice
    public function admin_invoice_download($id)
    {
        $order = Order::findOrFail($id);
        $pdf = PDF::setOptions([
                        'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                        'logOutputFile' => storage_path('logs/log.htm'),
                        'tempDir' => storage_path('logs/')
                    ])->loadView('backend.invoices.admin_invoice', compact('order'));
        return $pdf->download('order-'.$order->code.'.pdf');
    }
}
