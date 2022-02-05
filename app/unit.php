<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class unit extends Model
{
    protected $guarded=[];
    public function parent(){
        return $this->belongsTo(unit::class,'top');
    }
}
