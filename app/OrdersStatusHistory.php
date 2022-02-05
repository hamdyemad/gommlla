<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrdersStatusHistory extends Model
{
    //
    protected $table = 'orders_status_history';
    protected $fillable = [
        'status_id', 'order_id', 'notes'
    ];


    public function status() {
        return $this->belongsTo(Status::class, 'status_id');
    }
}
