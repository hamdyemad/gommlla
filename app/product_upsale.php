<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class product_upsale extends Model
{
    protected $fillable = ['upsale_id','product_id','discount','discount_type'];
      
protected $table="product_upsale";
  
}
