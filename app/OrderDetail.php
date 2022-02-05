<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{

    protected $fillable = [
        'id','order_id','employ_id','seller_id','product_id','variation','sizes','price','tax','shipping_cost',
        'quantity','payment_status','delivery_status','delivery_id','delivery_reason',
        'admin_status','admin_reason','seller_status', 'seller_reason','shipping_type','pickup_point_id','product_referral_code',
        'refundable'
    ];
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function unit() {
        return $this->belongsTo(unit::class, 'unit_id');
    }

    public function delivery() {
        return $this->belongsTo(User::class, 'delivery_id');
    }

    public function user() {
        return $this->belongsTo(User::class, 'seller_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function pickup_point()
    {
        return $this->belongsTo(PickupPoint::class);
    }

    public function refund_request()
    {
        return $this->hasOne(RefundRequest::class);
    }
}
