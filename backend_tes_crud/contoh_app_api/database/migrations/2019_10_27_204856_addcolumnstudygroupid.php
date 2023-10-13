<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addcolumnstudygroupid extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('teacher_setting', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('study_group_id')->nullable();
            $table->foreign('study_group_id')->references('study_group_id')->on('m_study_group')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('teacher_setting', function (Blueprint $table) {
            //
        });
    }
}
