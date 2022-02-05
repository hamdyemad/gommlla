<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'user_id', 'guest_id', 'city_id','name', 'email', 'address', 'zone', 'phone', 'payment_type', 'manual_payment', 'manual_payment_data', 'payment_status',
        'payment_details','grand_total', 'shipping','coupon_discount', 'code', 'date', 'employ_id', 'viewed','delivery_viewed',
        'payment_status_viewed', 'commission_calculated'
    ];
    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class);
    }

    public function city()  {
        return $this->belongsTo(Shipping::class);
    }

    public function refund_requests()
    {
        return $this->hasMany(RefundRequest::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function pickup_point()
    {
        return $this->belongsTo(PickupPoint::class);
    }
}
