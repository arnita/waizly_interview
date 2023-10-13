<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMStepStudiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_step_study', function (Blueprint $table) {
            $table->bigIncrements('step_study_id');
            $table->unsignedBigInteger('unit_year_id')->nullable();
            $table->foreign('unit_year_id')->references('unit_year_id')->on('m_unit_year')->onDelete('restrict')->onUpdate('restrict');
            $table->string('step_study_name')->nullable();
            $table->text('step_study_desc')->nullable();
            $table->date('step_study_start')->nullable();
            $table->date('step_study_end')->nullable();
            $table->string('step_study_status')->nullable();
            $table->date('date_pts')->nullable();
            $table->date('date_pas')->nullable();
            $table->integer('step_study_insert_by')->nullable();
            $table->dateTime('step_study_insert_time')->nullable();
            $table->dateTime('step_study_update_time')->nullable();   
            $table->integer('step_study_update_by')->nullable();
            $table->dateTime('step_study_delete_time')->nullable();   
            $table->integer('step_study_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_step_study');
    }
}
