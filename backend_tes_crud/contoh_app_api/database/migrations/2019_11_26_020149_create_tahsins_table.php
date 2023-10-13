<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTahsinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tahsin', function (Blueprint $table) {
            $table->bigIncrements('tahsin_id');
            $table->string('tahsin_type');
            $table->string('tahsin_value');
            $table->unsignedBigInteger('student_id')->nullable();
            $table->foreign('student_id')->references('student_id')->on('m_student')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->integer('tahsin_insert_by')->nullable();
            $table->datetime('tahsin_insert_time')->nullable();
            $table->datetime('tahsin_update_time')->nullable();   
            $table->integer('tahsin_update_by')->nullable();
            $table->datetime('tahsin_delete_time')->nullable();   
            $table->integer('tahsin_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tahsin');
    }
}
