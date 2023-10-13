<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStructureTematicsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('structure_tematic', function (Blueprint $table) {
            $table->bigIncrements('structure_tematic_id');
            $table->string('structure_tematic_name');
            $table->unsignedBigInteger('study_group_id')->nullable();
            $table->foreign('study_group_id')->references('study_group_id')->on('m_study_group')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->text('structure_tematic_desc')->nullable();
            $table->integer('structure_tematic_question')->nullable();
            $table->integer('structure_tematic_insert_by')->nullable();
            $table->datetime('structure_tematic_insert_time')->nullable();
            $table->datetime('structure_tematic_update_time')->nullable();   
            $table->integer('structure_tematic_update_by')->nullable();
            $table->datetime('structure_tematic_delete_time')->nullable();   
            $table->integer('structure_tematic_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('structure_tematic');
    }
}
