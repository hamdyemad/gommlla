<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{

    protected $fillable = ['user_id', 'client_name','address' ,'zone','country_id','city_id','phone'];

    public function city() {
        return $this->belongsTo(Shipping::class, 'city_id');
    }


    public function country() {
        return $this->belongsTo(Country::class, 'country_id');
    }
}
