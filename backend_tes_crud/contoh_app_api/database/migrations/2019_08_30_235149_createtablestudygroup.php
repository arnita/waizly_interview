<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createtablestudygroup extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_study_group', function (Blueprint $table) {
            $table->bigIncrements('study_group_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('class_grade_id')->nullable();
            $table->foreign('class_grade_id')->references('class_grade_id')->on('m_class_grade')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('class_room_id')->nullable();
            $table->foreign('class_room_id')->references('class_room_id')->on('m_class_room')->onDelete('restrict')->onUpdate('restrict');
            $table->string('study_group_status')->nullable();
            $table->string('study_group_name')->nullable();
            $table->text('study_group_desc')->nullable();
            $table->integer('study_group_insert_by')->nullable();
            $table->dateTime('study_group_insert_time')->nullable();
            $table->dateTime('study_group_update_time')->nullable();   
            $table->integer('study_group_update_by')->nullable();
            $table->dateTime('study_group_delete_time')->nullable();   
            $table->integer('study_group_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_study_group');
    }
}
