<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCreateQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('daily_quiz', function (Blueprint $table) {
            $table->bigIncrements('daily_quiz_id');
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('total_question')->nullable();
            $table->text('description')->nullable();
            $table->integer('daily_quiz_insert_by')->nullable();
            $table->datetime('daily_quiz_insert_time')->nullable();
            $table->datetime('daily_quiz_update_time')->nullable();   
            $table->integer('daily_quiz_update_by')->nullable();
            $table->datetime('daily_quiz_delete_time')->nullable();   
            $table->integer('daily_quiz_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('daily_quiz');
    }
}
