<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Addcolumnfloorid extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_class_room', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('floor_id')->nullable();
            $table->foreign('floor_id')->references('floor_id')->on('m_floor')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_class_room', function (Blueprint $table) {
            //
        });
    }
}
