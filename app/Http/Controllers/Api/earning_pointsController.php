<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\ClubPoint;
use App\BusinessSetting;
use App\Models\Brand;
use Carbon;
use App\Wallet;
use App\User;
class earning_pointsController extends Controller
{
    public function index(Request $request){
         $club_points = ClubPoint::where('user_id',$request['user_id'])->latest()->get();
         foreach($club_points as $row){
            if($row['convert_status']==1) {
                $row['convert_status']='Yes';
                $row['convert']='Don';
            }else{
                  $no_of_max_day = BusinessSetting::where('type', 'refund_request_time')->first()->value;
                                            $last_refund_date = $row->created_at->addDays($no_of_max_day);
                                            $today_date = Carbon\Carbon::now();
                   $row['convert_status']='No';
                   if($today_date <= $last_refund_date){
                       
                         $row['convert']= "يمكنك التحويل بعد"
                                          .  intval( (strtotime($last_refund_date)- (strtotime($today_date)))/(60 * 60 * 24))."يوم: ".intval((((strtotime($last_refund_date)- (strtotime($today_date)))%(60 * 60 * 24))/(24*360)))."ساعة";
                                                   
                   }else{
                        $row['convert']='convert New';
                   }
            }
         }
       return response()->json([
          'data' => $club_points,
            'success' => true,
            
            'status' => 200
        ]);
    }
     public function convert_point_into_wallet(Request $request)
    {
        $club_point_convert_rate = BusinessSetting::where('type', 'club_point_convert_rate')->first()->value;
        $club_point = ClubPoint::findOrFail($request->ClubPoint_id);
        $wallet = new Wallet;
        $wallet->user_id = $request['user_id'];
        $wallet->amount = floatval($club_point->points / $club_point_convert_rate);
        $wallet->payment_method = 'Club Point Convert';
        $wallet->payment_details = 'Club Point Convert';
        $wallet->save();
        $user = User::findOrFail( $request['user_id']);
        $user->balance = $user->balance + floatval($club_point->points / $club_point_convert_rate);
        $user->save();
        $club_point->convert_status = 1;
        if ($club_point->save()) {
          return response()->json([
          'message' =>'تمت عمليت تحويل النقط الي فلوس بنجاح' ,
            'success' => true,
            
            'status' => 200
        ]);
        }
        else {
              return response()->json([
          'message' =>'هناك خطاء ما المحاولة مرة اخري' ,
            'success' => false,
            
            'status' => 200
        ]);
        }
    }

}
