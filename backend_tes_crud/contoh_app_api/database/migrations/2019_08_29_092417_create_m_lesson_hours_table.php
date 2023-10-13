<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMLessonHoursTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_lesson_hour', function (Blueprint $table) {
            $table->bigIncrements('lesson_hour_id');
            $table->string('lesson_day')->nullable();
            $table->integer('hour_to')->nullable();
            $table->string('lesson_hour_type')->nullable();
            $table->time('lesson_hour_start')->nullable();
            $table->time('lesson_hour_end')->nullable();
            $table->text('lesson_hour_desc')->nullable();
            $table->string('lesson_hour_status')->nullable();
            $table->integer('lesson_hour_insert_by')->nullable();
            $table->dateTime('lesson_hour_insert_time')->nullable();
            $table->dateTime('lesson_hour_update_time')->nullable();   
            $table->integer('lesson_hour_update_by')->nullable();
            $table->dateTime('lesson_hour_delete_time')->nullable();   
            $table->integer('lesson_hour_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_lesson_hour');
    }
}
