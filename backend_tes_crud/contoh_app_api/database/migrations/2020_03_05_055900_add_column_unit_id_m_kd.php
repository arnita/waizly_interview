<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnUnitIdMKd extends Migration
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
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');
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
