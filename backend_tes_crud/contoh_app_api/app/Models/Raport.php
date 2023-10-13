<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Raport extends Model
{
    //
    protected $table = 'raport';
    protected $primaryKey = 'raport_id';
    protected $guarded = [];
    public $timestamps= false;

}
