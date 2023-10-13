<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/{any}','FrontendController@index')
//->where('any', '.*')
;
Route::get('/input_analysis/export','FrontendController@export_input_analysis');
Route::get('/input_analysis_uts/export','FrontendController@export_input_analysis_uts');
Route::get('/input_analysis_uas/export','FrontendController@export_input_analysis_uas');

Route::get('/analysis_tematic_daily/export','FrontendController@export_analysis_tematic_daily');
Route::get('/analysis_tematic_uts/export','FrontendController@export_analysis_tematic_uts');
Route::get('/analysis_tematic_uas/export','FrontendController@export_analysis_tematic_uas');

Route::get('/quiz_per_kd/create_question/{id}','FrontendController@index');
Route::get('/quiz_uas/create_question/{id}','FrontendController@index');
Route::get('/quiz_uts/create_question/{id}','FrontendController@index');


Route::get('/structure_tematic/set_daily/{id}','FrontendController@index');
Route::get('/structure_tematic/set_uts/{id}','FrontendController@index');
Route::get('/structure_tematic/set_uas/{id}','FrontendController@index');

Route::get('/quiz_uts/create','FrontendController@index');
Route::get('/quiz_uas/create','FrontendController@index');
Route::get('/quiz_uts/edit_uts/{id}','FrontendController@index');
Route::get('/quiz_uas/edit_uts/{id}','FrontendController@index');
Route::get('/raport_pas/print/{id}','FrontendController@index');
Route::get('/raport_pas','FrontendController@index');
Route::get('/course/create','FrontendController@index');
Route::get('/course/edit/{id}','FrontendController@index');




Route::get('/input_physic/export','FrontendController@export_input_physic');
Route::get('/absensi/export','FrontendController@export_absensi');
Route::get('/raport/print_raport','FrontendController@print_raport_pas');
Route::get('/raport/print_raport_pts','FrontendController@print_raport_pts');
Route::get('/extracurricular/export','FrontendController@export_extracurricular');
Route::get('/observasi/export','FrontendController@export_observasi');
Route::get('/teacher_note/export','FrontendController@export_teacher_note');
Route::get('/friendly_value/export','FrontendController@export_friendly_value');
Route::get('/prestation/export','FrontendController@export_prestation');

Route::get('/pd/export','FrontendController@export_pd');
Route::get('/tahsin/export','FrontendController@export_tahsin');
Route::get('/tahfizh/export','FrontendController@export_tahfizh');
Route::get('/daily_exercise/export','FrontendController@export_daily_exercise');

Route::get('/personality/export','FrontendController@export_personality');
Route::get('/daily_exercise_skill/export','FrontendController@export_daily_exercise_skill');
Route::get('/employee/export','FrontendController@export_employee');
Route::get('/student/export','FrontendController@export_student');

Route::get('/kd/create','FrontendController@index');
Route::get('/kd/edit/{id}','FrontendController@index');
Route::get('/quiz_per_kd/create','FrontendController@index');
Route::get('/quiz_per_kd/edit/{id}','FrontendController@index');
Route::get('/m_extracurricular/create','FrontendController@index');
Route::get('/m_extracurricular/edit/{id}','FrontendController@index');
Route::get('/kd/pemetaan','FrontendController@index');



Route::get('/download_summary_value/export','FrontendController@download_summary_value');
Route::get('/download_ledger/export','FrontendController@download_ledger');
Route::get('/download_ledger_pts/export','FrontendController@download_ledger_pts');
Route::get('/kd/export','FrontendController@export_kd');
Route::get('/kkm/create','FrontendController@index');
Route::get('/kkm/edit/{id}','FrontendController@index');
Route::get('/employee/create','FrontendController@index');
Route::get('/role/role_setting/id/{id}','FrontendController@index');
Route::get('/role/role_setting/{param}/{id}','FrontendController@index');
Route::get('/summary_value/view_summary/{param}/{id}','FrontendController@index');




Route::get('/structure_tematic/detail/{id}','FrontendController@index');
Route::get('/structure_tematic/create_question/{id}','FrontendController@index');
Route::get('/structure_tematic/create_question_daily/{id}','FrontendController@index');
Route::get('/quiz_uts/create_question_uts/{id}/{id1}/{id2}','FrontendController@index');
Route::get('/quiz_uas/create_question_uas/{id}','FrontendController@index');
Route::get('/structure_tematic/create_question_uts/{id}','FrontendController@index');
Route::get('/structure_tematic/create_question_uas/{id}','FrontendController@index');
Route::get('/raport_pas/print_pas/{id}/{name}','FrontendController@index');
Route::get('/raport_pts/print_pts/{id}/{name}/{study_group_id}/{class_grade_id}','FrontendController@index');
Route::get('/summary_value/view_summary/{id}','FrontendController@index');
Route::get('/ledger_pas/print_ledger/{id}/{class_grade_id}','FrontendController@index');
Route::get('/ledger_pts/print_ledger/{id}/{class_grade_id}','FrontendController@index');
Route::get('/student/edit/{id}','FrontendController@index');
Route::get('/step_study/{id}','FrontendController@index');
Route::get('/unit_year/create','FrontendController@index');
Route::get('/step_study/{id}/edit/{id_}','FrontendController@index');
Route::get('/structure_tematic/create','FrontendController@index');
Route::get('/summary_value/view_summary/{id1}/{id2}/{id3}','FrontendController@index');
Route::get('/employee/edit/{id}','FrontendController@index');
Route::get('/structure_tematic/create_question_daily/{id}/{st_id}','FrontendController@index');
Route::get('/structure_tematic/create_question_uts/{id}/{st_id}','FrontendController@index');
Route::get('/step_study/{id}/create','FrontendController@index');
Route::get('/raport_pas/print_pas','FrontendController@index');
Route::get('/raport_pas/print_pas','FrontendController@index');
Route::get('/employee/edit_profile','FrontendController@index');
Route::get('/','FrontendController@index');
Route::get('/class_room/create','FrontendController@index');



