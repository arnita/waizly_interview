<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Structure_tematic_detail extends Model
{
    //
   	protected $table = 'structure_tematic_detail';
    protected $primaryKey = 'structure_tematic_detail_id';
    protected $guarded = [];
    public $timestamps= false;

    public function structure_tematic()
    {
    	return $this->hasOne(\App\Models\Structure_tematic::class,'structure_tematic_id','structure_tematic_id');
    }
}
