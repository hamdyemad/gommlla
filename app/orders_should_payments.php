<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class orders_should_payments extends Model
{
    //

    protected $table = 'orders_should_payments';
    protected $fillable = ['user_id','seller_id', 'order_id', 'amount', 'paid'];

    public function order_detail() {
        return $this->belongsTo(OrderDetail::class, 'order_id');
    }
}
