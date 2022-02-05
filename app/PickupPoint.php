<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class PickupPoint extends Model
{

    protected $fillable = [
        'user_id', 'orders_number','name', 'address', 'phone', 'pick_up_status_id', 'cash_on_pickup_status'
    ];
    public function getTranslation($field = '', $lang = false){
        $lang = $lang == false ? App::getLocale() : $lang;
        $pickup_point_translation = $this->hasMany(PickupPointTranslation::class)->where('lang', $lang)->first();
        return $pickup_point_translation != null ? $pickup_point_translation->$field : $this->$field;
    }

    public function pickup_point_translations(){
      return $this->hasMany(PickupPointTranslation::class);
    }

    public function staff(){
    	return $this->belongsTo(Staff::class);
    }
}
