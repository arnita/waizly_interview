<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createtableclassroom extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_class_room', function (Blueprint $table) {
            $table->bigIncrements('class_room_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');    
            $table->string('class_room_name')->nullable();
            $table->text('class_room_text')->nullable();
            $table->string('class_room_status')->nullable();
            $table->text('class_room_desc')->nullable();
            $table->integer('class_room_insert_by')->nullable();
            $table->dateTime('class_room_insert_time')->nullable();
            $table->dateTime('class_room_update_time')->nullable();   
            $table->integer('class_room_update_by')->nullable();
            $table->dateTime('class_room_delete_time')->nullable();   
            $table->integer('class_room_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_class_room');
    }
}
