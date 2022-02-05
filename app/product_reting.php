<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class product_reting extends Model
{
     protected $table='product_reting';
    protected $fillable=['user_id','product_id','reting'] ;
    
    
}
