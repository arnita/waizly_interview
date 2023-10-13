<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMBuildingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_building', function (Blueprint $table) {
            $table->bigIncrements('building_id');
            $table->string('building_name')->nullable();
            $table->string('building_desc')->nullable();
            $table->string('building_status')->nullable();
            $table->integer('building_insert_by')->nullable();
            $table->datetime('building_insert_time')->nullable();
            $table->datetime('building_update_time')->nullable();   
            $table->integer('building_update_by')->nullable();
            $table->datetime('building_delete_time')->nullable();   
            $table->integer('building_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_building');
    }
}
