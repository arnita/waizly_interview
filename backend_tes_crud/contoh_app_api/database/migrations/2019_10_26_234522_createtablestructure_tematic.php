<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetablestructureTematic extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::create('structure_tematic_detail', function (Blueprint $table) {
            $table->bigIncrements('structure_tematic_detail_id');
            $table->unsignedBigInteger('structure_tematic_id')->nullable();
            $table->foreign('structure_tematic_id')->references('structure_tematic_id')->on('structure_tematic')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('total_question')->nullable();
            $table->integer('structure_tematic_detail_insert_by')->nullable();
            $table->datetime('structure_tematic_detail_insert_time')->nullable();
            $table->datetime('structure_tematic_detail_update_time')->nullable();   
            $table->integer('structure_tematic_detail_update_by')->nullable();
            $table->datetime('structure_tematic_detail_delete_time')->nullable();   
            $table->integer('structure_tematic_detail_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('structure_tematic_detail');
    }
}

