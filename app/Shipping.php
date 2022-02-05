<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    protected $fillable = ['id', 'country_id', 'city', 'cost', 'free_mode'];

    public function country() {
        return $this->belongsTo(Country::class, 'country_id');
    }
}
