<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Structure_tematic extends Model
{
	protected $table = 'structure_tematic';
    protected $primaryKey = 'structure_tematic_id';
    protected $guarded = [];
    public $timestamps= false;

    public function study_group()
    {
    	return $this->hasOne(M_study_group::class,'study_group_id','study_group_id');
    }

    public function class_grade()
    {
    	return $this->hasOne(M_class_grade::class,'class_grade_id','class_grade_id');
    }


    public function structure_tematic_detail()
    {
    	return $this->hasOne(Structure_tematic_detail::class,'structure_tematic_id','structure_tematic_id');
    }
}
