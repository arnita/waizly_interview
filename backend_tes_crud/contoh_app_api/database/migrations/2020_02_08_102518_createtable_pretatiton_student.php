<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetablePretatitonStudent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prestation', function (Blueprint $table) {
            $table->bigIncrements('prestation_id');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->string('type')->nullable();
            $table->string('value')->nullable();
            $table->string('desc')->nullable();
            $table->integer('prestation_insert_by')->nullable();
            $table->datetime('prestation_insert_time')->nullable();
            $table->datetime('prestation_update_time')->nullable();   
            $table->integer('prestation_update_by')->nullable();
            $table->datetime('prestation_delete_time')->nullable();   
            $table->integer('prestation_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('prestation_student');
    }
}
