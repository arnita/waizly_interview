<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addkdid extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('structure_tematic_detail', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('kd_id')->nullable();
            $table->foreign('kd_id')->references('kd_id')->on('m_kd')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('structure_tematic_detail', function (Blueprint $table) {
            //
        });
    }
}
