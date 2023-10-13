<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateObservasisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('observasi', function (Blueprint $table) {
            $table->BigIncrements('observasi_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->string('observasi_type')->nullable();
            $table->string('observasi_category')->nullable();
            $table->enum('observasi_value',['SB','PB'])->nullable();
            $table->integer('observasi_insert_by')->nullable();
            $table->datetime('observasi_insert_time')->nullable();
            $table->datetime('observasi_update_time')->nullable();   
            $table->integer('observasi_update_by')->nullable();
            $table->datetime('observasi_delete_time')->nullable();   
            $table->integer('observasi_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('observasi');
    }
}
