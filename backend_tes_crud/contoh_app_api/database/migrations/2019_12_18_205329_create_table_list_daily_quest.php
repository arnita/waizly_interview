<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableListDailyQuest extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('list_daily_question', function (Blueprint $table) {
            $table->bigIncrements('list_daily_question_id');
            $table->unsignedBigInteger('daily_quiz_id')->nullable();
            $table->foreign('daily_quiz_id')->references('daily_quiz_id')->on('daily_quiz')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('number_question')->nullable();
            $table->string('quality_question')->nullable();
            $table->integer('list_daily_question_insert_by')->nullable();
            $table->datetime('list_daily_question_insert_time')->nullable();
            $table->datetime('list_daily_question_update_time')->nullable();   
            $table->integer('list_daily_question_update_by')->nullable();
            $table->datetime('list_daily_question_delete_time')->nullable();   
            $table->integer('list_daily_question_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_list_daily_quest');
    }
}
