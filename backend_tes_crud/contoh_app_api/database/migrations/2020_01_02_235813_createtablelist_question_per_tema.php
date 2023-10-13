<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatetablelistQuestionPerTema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('list_question_per_tema', function (Blueprint $table) {
            $table->bigIncrements('list_question_per_tema_id');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('number_question')->nullable();
            $table->string('quality_question')->nullable();
            $table->string('type_question')->nullable();
            $table->integer('list_question_per_tema_insert_by')->nullable();
            $table->datetime('list_question_per_tema_insert_time')->nullable();
            $table->datetime('list_question_per_tema_update_time')->nullable();   
            $table->integer('list_question_per_tema_update_by')->nullable();
            $table->datetime('list_question_per_tema_delete_time')->nullable();   
            $table->integer('list_question_per_tema_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('list_question_per_tema');
    }
}
