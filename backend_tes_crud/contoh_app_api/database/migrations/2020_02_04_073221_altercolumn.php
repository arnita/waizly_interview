<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Altercolumn extends Migration
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
            DB::statement('ALTER TABLE daily_exercise_skill RENAME COLUMN daily_exercise_id TO daily_exercise_skill_id;');
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
