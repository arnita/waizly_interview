<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addcolumnsemesteronkkkm extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_kkm', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('step_study_id')->nullable();
            $table->foreign('step_study_id')->references('step_study_id')->on('m_step_study')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('course_id')->nullable();
            $table->foreign('course_id')->references('course_id')->on('m_course')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_kkm', function (Blueprint $table) {
            //
        });
    }
}
