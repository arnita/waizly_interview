<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addcolumntahunajarantostudygroup extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('study_group_setting', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('unit_year_id')->nullable();
            $table->foreign('unit_year_id')->references('unit_year_id')->on('m_unit_year')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('study_group_setting', function (Blueprint $table) {
            //
        });
    }
}
