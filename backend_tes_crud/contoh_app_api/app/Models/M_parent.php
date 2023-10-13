<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_parent extends Model
{
    //

    protected $table = 'm_parent';
    protected $primaryKey = 'parent_id';
    protected $guarded = [];
    public $timestamps= false;
}
