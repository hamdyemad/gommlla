<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    protected $fillable = ['status_name', 'default_status', 'payment_status', 'related_user'];

    public function user() {
        return $this->belongsTo(User::class, 'related_user');
    }
}
