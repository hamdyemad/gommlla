<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seller extends Model
{
  public function user(){
  	return $this->belongsTo(User::class);
  }

  public function orders_should_pay() {
      return $this->hasMany(orders_should_payments::class, 'seller_id');
  }


  public function payments(){
  	return $this->hasMany(Payment::class);
  }
}
