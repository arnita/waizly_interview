<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AltercolumnraportPas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('teacher_note', function (Blueprint $table) {
            //
            DB::statement('ALTER TABLE teacher_note ALTER COLUMN raport_pas TYPE text');
            DB::statement('ALTER TABLE teacher_note ALTER COLUMN raport_pts TYPE text');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('teacher_note', function (Blueprint $table) {
            //
        });
    }
}
