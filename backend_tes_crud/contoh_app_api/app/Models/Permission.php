<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    //
    protected $table = 'permissions';
    protected $primaryKey = 'id';
    protected $guarded = [];


    public function menu()
    {
    	return $this->hasOne(Menu::class,'menu_id','menu_id');
    }

}
