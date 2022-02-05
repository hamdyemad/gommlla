<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\BannerCollection;
use App\Models\Banner;

class BannerController extends Controller
{

    public function index()
    {
        return new BannerCollection(Banner::all());
    }
    public function banner2(){
        $data=json_decode(get_setting('home_banner2_images'));
       foreach($data as$key=> $row )
       {
          $data[$key]=api_asset($row); 
       }
       return [
           'data'=>$data,
            'success' => true,
            'status' => 200
        ];
    }
}
