<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::post('/login','Auth\LoginController@login');


Route::group([

    'middleware' => 'api',
    'prefix' => 'auth',
    'namespace'=>'API',

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});


Route::group(['namespace' => 'API','middleware'=>'check-token'], function(){

    /* for route crud */
    Route::resource('/unit','UnitController',['except'=>'show','store']);
    Route::resource('/unit_year','UnitYearController',['except'=>'show','store']);
    Route::resource('/step_study','StepStudyController',['except'=>'show','store']);
    Route::resource('/class_grade','ClassGradeController',['except'=>'show','store']);
    Route::resource('/lesson_hour','LessonHourController',['except'=>'show','store']);
    Route::resource('/course','CourseController',['except'=>'show','store']);
    Route::resource('/study_group','StudyGroupController',['except'=>'show','store']);
    Route::resource('/class_room','ClassRoomController',['except'=>'show','store']);
    Route::resource('/student','StudentController',['except'=>'show','store']);
    Route::resource('/kkm','KKMController',['except'=>'show','store']);
    Route::resource('/kd','KDController',['except'=>'show','store']);
    Route::resource('/employee','EmployeeController',['except'=>'show','store']);
    Route::post('/change_pass_emp','EmployeeController@change_pass_emp');
    Route::resource('/study_group_setting','StudyGroupSettingController',['except'=>'show','store']);
    Route::resource('/kd_detail','KDDetailController',['except'=>'show','store']);
    Route::resource('/course_setting','CourseSettingController',['except'=>'show','store']);
    Route::resource('/teacher_setting','TeacherSettingController',['except'=>'show','store']);
    Route::resource('/class_advisor','ClassAdvisorController',['except'=>'show','store']);
    Route::resource('/menu','MenuController',['except'=>'show','store']);
    Route::resource('/role','RoleController',['except'=>'show','store']);
    Route::resource('/permission','PermissionController',['except'=>'show','store']);
    Route::resource('/structure_tematic','StructureTematicController',['except'=>'show','store']);
    Route::resource('/structure_tematic_detail','StructureTematicDetailController',['except'=>'show','store']);
    Route::resource('/daily_exercise','DailyExerciseController',['except'=>'show','store']);
    Route::resource('/absensi','AbsensiController',['except'=>'show','store']);
    Route::resource('/physical_student','PhysicalStudentController',['except'=>'show','store']);
    Route::resource('/extracurricular','ExtracurricularController',['except'=>'show','store']);
    Route::resource('/observasi','ObservasiController',['except'=>'show','store']);
    Route::resource('/pd','PDController',['except'=>'show','store']);
    Route::resource('/friendly_value','FriendlyValueController',['except'=>'show','store']);
    Route::resource('/teacher_note','TeacherNoteController',['except'=>'show','store']);
    Route::resource('/tahsin','TahsinController',['except'=>'show','store']);
    Route::resource('/tahfizh','TahfizhController',['except'=>'show','store']);
    Route::resource('/personality','PersonalityController',['except'=>'show','store']);
    Route::resource('/raport','RaportController',['except'=>'show','store']);
    Route::resource('/quiz_per_kd','QuizPerKd',['except'=>'show','store']);
    Route::resource('/input_analysis','InputAnalysisController',['except'=>'show','store']);
    Route::post('/input_analysis_kd_uts','InputAnalysisController@input_analysis_kd_uts');
    Route::post('/input_analysis_kd_uas','InputAnalysisController@input_analysis_kd_uas');
    //add by yudiana
    Route::resource('/foundation','FoundationController',['except'=>'show','store']);
    //end
    /** end route crud */

    Route::get('/change_status','UnitYearController@change_status');
    Route::get('/change_status_step','StepStudyController@change_status');
    Route::get('/get_unit','AppController@get_unit');
    Route::get('/get_unit_year','AppController@get_unit_year');
    Route::get('/get_step_study','AppController@get_step_study');
    Route::get('/get_class_grade','AppController@get_class_grade');
    Route::get('/get_class_grade_all','AppController@get_class_grade_all');
    Route::get('/get_class_room','AppController@get_class_room');
    Route::get('/get_class_room_all','AppController@get_class_room_all');
    Route::get('/gender','AppController@gender');
    Route::get('/religion','AppController@religion');
    Route::get('/get_course','AppController@get_course');
    Route::get('/get_study_group','AppController@get_study_group');
    Route::get('/get_student_by_class','AppController@get_student_by_class');
    Route::get('/get_step_study_active','AppController@get_step_study_active');
    Route::get('/get_data_kd','AppController@get_data_kd');
    Route::get('/get_course_by_class','AppController@get_course_by_class');
    Route::get('/get_employee_setting','AppController@get_employee_setting');
    Route::get('/get_course_study_group','AppController@get_course_study_group');
    Route::get('/get_class_advisor','AppController@get_class_advisor');
    Route::get('/get_employee_advisor','AppController@get_employee_advisor');
    Route::get('/get_menu_parent','AppController@get_menu_parent');
    Route::get('/get_menu','AppController@get_menu');
    Route::get('/get_selected','RoleController@get_selected');
    Route::get('/role_setting','RoleController@role_setting');
    Route::post('/save_role_permission','RoleController@save_role_permission');
    Route::get('/get_tematic_active','AppController@get_tematic_active');
    Route::get('/get_course_by_id','AppController@get_course_by_id');
    Route::get('/get_course_by_study_group','AppController@get_course_by_study_group');
    Route::get('/get_all_kd','AppController@get_all_kd');
    Route::get('/get_tematic_group','AppController@get_tematic_group');
    Route::get('/get_value','DailyExerciseController@get_value');
    Route::get('/get_value_absensi','AbsensiController@get_value_absensi');
    Route::get('/get_value_sum_absensi','AbsensiController@get_value_sum_absensi');
    Route::get('/get_value_avg_score','AbsensiController@get_value_avg_score');
    Route::get('/get_value_physical_fisik','PhysicalStudentController@get_value_physical_fisik');
    Route::get('/get_value_physical_kes','PhysicalStudentController@get_value_physical_kes');
    Route::get('/get_value_extracurricular','ExtracurricularController@get_value_extracurricular');
    Route::get('/get_value_extracurricular_desc','ExtracurricularController@get_value_extracurricular_desc');
    Route::get('/get_value_observasi','ObservasiController@get_value_observasi');
    Route::get('/get_value_pd','PDController@get_value_pd');
    Route::get('/get_value_tahsin','TahsinController@get_value_tahsin');
    Route::get('/get_value_tahfizh','TahfizhController@get_value_tahfizh');
    Route::get('/get_value_teacher_note','TeacherNoteController@get_value_teacher_note');
    Route::get('/get_value_friendly_value','FriendlyValueController@get_value_friendly_value');
    Route::get('/get_value_personality','PersonalityController@get_value_personality');
    Route::get('/get_month','AppController@get_month');
    Route::get('/get_tahsin','AppController@get_tahsin');
    Route::get('/get_tahfizh','AppController@get_tahfizh');
    Route::get('/get_personality','AppController@get_personality');
    Route::get('/get_observasi_spiritual','AppController@get_observasi_spiritual');
    Route::get('/get_observasi_sosial','AppController@get_observasi_sosial');
    Route::get('/get_pd_spiritual','AppController@get_pd_spiritual');
    Route::get('/get_pd_sosial','AppController@get_pd_sosial');
    Route::get('/get_friendly_value_spiritual','AppController@get_friendly_value_spiritual');
    Route::get('/get_friendly_value_sosial','AppController@get_friendly_value_sosial');
    Route::get('/get_type_fisik','AppController@get_type_fisik');
    Route::get('/get_type_kes','AppController@get_type_kes');
    Route::get('/get_ekstrakurikuler','AppController@get_ekstrakurikuler');
    Route::get('/print_raport','RaportController@print_raport');
    Route::get('/print_raport_pts','RaportController@print_raport_pts');
    Route::get('/get_foundation','AppController@get_foundation');        
    Route::get('/get_employee_unit','AppController@get_employee_unit');        
    Route::get('/get_course_by_id','AppController@get_course_by_id');        
    Route::get('/get_menu_all','AppController@get_menu_all');        
    Route::get('/get_quiz_per_kd','QuizPerKd@index');        
    Route::get('/get_data_kd_course','AppController@get_data_kd_course');        
    Route::get('/get_list_daily_quiz','QuizPerKd@get_list_daily_quiz');        
    Route::get('/get_list_question_per_kd','AppController@get_list_question_per_kd');        
    Route::post('/quiz_per_kd/insert_quality','QuizPerKd@insert_quality');        
    Route::post('/quiz_per_kd/insert_number','QuizPerKd@insert_number');        
    Route::get('/get_val_in_analysis','InputAnalysisController@get_val_in_analysis');        
    Route::get('/get_total_input_analysis','InputAnalysisController@get_total_input_analysis');        
    Route::get('/get_kd','AppController@get_kd');        
    Route::get('/get_daily_tema','AppController@get_daily_tema');        
    Route::get('/get_course_per_kd','AppController@get_course_per_kd');        
    Route::get('/get_unit_with_class','AppController@get_unit_with_class');        
    Route::get('/validation_check','AppController@validation_check');        
    Route::post('/update_profile','EmployeeController@update_profile');        

});
