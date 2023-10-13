<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_student', function (Blueprint $table) {
            $table->bigIncrements('student_id');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('unit_id')->on('m_unit')->onDelete('restrict')->onUpdate('restrict');    
            $table->unsignedBigInteger('class_grade_id')->nullable();
            $table->foreign('class_grade_id')->references('class_grade_id')->on('m_class_grade')->onDelete('restrict')->onUpdate('restrict');    
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('restrict')->onUpdate('restrict');    
            $table->string('student_name')->nullable();
            $table->string('student_id_card')->nullable();
            $table->string('student_status')->nullable();
            $table->string('student_nickname')->nullable();
            $table->string('student_gender')->nullable();
            $table->string('student_birth_place')->nullable();
            $table->date('student_birth_date')->nullable();
            $table->text('student_address')->nullable();
            $table->string('student_hp')->nullable();
            $table->string('student_telp')->nullable();
            $table->string('student_email')->nullable();
            $table->string('student_father_hp')->nullable();
            $table->string('student_mother_hp')->nullable();
            $table->integer('student_child_to')->nullable();
            $table->integer('student_brother')->nullable();
            $table->string('student_child_status')->nullable();
            $table->string('student_photo')->nullable();
            $table->string('student_hobby')->nullable();
            $table->string('student_orphan_status')->nullable();
            $table->string('student_school_origin')->nullable();
            $table->string('student_school_origin_address')->nullable();
            $table->string('student_nisn')->nullable();
            $table->string('student_test_number')->nullable();
            $table->string('student_achievement')->nullable();
            $table->string('student_tall')->nullable();
            $table->string('student_weight')->nullable();
            $table->string('student_blood_type')->nullable();
            $table->string('student_religion')->nullable();
            $table->string('student_kk')->nullable();
            $table->string('student_ktp')->nullable();
            $table->string('student_ijazah')->nullable();
            $table->string('student_mother_name')->nullable();
            $table->string('student_father_name')->nullable();
            $table->string('student_mother_job')->nullable();
            $table->string('student_father_job')->nullable();
            $table->string('student_father_income')->nullable();
            $table->string('student_mother_income')->nullable();
            $table->integer('student_insert_by')->nullable();
            $table->dateTime('student_insert_time')->nullable();
            $table->dateTime('student_update_time')->nullable();   
            $table->integer('student_update_by')->nullable();
            $table->dateTime('student_delete_time')->nullable();   
            $table->integer('student_delete_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_student');
    }
}
