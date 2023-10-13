<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditDateOnBirthdayEmp extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_employee', function (Blueprint $table) {
            //
            DB::statement('ALTER TABLE m_employee ALTER COLUMN employee_birth_date TYPE date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_employee', function (Blueprint $table) {
            //
        });
    }
}
