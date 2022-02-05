<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class expenses extends Model
{
    protected $guarded=[];
    public function category(){
        return$this->belongsTo(expense_category::class,'category_id');
    }
}
