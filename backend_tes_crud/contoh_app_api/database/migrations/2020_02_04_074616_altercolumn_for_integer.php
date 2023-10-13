<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AltercolumnForInteger extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('daily_exercise_skill', function (Blueprint $table) {
            //
            DB::statement('ALTER TABLE daily_exercise_skill ALTER COLUMN skill_type TYPE varchar');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('daily_exercise_skill', function (Blueprint $table) {
            //
        });
    }
}
