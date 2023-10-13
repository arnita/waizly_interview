<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Createtabletahfizh extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tahfizh', function (Blueprint $table) {
            $table->bigIncrements('tahfizh_id');
            $table->string('tahfizh_type');
            $table->string('tahfizh_value');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('tahfizh_insert_by')->nullable();
            $table->datetime('tahfizh_insert_time')->nullable();
            $table->datetime('tahfizh_update_time')->nullable();   
            $table->integer('tahfizh_update_by')->nullable();
            $table->datetime('tahfizh_delete_time')->nullable();   
            $table->integer('tahfizh_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
