<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ResultHistory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('result_history_pts', function (Blueprint $table) {
            $table->increments('id_result_history_pts');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->string('course_name')->nullable();
            $table->integer('kkm')->nullable();
            $table->double('average')->nullable();
            $table->string('description')->nullable();
            $table->string('step_study')->nullable();
            $table->string('year_study')->nullable();
            $table->string('absen')->nullable();
            $table->string('permission')->nullable();
            $table->string('leave')->nullable();
            $table->string('behavior')->nullable();
            $table->string('craft')->nullable();
            $table->datetime('date_print')->nullable();
            $table->string('neatness')->nullable();
            $table->string('note')->nullable();
            $table->integer('result_history_pts_insert_by')->nullable();
            $table->datetime('result_history_pts_insert_time')->nullable();
            $table->datetime('result_history_pts_update_time')->nullable();   
            $table->integer('result_history_pts_update_by')->nullable();
            $table->datetime('result_history_pts_delete_time')->nullable();   
            $table->integer('result_history_pts_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('result_history_pts');
    }
}
