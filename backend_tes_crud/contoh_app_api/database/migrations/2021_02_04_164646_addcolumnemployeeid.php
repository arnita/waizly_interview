<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addcolumnemployeeid extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('course_setting', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('employee_id')->nullable();
            $table->foreign('employee_id')->references('employee_id')->on('m_employee')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('course_setting', function (Blueprint $table) {
            //
        });
    }
}
