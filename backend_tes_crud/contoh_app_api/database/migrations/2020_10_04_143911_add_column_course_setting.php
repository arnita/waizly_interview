<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnCourseSetting extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_kd', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('course_setting_id')->nullable();
            $table->foreign('course_setting_id')->references('course_setting_id')->on('course_setting')->onDelete('restrict')->onUpdate('restrict');    
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_kd', function (Blueprint $table) {
            //
        });
    }
}
