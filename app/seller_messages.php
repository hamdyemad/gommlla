<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class seller_messages extends Model
{
    //
    protected $table = 'seller_messages';
    protected $fillable = ['product_id', 'name', 'phone','message'];

    public function product() {
        return $this->belongsTo(Product::class);
    }
}
