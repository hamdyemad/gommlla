<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Distribution extends Model
{
    //

    protected $fillable = ['city_id', 'user_id'];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function city() {
        return $this->belongsTo(Shipping::class, 'city_id');
    }
}
