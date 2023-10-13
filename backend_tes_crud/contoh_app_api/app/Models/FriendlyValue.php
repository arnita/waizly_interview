<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FriendlyValue extends Model
{
    //

    protected $table = 'friendly_value';
    protected $primaryKey = 'friendly_value_id';
    protected $guarded = [];
    public $timestamps= false;
}
