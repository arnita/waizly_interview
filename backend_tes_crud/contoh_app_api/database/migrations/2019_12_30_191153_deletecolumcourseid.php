<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Deletecolumcourseid extends Migration
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
            $table->dropColumn(['course_id']);
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
