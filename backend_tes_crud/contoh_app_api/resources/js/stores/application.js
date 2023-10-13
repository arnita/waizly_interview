/*
	 FOR SETTING GLOBAL 
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

import $axios from '../api.js'

/* this for declare  state */
const state = ()=>({
	unit : [],
	unit_year : [],
	class_grade :[],
	class_room :[],
	gender :[],
	religion :[],
	class_grade_all:[],
	study_group:[],
	study_group_all:[],
	study_group_by_id:[],
	student_by_class:[],
	student_by_class_page:{},
	course_by_class:[],
	course_by_class_page:{},
	step_study:[],
	step_study_active:[],
	employee_setting:[],
	data_kd_detail:[],
	data_kd_detail_page:{},
	employee_setting_page:{},
	employee_setting_page:{},
	employee_by_advisor_page:{},
	course :[],
	course_study_group :[],
	employee_by_advisor :[],
	menu_parent :[],
	menu_sub :[],
	menu :[],
	tematic_active :[],
	course_by_id :[],
	course_by_study_group :[],
	data_all_kd :[],
	tematic_group :[],
	foundation :[],
	data_kd_course :[],
	data_kd_course_new :[],
	data_list_daily_question :[],
	daily_tema :[],
	uts_tema :[],
	uas_tema :[],
	role :[],
	user_list_menu:[],
	ekstrakurikuler:[],
	employee_unit:[],
	get_first_kd:[],
})


/*  this form assign state */
const mutations ={
	ASSIGN_UNIT(state,payload){
		state.unit  = payload
	},
	ASSIGN_UNIT_YEAR(state,payload){
		state.unit_year  = payload
	},
	ASSIGN_CLASS_GRADE(state,payload){
		state.class_grade = payload
	},
	ASSIGN_CLASS_GRADE_ALL(state,payload){
		state.class_grade = payload
	},
	ASSIGN_CLASS_ROOM(state,payload){
		state.class_room = payload
	},
	ASSIGN_CLASS_ROOM_ALL(state,payload){
		state.class_room = payload
	},
	ASSIGN_GENDER(state,payload){
		state.gender = payload
	},
	ASSIGN_RELIGION(state,payload){
		state.religion = payload
	},
	ASSIGN_COURSE(state,payload){
		state.course = payload
	},
	ASSIGN_STUDY_GROUP(state,payload){
		state.study_group = payload
	},
	ASSIGN_STUDY_GROUP_ALL(state,payload){
		state.study_group_all = payload
	},
	ASSIGN_STUDY_GROUP_BY_ID(state,payload){
		state.study_group_id = payload
	},
	ASSIGN_STUDENT_BY_CLASS(state,payload){
		state.student_by_class = payload
	},
	ASSIGN_STEP_STUDY(state,payload){
		state.step_study = payload
	},
	ASSIGN_STEP_STUDY_ACTIVE(state,payload){
		state.step_study_active = payload
	},
	ASSIGN_DATA_KD_DETAIL(state,payload){
		state.data_kd_detail = payload
	},
	ASSIGN_COURSE_BY_CLASS(state,payload){
		state.course_by_class = payload
	},
	ASSIGN_COURSE_BY_CLASS_PAGE(state,payload){
		state.course_by_class_page = payload
	},
	ASSIGN_DATA_KD_DETAIL_PAGE(state,payload){
		state.data_kd_detail_page = payload
	},
	ASSIGN_STUDENT_BY_CLASS_PAGE(state,payload){
		state.student_by_class_page = payload
	},
	ASSIGN_EMPLOYEE_SETTING(state,payload){
		state.employee_setting = payload
	},
	ASSIGN_EMPLOYEE_SETTING_PAGE(state,payload){
		state.employee_setting_page = payload
	},
	ASSIGN_COURSE_STUDY_GROUP(state,payload){
		state.course_study_group = payload
	},
	ASSIGN_EMPLOYEE_BY_ADVISOR_PAGE(state,payload){
		state.employee_by_advisor_page = payload
	},
	ASSIGN_EMPLOYEE_BY_ADVISOR(state,payload){
		state.employee_by_advisor = payload
	},
	ASSIGN_MENU_PARENT(state,payload){
		state.menu_parent = payload
	},
	ASSIGN_MENU_SUB(state,payload){
		state.menu_sub = payload
	},
	ASSIGN_MENU(state,payload){
		state.menu = payload
	},
	ASSIGN_TEMATIC_ACTIVE(state,payload){
		state.tematic_active = payload
	},
	ASSIGN_COURSE_BY_ID(state,payload){
		state.course_by_id = payload
	},
	ASSIGN_COURSE_BY_STUDY_GROUP(state,payload){
		state.course_by_study_group = payload
	},
	ASSIGN_DATA_ALL_KD(state,payload){
		state.data_all_kd = payload
	},
	ASSIGN_TEMATIC_GROUP(state,payload){
		state.tematic_group = payload
	},
	ASSIGN_FOUNDATION(state,payload){
		state.foundation = payload
	},	
	ASSIGN_DATA_KD_COURSE(state,payload){
		state.data_kd_course = payload
	},	
	ASSIGN_DATA_KD_COURSE_NEW(state,payload){
		state.data_kd_course_new = payload
	},	
	ASSIGN_LIST_DAILY_QUESTION(state,payload){
		state.data_list_daily_question = payload
	},	

	ASSIGN_DAILY_TEMA(state,payload){
		state.daily_tema = payload
	},		
	ASSIGN_UTS_TEMA(state,payload){
		state.uts_tema = payload
	},	

	ASSIGN_UAS_TEMA(state,payload){
		state.uas_tema = payload
	},	

	ASSIGN_GET_LIST_USER(state,payload){
		state.user_list_menu = payload
	},		
	ASSIGN_GET_ROLE(state,payload){
		state.role = payload
	},	
	ASSIGN_EKSTRAKURIKULER(state,payload){
		state.ekstrakurikuler = payload
	},	
	ASSIGN_EMPLOYEE_UNIT(state,payload){
		state.employee_unit = payload
	},	
	ASSIGN_GET_FIRST_KD(state,payload){
		state.get_first_kd = payload
	},	


}


/* this for setting function axios*/
const actions = {
	/* For get all unit */
	get_unit({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_unit')
			.then((response)=>{
				commit('ASSIGN_UNIT',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	get_employee_unit({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_employee_unit?employee_id='+payload)
			.then((response)=>{

				commit('ASSIGN_EMPLOYEE_UNIT',response.data);
				resolve(response.data.data);
			})
		})
	},

	/* For get all ekstrakurikuler */
	get_ekstrakurikuler({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_ekstrakurikuler')
			.then((response)=>{
				commit('ASSIGN_EKSTRAKURIKULER',response.data);
				resolve(response.data);
			})
		})
	},
	/* For get all unit year */
	get_unit_year({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_unit_year')
			.then((response)=>{
				commit('ASSIGN_UNIT_YEAR',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get grade with filter unit id  */
	get_class_grade({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_class_grade?unit_id='+payload)
			.then((response)=>{
				commit('ASSIGN_CLASS_GRADE',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get all grade / tingkat kelas */
	get_class_grade_all({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_class_grade_all')
			.then((response)=>{
				commit('ASSIGN_CLASS_GRADE',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get class with filter unit id  */
	get_class_room({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_class_room?unit_id='+payload)
			.then((response)=>{
				commit('ASSIGN_CLASS_ROOM',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get all class room / ruangan kelas */
	get_class_room_all({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_class_room_all')
			.then((response)=>{
				commit('ASSIGN_CLASS_ROOM',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get parlookup gender */
	get_gender({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/gender')
			.then((response)=>{
				commit('ASSIGN_GENDER',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get parlookup religion */
	get_religion({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/religion')
			.then((response)=>{
				commit('ASSIGN_RELIGION',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get  all course / mata pelajaran */
	get_course({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_course')
			.then((response)=>{
				commit('ASSIGN_COURSE',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get  rombel with filter grade id */
	get_study_group({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_study_group?class_grade_id='+payload)
			.then((response)=>{
				commit('ASSIGN_STUDY_GROUP',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get  rombel all */
	get_study_group_all({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_study_group_all?class_grade_id='+payload)
			.then((response)=>{
				commit('ASSIGN_STUDY_GROUP_ALL',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get rombel with filter id    */
	get_study_group_by_id({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_study_group_by_id?id='+payload)
			.then((response)=>{
				commit('ASSIGN_STUDY_GROUP_BY_ID',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get student with filter grade / tingkat kelas    */
	get_student_by_class({commit},payload){
		return new Promise((resolve,reject)=>{
			
			$axios.get('/get_student_by_class?class_grade_id='+payload.class_grade_id+'&page='+payload.page)
			.then((response)=>{
				commit('ASSIGN_STUDENT_BY_CLASS',response.data.data.data.data);
				commit('ASSIGN_STUDENT_BY_CLASS_PAGE',response.data.data.data);
				resolve(response.data.data.data.data);
			})
		})
	},
	/* For get step study / sum absensi    */
	get_step_study({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_step_study')
			.then((response)=>{
				commit('ASSIGN_STEP_STUDY',response.data.data);
				resolve(response.data.data);
			})
		})
	},
	/* For get step study / tahapan belajar    */
	get_step_study_active({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_step_study_active')
			.then((response)=>{
				commit('ASSIGN_STEP_STUDY_ACTIVE',response.data.data.data);
				resolve(response.data.data.data);
			})
		})
	},
	/* For get KD  with param step study */
	get_data_kd({commit},payload){
		return new Promise((resolve,reject)=>{
			if(typeof payload.q=='undefined'){
				var q_ = "";
			}else{
				var q_ = payload.q;
			}

			if(typeof payload.class_grade_id=='undefined'){
				var class_ = "";
			}else{
				var class_ = payload.class_grade_id;
			}	

			if(typeof payload.course_id=='undefined'){
				var course_ = "";
			}else{
				var course_ = payload.course_id;
			}
			
			$axios.get('/get_data_kd?step_study_id='+payload.step_study_id+'&page='+payload.page+'&q='+q_+'&class_grade_id='+class_+'&course_id='+course_)
			.then((response)=>{
				commit('ASSIGN_DATA_KD_DETAIL',response.data.data.data.data);
				commit('ASSIGN_DATA_KD_DETAIL_PAGE',response.data.data.data);
				resolve(response.data.data.data.data);
			})
		})
	},	

	/* For get KD  with param step study */
	get_data_kd_course({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_data_kd_course?course_id='+payload)
			.then((response)=>{
				commit('ASSIGN_DATA_KD_COURSE',response.data);
				resolve(response.data.data);
			})
		})
	},	

	/* for get data kd dengan perubahan per kelas */
	get_data_kd_course_new({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_data_kd_course?course_id='+payload.course_id+'&class_grade_id='+payload.class_grade_id)
			.then((response)=>{
				commit('ASSIGN_DATA_KD_COURSE_NEW',response.data);
				resolve(response.data.data);
			})
		})
	},	


	/* For get course with filter rombel id    */
	get_course_by_class({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_course_by_class?class_grade_id='+payload.class_grade_id+'&page='+payload.page)
			.then((response)=>{
				commit('ASSIGN_COURSE_BY_CLASS',response.data.data.data.data);
				commit('ASSIGN_COURSE_BY_CLASS_PAGE',response.data.data.data);
				resolve(response.data.data.data.data);
			})
		})
	},
	/* For get employee     */
	get_employee_setting({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_employee_setting?employee_id='+payload.employee_id+'&course_id='+payload.course_id+'&page='+payload.page)
			.then((response)=>{
				commit('ASSIGN_EMPLOYEE_SETTING',response.data.data.data.data);
				commit('ASSIGN_EMPLOYEE_SETTING_PAGE',response.data.data.data);
				resolve(response.data.data.data.data);
			})
		})
	},
	/* For get with class grade / tingkat kelas  */
	get_course_study_group({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_course_study_group?class_grade_id='+payload)
			.then((response)=>{
				commit('ASSIGN_COURSE_STUDY_GROUP',response.data.data.data);
				resolve(response.data.data.data);
			})
		})
	},
	/* For get employee advisor /wali kelas    */
	get_employee_advisor({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_employee_advisor?page='+payload)
			.then((response)=>{
				commit('ASSIGN_EMPLOYEE_BY_ADVISOR',response.data.data.data.data);
				commit('ASSIGN_EMPLOYEE_BY_ADVISOR_PAGE',response.data.data.data);
				resolve(response.data.data.data.data);
			})
		})
	},
	/* For get menu parent    */
	get_menu_parent({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_menu_all')
			.then((response)=>{
				commit('ASSIGN_MENU_PARENT',response.data.data.data);
				commit('ASSIGN_MENU_SUB',response.data.data.sub);
				resolve(response.data.data.data);
			})
		})
	},
	/* For get menu    */
	get_menu({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_menu')
			.then((response)=>{
				commit('ASSIGN_MENU',response.data.data.data);
				resolve(response.data.data.data);
			})
		})
	},
	/* For get tematic with id    */
	get_tematic_active({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_tematic_active?id='+payload)
			.then((response)=>{
				commit('ASSIGN_TEMATIC_ACTIVE',response.data.data.data);
				resolve(response.data.data.data);
			})
		})
	},
	
	/* For get course with study group id    */
	get_course_by_study_group({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_course_by_study_group?id='+payload)
			.then((response)=>{
				commit('ASSIGN_COURSE_BY_STUDY_GROUP',response.data);
				resolve(response.data);
			})
		})
	},


	/* For get tematic with study group id    */
	get_tematic_group({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_tematic_group?class_grade_id='+payload)
			.then((response)=>{
				commit('ASSIGN_TEMATIC_GROUP',response.data);
				resolve(response.data);
			})
		})
	},

	/* For get foundarion with foundation id    */
	get_foundation({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_foundation?foundation_id='+payload)
			.then((response)=>{
				commit('ASSIGN_FOUNDATION',response.data);
				resolve(response.data);
			})
		})
	},


	/* For get list daily question  with kd id    */
	get_list_daily_question({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_list_daily_question?kd_id='+payload)
			.then((response)=>{
				commit('ASSIGN_LIST_DAILY_QUESTION',response.data);
				resolve(response.data);
			})
		})
	},

/* For get data daily tema / input analisis tema harian     */
	get_daily_tema({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_daily_tema?id='+payload)
			.then((response)=>{
				commit('ASSIGN_DAILY_TEMA',response.data);
				resolve(response.data);
			})
		})
	},

/* For get data daily tema / input analisis tema uts     */
	get_uts_tema({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_uts_tema?id='+payload)
			.then((response)=>{
				commit('ASSIGN_UTS_TEMA',response.data);
				resolve(response.data);
			})
		})
	},


/* For get data daily tema / input analisis tema uas     */
	get_uas_tema({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('/get_uas_tema?id='+payload)
			.then((response)=>{
				commit('ASSIGN_UAS_TEMA',response.data);
				resolve(response.data);
			})
		})
	},

	get_list_user({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('get_list_user')
			.then((response)=>{
				// console.log(response.data.user);
				commit('ASSIGN_GET_LIST_USER',response.data.user);
				resolve(response.data)
			})
		})
	},

	get_role({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('get_role')
			.then((response)=>{
				commit('ASSIGN_GET_ROLE',response.data.data);
				resolve(response.data.data)
			})
		})
	},

	get_first_kd({commit},payload){
		return new Promise((resolve,reject)=>{
			$axios.get('get_first_kd?course_id='+payload.course_id+'&class_grade_id='+payload.class_grade_id+'&kd_id='+payload.kd_id)
			.then((response)=>{
				commit('ASSIGN_GET_ROLE',response.data.data);
				resolve(response.data.data)
			})
		})
	},

	
}


export default{
    namespaced:true,
    state,
    actions,
    mutations,
}
