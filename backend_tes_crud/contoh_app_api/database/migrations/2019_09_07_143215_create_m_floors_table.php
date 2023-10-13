<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMFloorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_floor', function (Blueprint $table) {
            $table->bigIncrements('floor_id');
            $table->unsignedBigInteger('building_id')->nullable();
            $table->foreign('building_id')->references('building_id')->on('m_building')->onDelete('restrict')->onUpdate('restrict');
            $table->string('floor_name')->nullable();
            $table->string('floor_desc')->nullable();
            $table->integer('floor_insert_by')->nullable();
            $table->datetime('floor_insert_time')->nullable();
            $table->datetime('floor_update_time')->nullable();   
            $table->integer('floor_update_by')->nullable();
            $table->datetime('floor_delete_time')->nullable();   
            $table->integer('floor_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_floor');
    }
}
