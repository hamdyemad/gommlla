<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class wallet_history extends Model
{
    protected $table = 'wallet_history';
    protected $fillable = ['user_id', 'order_id', 'amount'];
}
