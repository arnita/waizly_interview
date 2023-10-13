<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TablelistQuestionPerKd extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('list_question_per_kd', function (Blueprint $table) {
            $table->bigIncrements('list_question_per_kd_id');
            $table->unsignedBigInteger('quiz_per_kd_id')->nullable();
            $table->foreign('quiz_per_kd_id')->references('quiz_per_kd_id')->on('quiz_per_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('number_question')->nullable();
            $table->string('quality_question')->nullable();
            $table->integer('list_question_per_kd_insert_by')->nullable();
            $table->datetime('list_question_per_kd_insert_time')->nullable();
            $table->datetime('list_question_per_kd_update_time')->nullable();   
            $table->integer('list_question_per_kd_update_by')->nullable();
            $table->datetime('list_question_per_kd_delete_time')->nullable();   
            $table->integer('list_question_per_kd_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('list_question_per_kd', function (Blueprint $table) {
            //
        });
    }
}
