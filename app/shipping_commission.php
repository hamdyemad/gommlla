<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class shipping_commission extends Model
{
    //

    protected $fillable = ['total_price', 'commission'];
}
