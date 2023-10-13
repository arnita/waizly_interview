<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetableRaport extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('raport', function (Blueprint $table) {
            $table->bigIncrements('raport_id');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('total_pengetahuan')->nullable();
            $table->integer('total_keterampilan')->nullable();
            $table->string('predikat_pengetahuan')->nullable();
            $table->string('predikat_keterampilan')->nullable()
            ;$table->text('keterangan_pengetahuan')->nullable();
            $table->text('keterangan_keterampilan')->nullable();
            $table->integer('raport_insert_by')->nullable();
            $table->datetime('raport_insert_time')->nullable();
            $table->datetime('raport_update_time')->nullable();   
            $table->integer('raport_update_by')->nullable();
            $table->datetime('raport_delete_time')->nullable();   
            $table->integer('raport_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('raport');
    }
}
