<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_study_group extends Model
{
    //

     //
     protected $table = 'm_study_group';
     protected $primaryKey = 'study_group_id';
     protected $guarded = [];
     public $timestamps= false;
 
     public function unit()
     {
         return $this->hasOne(M_unit::class,'unit_id','unit_id');
     }
 
 
     public function class_grade()
     {
         return $this->hasOne(M_class_grade::class,'class_grade_id','class_grade_id');
     }
 
     public function class_room()
     {
         return $this->hasOne(M_class_room::class,'class_room_id','class_room_id');
     }
}
