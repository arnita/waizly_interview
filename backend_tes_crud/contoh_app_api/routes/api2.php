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

Route::group(['namespace' => 'API','middleware'=>'check-token'], function(){

     Route::post('/insert_number','StructureTematicDetailController@insert_number');        
     Route::post('/insert_quality','StructureTematicDetailController@insert_quality');      

     Route::post('/insert_number_uts','StructureTematicDetailController@insert_number_uts');        
     Route::post('/insert_quality_uts','StructureTematicDetailController@insert_quality_uts');        

     Route::post('/insert_number_uas','StructureTematicDetailController@insert_number_uas');        
     Route::post('/insert_quality_uas','StructureTematicDetailController@insert_quality_uas');        
     
     Route::get('/get_uts_tema','AppController@get_uts_tema');        
     Route::get('/get_uas_tema','AppController@get_uas_tema');        

     Route::post('/send_param_analysis_daily_kd','InputAnalysisController@send_param_analysis_daily_kd');        
     Route::post('/send_param_analysis_uts_kd','InputAnalysisController@send_param_analysis_uts_kd');        
     Route::post('/send_param_analysis_uas_kd','InputAnalysisController@send_param_analysis_uas_kd');   
          
     Route::get('/get_study_group_setting','AppController@get_study_group_setting');        

     Route::get('/get_list_question_n_total_kd','AppController@get_list_question_n_total_kd');  
     Route::get('/get_list_question_n_total_kd_uts','AppController@get_list_question_n_total_kd_uts');  
     Route::get('/get_list_question_n_total_kd_uas','AppController@get_list_question_n_total_kd_uas');  



     Route::get('/get_list_question_n_total_tema','AppController@get_list_question_n_total_tema');  
     Route::get('/get_total_absensi','AppController@get_total_absensi');  

     Route::get('/get_list_question_n_total_tema_uts','AppController@get_list_question_n_total_tema_uts');  
     Route::get('/get_list_question_n_total_tema_uas','AppController@get_list_question_n_total_tema_uas');  

     
     Route::get('/get_course_by_class_drop','AppController@get_course_by_class_drop');  

     Route::post('/analysis_tematic_daily_upload','AnalysisTematicController@analysis_tematic_daily_upload');  
     Route::post('/send_param_analysis_daily_tema','AnalysisTematicController@send_param_analysis_daily_tema');        
     Route::post('/absensi_upload','AbsensiController@absensi_upload');        
       


     Route::post('/analysis_tematic_uts_upload','AnalysisTematicController@analysis_tematic_uts_upload');  
     Route::post('/send_param_analysis_uts_tema','AnalysisTematicController@send_param_analysis_uts_tema');
     Route::post('/send_param_absensi','AbsensiController@send_param_absensi');

     Route::post('/send_param_extracurricular','ExtracurricularController@send_param_extracurricular');
     Route::post('/extracurricular_upload','ExtracurricularController@extracurricular_upload');  
     Route::get('/get_total_extracurricular','AppController@get_total_extracurricular');  
     Route::get('/load_extracurricular','ExtracurricularController@load_extracurricular');  
     Route::get('/load_data','InputAnalysisController@load_data'); 
     Route::get('/load_data_tema','AnalysisTematicController@load_data_tema'); 


     Route::post('/send_param_observasi','ObservasiController@send_param_observasi');
     Route::post('/observasi_upload','ObservasiController@observasi_upload');  
     Route::get('/get_total_observasi','AppController@get_total_observasi');  

     Route::post('/send_param_friendly_value','FriendlyValueController@send_param_friendly_value');
     Route::post('/friendly_value_upload','FriendlyValueController@friendly_value_upload');  
     Route::get('/get_total_friendly_value','AppController@get_total_friendly_value');  
      

     Route::post('/send_param_pd','PDController@send_param_pd');
     Route::post('/pd_upload','PDController@pd_upload');  
     Route::get('/get_total_pd','AppController@get_total_pd');      
     Route::get('/get_course_study_group_type','AppController@get_course_study_group_type');      

     Route::post('/send_param_tahsin','TahsinController@send_param_tahsin');
     Route::post('/tahsin_upload','TahsinController@tahsin_upload');  
     Route::get('/get_total_tahsin','AppController@get_total_tahsin');  


     Route::post('/send_param_tahfizh','TahfizhController@send_param_tahfizh');
     Route::post('/tahfizh_upload','TahfizhController@tahfizh_upload');  
     Route::get('/get_total_tahfizh','AppController@get_total_tahfizh');  

     Route::post('/send_param_personality','PersonalityController@send_param_personality');
     Route::post('/personality_upload','PersonalityController@personality_upload');  
     Route::get('/get_total_personality','AppController@get_total_personality');  


     Route::post('/send_param_teacher_note','TeacherNoteController@send_param_teacher_note');
     Route::post('/teacher_note_upload','TeacherNoteController@teacher_note_upload');  
     Route::get('/get_total_teacher_note','AppController@get_total_teacher_note');  

     Route::post('/send_param_prestation','PrestationController@send_param_prestation');
     Route::post('/prestation_upload','PrestationController@prestation_upload');  
     Route::get('/get_total_prestation','AppController@get_total_prestation');  


     Route::post('/send_param_daily_exercise','DailyExerciseController@send_param_daily_exercise');
     Route::post('/daily_exercise_upload','DailyExerciseController@daily_exercise_upload');  
     Route::post('/send_param_daily_exercise_skill','DailyExerciseController@send_param_daily_exercise_skill');
     Route::post('/daily_exercise_skill_upload','DailyExerciseController@daily_exercise_skill_upload');  


     Route::post('/send_param_daily_exercise','DialyExerciseController@send_param_daily_exercise');
     Route::post('/daily_exercise_upload','DialyExerciseController@daily_exercise_upload');  
     Route::post('/send_param_daily_exercise_skill','DialyExerciseController@send_param_daily_exercise_skill');
     Route::post('/daily_exercise_skill_upload','DialyExerciseController@daily_exercise_skill_upload');  

     Route::get('/get_total_daily_exercise','AppController@get_total_daily_exercise');  

     
     Route::get('/get_total_daily_exercise_skill','AppController@get_total_daily_exercise_skill');  

     Route::post('/analysis_tematic_uas_upload','AnalysisTematicController@analysis_tematic_uas_upload');      
     Route::post('/employee_upload','EmployeeController@employee_upload');      
     Route::post('/student_upload','StudentController@student_upload');      
     Route::post('/kd_upload','KDController@kd_upload');      
     Route::post('/send_param_analysis_uas_tema','AnalysisTematicController@send_param_analysis_uas_tema');
     Route::get('/get_role','AppController@get_role');

     
     Route::post('/physical_student_upload','PhysicalStudentController@physical_student_upload');
     Route::post('/send_param_physical_student','PhysicalStudentController@send_param_physical_student');
     Route::get('/get_list_question_n_total_physical_stu','AppController@get_list_question_n_total_physical_stu');
     Route::get('/insert_raport','RaportController@insert_raport');
     Route::get('/insert_raport_pts','RaportController@insert_raport_pts');
     Route::get('/get_list_user','AppController@get_list_user');
     Route::get('/get_course_edit_kd','KDController@get_course_edit_kd');

     
     Route::post('/store_parlookup','DataParlookupController@store_parlookup');
     Route::get('/parlookup_index','DataParlookupController@parlookup_index');
     Route::put('/update_parlookup/{id}','DataParlookupController@update_parlookup');
     Route::delete('/destroy_parlookup/{id}','DataParlookupController@destroy_parlookup');
     Route::get('/edit_parlookup/{id}/edit','DataParlookupController@edit_parlookup');
     Route::get('/get_year_step_active','AppController@get_year_step_active');
     Route::get('/get_view_raport','RaportController@get_view_raport');
     Route::get('/get_view_raport_pts','RaportController@get_view_raport_pts');
     Route::get('/get_view_ledger','RaportController@get_view_ledger');
     Route::get('/get_view_ledger_pts','RaportController@get_view_ledger_pts');
     Route::get('/view_summary','AppController@view_summary');
     Route::get('/cek_number','StructureTematicDetailController@cek_number');
     Route::get('/cek_number_kd','QuizPerKd@cek_number_kd');
     Route::get('/get_value_analisis','InputAnalysisController@get_value_analisis');
     Route::get('/get_value_analisis_tema','AnalysisTematicController@get_value_analisis_tema');
     Route::post('/input_form_analisis','InputAnalysisController@input_form_analisis');
     Route::post('/input_form_analisis_tema','AnalysisTematicController@input_form_analisis_tema');
     Route::post('/copy_kkm','KKMController@copy_kkm');
     Route::post('/teacher_coordinator','CourseSettingController@teacher_coordinator');
     Route::get('/get_employee_unit','AppController@get_employee_unit');
     Route::delete('/delete_employee_unit/{id}','EmployeeController@delete_employee_unit');
     Route::post('/edit_employee_unit','EmployeeController@edit_employee_unit');
     Route::get('/get_unit_per_emp','AppController@get_unit_per_emp');
     Route::get('/get_study_group_all','AppController@get_study_group_all');
     Route::get('/edit_profile','EmployeeController@edit_profile');
     Route::post('/delete_quiz/{id}','QuizPerKd@delete_quiz');

});
