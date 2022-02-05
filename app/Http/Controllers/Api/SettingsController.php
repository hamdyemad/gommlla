<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\SettingsCollection;
use App\Models\AppSettings;
use App\Page;

class SettingsController extends Controller
{
    public function index()
    {
        return new SettingsCollection(AppSettings::all());
    }
    public function getpages(){
        $rows=Page::all();
        foreach($rows as $row){
            $row['content']=strip_tags($row['content']);
            
            	if($row->type == 'home_page'){
							  $row['slug']=	 route('home') ;
            	}
							else{
								  $row['slug']=route('home') .'/'. $row->slug; 
							}
             }
        return response()->json([
          'data' => $rows,
            'success' => true,
            
            'status' => 200
        ]); 
    }
}
