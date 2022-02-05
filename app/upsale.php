<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class upsale extends Model
{
    protected $fillable = ['product_id','number'];
      
protected $table="upsale_product";
public function upsale(){
    return $this->belongsToMany(Product::class,'product_upsale','upsale_id','product_id')->withPivot('discount','discount_type','id');
    
}
  
}
