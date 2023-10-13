<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Editcolumnkdtype extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('daily_exercise', function (Blueprint $table) {
            //
            DB::statement('ALTER TABLE daily_exercise ALTER COLUMN kd_type TYPE varchar');

        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('daily_exercise', function (Blueprint $table) {
            //
        });
    }
}
