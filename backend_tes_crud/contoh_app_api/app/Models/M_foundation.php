<?php
/*
    CREATED BY YUDIANA 
    03 Nov 2019 
    yud14n4@gmail.com
    sgc-jb2.com
*/
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class M_foundation extends Model
{
    // protected $connection = 'foundation';
    protected $table = 'institution';
    protected $primaryKey = 'institution_id';
    protected $guarded = [];
    public $timestamps= false;
}
