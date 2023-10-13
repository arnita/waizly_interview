import Router from 'vue-router';
import Vue from 'vue';
import home from './pages/home.vue';
import login from './pages/login.vue';
import input_analysis_uts from './pages/input_analysis/input_analysis_uts.vue';
import input_analysis_uas from './pages/input_analysis/input_analysis_uas.vue';
import store from './store.js';


Vue.use(Router)

const router = new Router({
	mode: 'history',
	linkActiveClass:'active',
	linkExactActiveClass: "active",
	routes: [
		{
			path:'/unit',
			name:'',
			component:require('./pages/unit/index.vue'),
			meta: {
				requiresAuth: true,
				title :' Unit'
			},
			children:[
				{
					path:'create',
					name:'unit.create',
					component:require('./pages/unit/create.vue'),
					meta : {
						title:'Add-Unit',
					}
				},
				{
					path:'edit/:id',
					name:'unit.edit',
					component:require('./pages/unit/edit.vue'),
					meta:{
						title:'Edit-Unit'
					}
				},
				{
					path:'',
					name:'unit.data',
					component:require('./pages/unit/unit.vue'),
					meta : {
						title :'Unit'
					}
				}

			]
		},
		{
			path:'/unit_year',
			name:'',
			component:require('./pages/unit_year/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'unit_year.create',
					component:require('./pages/unit_year/create.vue'),
					meta : {
						title:'Tambah Tahun Ajaran',
					}
				},
				{
					path:'edit/:id',
					name:'unit_year.edit',
					component:require('./pages/unit_year/edit.vue'),
					meta:{
						title:'Edit Tahun Ajaran'
					}
				},
				{
					path:'',
					name:'unit_year.data',
					component:require('./pages/unit_year/unit_year.vue'),
					meta : {
						title :'Tahun Ajaran'
					}
				}

			]
		},
		{
			path:'/step_study/:id',
			name:'',
			component:require('./pages/step_study/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'step_study.create',
					component:require('./pages/step_study/create.vue'),
					meta : {
						title:'Tambah Tahapan Belajar',
					}
				},
				
				{
					path:'edit/:id_edit/',
					name:'step_study.edit',
					component:require('./pages/step_study/edit.vue'),
					meta:{
						title:'Ubah Tahapan Belajar'
					}
				},
				{
					path:'',
					name:'step_study.data',
					component:require('./pages/step_study/step_study.vue'),
					meta : {
						title :'Tahapan Belajar'
					}
				}

			]
		},
		{
			path:'/class_grade',
			name:'',
			component:require('./pages/class_grade/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'class_grade.create',
					component:require('./pages/class_grade/create.vue'),
					meta : {
						title:'Tambah Tingkat Kelas',
					}
				},
				
				{
					path:'edit/:id',
					name:'class_grade.edit',
					component:require('./pages/class_grade/edit.vue'),
					meta:{
						title:'Ubah Tingkat Kelas'
					}
				},
				{
					path:'',
					name:'class_grade.data',
					component:require('./pages/class_grade/class_grade.vue'),
					meta : {
						title :'Tingkat Kelas'
					}
				}

			]
		},
		{
			path:'/lesson_hour',
			name:'',
			component:require('./pages/lesson_hour/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'lesson_hour.create',
					component:require('./pages/lesson_hour/create.vue'),
					meta : {
						title:'Tambah Jam Pelajaran',
					}
				},
				
				{
					path:'edit/:id',
					name:'lesson_hour.edit',
					component:require('./pages/lesson_hour/edit.vue'),
					meta:{
						title:'Ubah Jam Pelajaran'
					}
				},
				{
					path:'',
					name:'lesson_hour.data',
					component:require('./pages/lesson_hour/lesson_hour.vue'),
					meta : {
						title :'Jam Pelajaran'
					}
				}

			]
		},
		{
			path:'/course',
			name:'',
			component:require('./pages/course/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'course.create',
					component:require('./pages/course/create.vue'),
					meta : {
						title:'Tambah Mata Pelajaran',
					}
				},
				
				{
					path:'edit/:id',
					name:'course.edit',
					component:require('./pages/course/edit.vue'),
					meta:{
						title:'Ubah Mata Pelajaran'
					}
				},
				{
					path:'',
					name:'course.data',
					component:require('./pages/course/course.vue'),
					meta : {
						title :'Mata Pelajaran'
					}
				}

			]
		},
		{
			path:'/class_room',
			name:'',
			component:require('./pages/class_room/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'class_room.create',
					component:require('./pages/class_room/create.vue'),
					meta : {
						title:'Tambah Ruangan Kelas',
					}
				},
				
				{
					path:'edit/:id',
					name:'class_room.edit',
					component:require('./pages/class_room/edit.vue'),
					meta:{
						title:'Ubah Ruangan Kelas'
					}
				},
				{
					path:'',
					name:'class_room.data',
					component:require('./pages/class_room/class_room.vue'),
					meta : {
						title :'Ruangan Kelas'
					}
				}

			]
		},
		{
			path:'/study_group',
			name:'',
			component:require('./pages/study_group/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'study_group.create',
					component:require('./pages/study_group/create.vue'),
					meta : {
						title:'Tambah Rombel',
					}
				},
				
				{
					path:'edit/:id',
					name:'study_group.edit',
					component:require('./pages/study_group/edit.vue'),
					meta:{
						title:'Ubah Rombel'
					}
				},
				{
					path:'',
					name:'study_group.data',
					component:require('./pages/study_group/study_group.vue'),
					meta : {
						title :'Rombel'
					}
				}

			]
		},
		{
			path:'/student',
			name:'',
			component:require('./pages/student/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'student.create',
					component:require('./pages/student/create.vue'),
					meta : {
						title:'Tambah Siswa',
					}
				},
				
				{
					path:'edit/:id',
					name:'student.edit',
					component:require('./pages/student/edit.vue'),
					meta:{
						title:'Ubah Siswa'
					}
				},
				{
					path:'',
					name:'student.data',
					component:require('./pages/student/student.vue'),
					meta : {
						title :'Siswa'
					}
				}

			]
		},
		{
			path:'/kkm',
			name:'',
			component:require('./pages/kkm/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'kkm.create',
					component:require('./pages/kkm/create.vue'),
					meta : {
						title:'Tambah KKM',
					}
				},
				
				{
					path:'edit/:id',
					name:'kkm.edit',
					component:require('./pages/kkm/edit.vue'),
					meta:{
						title:'Ubah KKM'
					}
				},
				{
					path:'',
					name:'kkm.data',
					component:require('./pages/kkm/kkm.vue'),
					meta : {
						title :'KKM'
					}
				}

			]
		},
		{
			path:'/kd',
			name:'',
			component:require('./pages/kd/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'kd.create',
					component:require('./pages/kd/create.vue'),
					meta : {
						title:'Tambah Kompetensi Dasar',
					}
				},
				
				{
					path:'edit/:id',
					name:'kd.edit',
					component:require('./pages/kd/edit.vue'),
					meta:{
						title:'Ubah Kompetensi Dasar'
					}
				},
				{
					path:'',
					name:'kd.data',
					component:require('./pages/kd/kd.vue'),
					meta : {
						title :'Kompetensi Dasar'
					}
				},
				{
					path:'pemetaan',
					name:'kd.pemetaan',
					component:require('./pages/kd/pemetaan.vue'),
					meta : {
						title :'Pemetaan Kompetensi Dasar'
					}
				}

			]
		},
		{
			path:'/employee',
			name:'',
			component:require('./pages/employee/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'employee.create',
					component:require('./pages/employee/create.vue'),
					meta : {
						title:'Tambah Karyawan',
					}
				},
				
				{
					path:'edit/:id',
					name:'employee.edit',
					component:require('./pages/employee/edit.vue'),
					meta:{
						title:'Ubah Karyawan'
					}
				},
				{
					path:'edit_profile',
					name:'employee.edit_profile',
					component:require('./pages/employee/edit_profile.vue'),
					meta:{
						title:'Ubah Data Karyawan'
					}
				},
				{
					path:'',
					name:'employee.data',
					component:require('./pages/employee/employee.vue'),
					meta : {
						title :'Karyawan'
					}
				}

			]
		},
		{
			path:'/study_group_setting',
			name:'',
			component:require('./pages/study_group_setting/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'study_group_setting.data',
					component:require('./pages/study_group_setting/study_group_setting.vue'),
					meta : {
						title :'Penetapan Rombel'
					}
				}

			]
		},
		{
			path:'/course_setting',
			name:'',
			component:require('./pages/course_setting/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'course_setting.data',
					component:require('./pages/course_setting/course_setting.vue'),
					meta : {
						title :'Penetapan Mata Pelajaran'
					}
				}

			]
		},		
		{
			path:'/teacher_setting',
			name:'',
			component:require('./pages/teacher_setting/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'teacher_setting.data',
					component:require('./pages/teacher_setting/teacher_setting.vue'),
					meta : {
						title :'Penetapan Mata Pelajaran'
					}
				}

			]
		},	
		{
			path:'/menu',
			name:'',
			component:require('./pages/menu/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'menu.data',
					component:require('./pages/menu/menu.vue'),
					meta : {
						title :'Menu'
					}
				}

			]
		},			
		{
			path:'/role',
			name:'',
			component:require('./pages/role/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'role.data',
					component:require('./pages/role/role.vue'),
					meta : {
						title :'Role'
					}
				},
				{
					path:'role_setting/:id/:name',
					name:'role.role_setting',
					component:require('./pages/role/setting.vue'),
					meta : {
						title :'Role'
					}
				}

			]
		},	
		{
			path:'/permission',
			name:'',
			component:require('./pages/permission/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'permission.data',
					component:require('./pages/permission/permission.vue'),
					meta : {
						title :'Permission'
					}
				}

			]
		},		

		{
			path:'/user',
			name:'',
			component:require('./pages/user/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'user.data',
					component:require('./pages/user/user.vue'),
					meta : {
						title :'User'
					}
				}

			]
		},	

		

		{
			path:'/daily_exercise',
			name:'',
			component:require('./pages/daily_exercise/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'daily_exercise.data',
					component:require('./pages/daily_exercise/daily_exercise.vue'),
					meta : {
						title :'Input Nilai Ulangan Harian Pengetahuan'
					}
				},

			]
		},		


		{
			path:'/daily_exercise_skill',
			name:'',
			component:require('./pages/daily_exercise/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'daily_exercise_skill.data',
					component:require('./pages/daily_exercise/daily_exercise_skill.vue'),
					meta : {
						title :'Input Nilai Ulangan Harian Keterampilan'
					}
				},

			]
		},		

		{
			path:'/quiz_per_kd',
			name:'',
			component:require('./pages/quiz_per_kd/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'quiz_per_kd.data',
					component:require('./pages/quiz_per_kd/quiz_per_kd.vue'),
					meta : {
						title :'Soal Ulangan Harian'
					}
				},
				{
					path:'create',
					name:'quiz_per_kd.create',
					component:require('./pages/quiz_per_kd/create.vue'),
					meta : {
						title:'Tambah Soal Ulangan Harian',
					}
				},
				{
					path:'edit/:id',
					name:'quiz_per_kd.edit',
					component:require('./pages/quiz_per_kd/edit.vue'),
					meta : {
						title:'Tambah Soal Ulangan Harian',
					}
				},
				{
					path:'create_question/:id/:course_id/:kd_id',
					name:'quiz_per_kd.create_question',
					component:require('./pages/quiz_per_kd/create_question.vue'),
					meta : {
						title:'Tambah Soal Ulangan Harian',
					}
				},

			]
		},	

		{
			path:'/quiz_uts',
			name:'',
			component:require('./pages/quiz_per_kd/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				
				{
					path:'',
					name:'quiz_uts',
					component:require('./pages/quiz_per_kd/quiz_uts.vue'),
					meta : {
						title:'Tambah Soal Ulangan PTS',
					}
				},
				{
					path:'create',
					name:'quiz_uts.create_uts',
					component:require('./pages/quiz_per_kd/create_uts.vue'),
					meta : {
						title:'Tambah Soal Ulangan PTS',
					}
				},
				{
					path:'edit_uts/:id',
					name:'quiz_uts.edit_uts',
					component:require('./pages/quiz_per_kd/edit_uts.vue'),
					meta : {
						title:'Tambah Soal Ulangan PTS',
					}
				},
				{
					path:'create_question_uts/:id/:course_id/:kd_id',
					name:'quiz_uts.create_question_uts',
					component:require('./pages/quiz_per_kd/create_question_uts.vue'),
					meta : {
						title:'Tambah Soal Ulangan PTS',
					}
				},

			]
		},

		{
			path:'/quiz_uas',
			name:'',
			component:require('./pages/quiz_per_kd/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				
				{
					path:'',
					name:'quiz_uas',
					component:require('./pages/quiz_per_kd/quiz_uas.vue'),
					meta : {
						title:'Tambah Soal Ulangan PAS',
					}
				},
				{
					path:'create',
					name:'quiz_uas.create_uas',
					component:require('./pages/quiz_per_kd/create_uas.vue'),
					meta : {
						title:'Tambah Soal Ulangan PAS',
					}
				},
				{
					path:'edit_uas/:id',
					name:'quiz_uas.edit_uas',
					component:require('./pages/quiz_per_kd/edit_uas.vue'),
					meta : {
						title:'Tambah Soal Ulangan PAS',
					}
				},
				{
					path:'create_question_uas/:id/:course_id',
					name:'quiz_uas.create_question_uas',
					component:require('./pages/quiz_per_kd/create_question_uas.vue'),
					meta : {
						title:'Tambah Soal Ulangan PAS',
					}
				},

			]
		},	


		{
			path:'/analysis_tematic_daily',
			name:'',
			component:require('./pages/analysis_tematic_daily/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'analysis_tematic_daily.data',
					component:require('./pages/analysis_tematic_daily/analysis_tematic_daily.vue'),
					meta : {
						title :'Analysis Tematic Tema'
					}
				},				
			]
		},	

		{
			path:'/analysis_tematic_uts',
			name:'',
			component:require('./pages/analysis_tematic_uts/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'analysis_tematic_uts.data',
					component:require('./pages/analysis_tematic_uts/analysis_tematic_uts.vue'),
					meta : {
						title :'Analysis Tematic Tema'
					}
				},				
			]
		},	


		{
			path:'/analysis_tematic_uas',
			name:'',
			component:require('./pages/analysis_tematic_uas/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'analysis_tematic_uas.data',
					component:require('./pages/analysis_tematic_uas/analysis_tematic_uas.vue'),
					meta : {
						title :'Analysis Tematic Tema'
					}
				},				
			]
		},	

		{
			path:'/input_analysis',
			name:'',
			component:require('./pages/input_analysis/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'input_analysis.data',
					component:require('./pages/input_analysis/input_analysis.vue'),
					meta : {
						title :'Soal Ulangan Harian'
					}
				},
			]
		},


		{
			path: '/input_analysis_uts',
			component:input_analysis_uts,
			name:'input_analysis_uts',
			meta: {
				title: 'Input Analysis UTS'
			}
		},


		{
			path: '/input_analysis_uas',
			component:input_analysis_uas,
			name:'input_analysis_uas',
			meta: {
				title: 'Input Analysis UAS'
			}
		},


		{
			path:'input_analysis_uts',
			name:'input_analysis.input_analysis_uts',
			component:require('./pages/input_analysis/index.vue'),
			meta : {
				title :'Soal Ulangan Harian'
			},
			children:[
				{
					path:'input_analysis_uts',
					name:'input_analysis_uts.data',
					component:require('./pages/input_analysis/input_analysis_uts.vue'),
					meta : {
						title :'Input Absensi Siswa'
					}
				}

			]
		},

		
		{
			path:'/absensi',
			name:'',
			component:require('./pages/absensi/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'absensi.data',
					component:require('./pages/absensi/absensi.vue'),
					meta : {
						title :'Input Absensi Siswa'
					}
				}

			]
		},	

		{
			path:'/raport_pas',
			name:'',
			component:require('./pages/raport/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'raport_pas.data',
					component:require('./pages/raport/raport.vue'),
					meta : {
						title :'Raport PAS Siswa'
					},
				},
				{
					path:'print_pas',
					name:'raport_pas.print_pas',
					component:require('./pages/raport/print_raport.vue'),
					meta : {
						title :'Raport PAS Siswa'
					}
				}

			]
		},	

		{
			path:'/raport_pts',
			name:'',
			component:require('./pages/raport_pts/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'raport_pts.data',
					component:require('./pages/raport_pts/raport_pts.vue'),
					meta : {
						title :'Raport PTS Siswa'
					},
				},
				{
					path:'/raport_pts/print_pts/:id/:name/:study_group_id/:class_grade_id',
					name:'raport_pts.print_pts',
					component:require('./pages/raport_pts/print_raport_pts.vue'),
					meta : {
						title :'Raport PTS Siswa'
					}
				}

			]
		},	

		{
			path:'/sum_absensi',
			name:'',
			component:require('./pages/sum_absensi/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'sum_absensi.data',
					component:require('./pages/sum_absensi/sum_absensi.vue'),
					meta : {
						title :'Total Absensi'
					}
				}

			]
		},	

		{
			path:'/physical_student',
			name:'',
			component:require('./pages/physical_student/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'physical_student.data',
					component:require('./pages/physical_student/physical_student.vue'),
					meta : {
						title :'Input Fisik Siswa'
					}
				}

			]
		},		


		{
			path:'/extracurricular',
			name:'',
			component:require('./pages/extracurricular/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'extracurricular.data',
					component:require('./pages/extracurricular/extracurricular.vue'),
					meta : {
						title :'Input Extracurricular'
					}
				}

			]
		},	

		{
			path:'/prestation',
			name:'',
			component:require('./pages/prestation/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'prestation.data',
					component:require('./pages/prestation/prestation.vue'),
					meta : {
						title :'Input Prestasi'
					}
				}

			]
		},	

		{
			path:'/observasi',
			name:'',
			component:require('./pages/observasi/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'observasi.data',
					component:require('./pages/observasi/observasi.vue'),
					meta : {
						title :'Input observasi'
					}
				}

			]
		},	

		{
			path:'/teacher_note',
			name:'',
			component:require('./pages/teacher_note/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'teacher_note.data',
					component:require('./pages/teacher_note/teacher_note.vue'),
					meta : {
						title :'Input Catatan Guru'
					}
				}

			]
		},	

		{
			path:'/pd',
			name:'',
			component:require('./pages/pd/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'pd.data',
					component:require('./pages/pd/pd.vue'),
					meta : {
						title :'Input Penilaian Diri Sendiri '
					}
				}

			]
		},

		{
			path:'/tahsin',
			name:'',
			component:require('./pages/tahsin/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'tahsin.data',
					component:require('./pages/tahsin/tahsin.vue'),
					meta : {
						title :'Input Nilai Tahsin '
					}
				}

			]
		},	

		{
			path:'/tahfizh',
			name:'',
			component:require('./pages/tahfizh/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'tahfizh.data',
					component:require('./pages/tahfizh/tahfizh.vue'),
					meta : {
						title :'Input Nilai Tahsin '
					}
				}

			]
		},	


		{
			path:'/personality',
			name:'',
			component:require('./pages/personality/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'personality.data',
					component:require('./pages/personality/personality.vue'),
					meta : {
						title :'Input Nilai Personality '
					}
				}

			]
		},	

		{
			path:'/friendly_value',
			name:'',
			component:require('./pages/friendly_value/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'friendly_value.data',
					component:require('./pages/friendly_value/friendly_value.vue'),
					meta : {
						title :'Input Penilaian Antar Teman'
					}
				}

			]
		},	


		{
			path:'/structure_tematic',
			name:'',
			component:require('./pages/structure_tematic/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'structure_tematic.create',
					component:require('./pages/structure_tematic/create.vue'),
					meta : {
						title:'Tambah Struktur Tematik',
					}
				},
				
				{
					path:'edit/:id',
					name:'structure_tematic.edit',
					component:require('./pages/structure_tematic/edit.vue'),
					meta:{
						title:'Ubah Struktur Tematik'
					}
				},
				{
					path:'',
					name:'structure_tematic.data',
					component:require('./pages/structure_tematic/structure_tematic.vue'),
					meta : {
						title :'Struktur Tematik'
					}
				},
				{
					path:'detail/:id',
					name:'structure_tematic.detail',
					component:require('./pages/structure_tematic/detail.vue'),
					meta : {
						title :'Detail Struktur Tematik'
					}
				},
				{
					path:'create_question_daily/:id/:st_id',
					name:'structure_tematic.create_question_daily',
					component:require('./pages/structure_tematic/create_question_daily.vue'),
					meta : {
						title:'Tambah Soal UTS',
					}
				},
				{
					path:'create_question_uts/:id/:st_id',
					name:'structure_tematic.create_question_uts',
					component:require('./pages/structure_tematic/create_question_uts.vue'),
					meta : {
						title:'Tambah Soal UTS',
					}
				},
				{
					path:'create_question_uas/:id/:st_id',
					name:'structure_tematic.create_question_uas',
					component:require('./pages/structure_tematic/create_question_uas.vue'),
					meta : {
						title:'Tambah Soal UTS',
					}
				},
				{
					path:'set_daily/:id',
					name:'set_daily',
					component:require('./pages/structure_tematic/set_daily.vue'),
					meta : {
						title:'Tambah Soal UTS',
					}
				},
				{
					path:'set_uts/:id',
					name:'set_uts',
					component:require('./pages/structure_tematic/set_uts.vue'),
					meta : {
						title:'Tambah Soal UTS',
					}
				},
				{
					path:'set_uas/:id',
					name:'set_uas',
					component:require('./pages/structure_tematic/set_uas.vue'),
					meta : {
						title:'Tambah Soal UAS',
					}
				},

			]
		},
		//add by yudiana for foundation
		{
			path:'/foundation',
			name:'',
			component:require('./pages/foundation/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'create',
					name:'foundation.create',
					component:require('./pages/foundation/create.vue'),
					meta : {
						title:'Tambah Yayasan',
					}
				},
				
				{
					path:'',
					name:'foundation.data',
					component:require('./pages/foundation/yayasan.vue'),
					meta : {
						title :'Yayasan'
					}
				}

			]
		},
		//end

		{
			path:'/class_advisor',
			name:'',
			component:require('./pages/class_advisor/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'class_advisor.data',
					component:require('./pages/class_advisor/class_advisor.vue'),
					meta : {
						title :'Penetapan Mata Pelajaran'
					}
				}

			]
		},	

		{
			path:'/m_extracurricular',
			name:'',
			component:require('./pages/parlookup/m_extracurricular/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'m_extracurricular.data',
					component:require('./pages/parlookup/m_extracurricular/m_extracurricular.vue'),
					meta : {
						title :'Penetapan Ekstrakurikuler'
					}
				},
				{
					path:'edit/:id',
					name:'m_extracurricular.edit',
					component:require('./pages/parlookup/m_extracurricular/edit.vue'),
					meta:{
						title:'Ubah Ekstrakurikuler'
					}
				},
				{
					path:'create',
					name:'m_extracurricular.create',
					component:require('./pages/parlookup/m_extracurricular/create.vue'),
					meta : {
						title :'Master Ekstrakurikuler'
					}
				}

			]
		},

		{
			path:'/m_fisik',
			name:'',
			component:require('./pages/parlookup/m_fisik/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'m_fisik.data',
					component:require('./pages/parlookup/m_fisik/m_fisik.vue'),
					meta : {
						title :'Master Fisik'
					}
				},
				{
					path:'edit/:id',
					name:'m_fisik.edit',
					component:require('./pages/parlookup/m_fisik/edit.vue'),
					meta:{
						title:'Ubah Master Fisik'
					}
				},
				{
					path:'create',
					name:'m_fisik.create',
					component:require('./pages/parlookup/m_fisik/create.vue'),
					meta : {
						title :'Master Fisik'
					}
				}

			]
		},

		{
			path:'/m_tahsin',
			name:'',
			component:require('./pages/parlookup/m_tahsin/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'m_tahsin.data',
					component:require('./pages/parlookup/m_tahsin/m_tahsin.vue'),
					meta : {
						title :'Master Tahsin'
					}
				},
				{
					path:'edit/:id',
					name:'m_tahsin.edit',
					component:require('./pages/parlookup/m_tahsin/edit.vue'),
					meta:{
						title:'Ubah Tahsin'
					}
				},
				{
					path:'create',
					name:'m_tahsin.create',
					component:require('./pages/parlookup/m_tahsin/create.vue'),
					meta : {
						title :'Master Tahsin'
					}
				}

			]
		},


		{
			path:'/m_tahfizh',
			name:'',
			component:require('./pages/parlookup/m_tahfizh/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'m_tahfizh.data',
					component:require('./pages/parlookup/m_tahfizh/m_tahfizh.vue'),
					meta : {
						title :'Master Tahfizh'
					}
				},
				{
					path:'edit/:id',
					name:'m_tahfizh.edit',
					component:require('./pages/parlookup/m_tahfizh/edit.vue'),
					meta:{
						title:'Ubah Tahfizh'
					}
				},
				{
					path:'create',
					name:'m_tahfizh.create',
					component:require('./pages/parlookup/m_tahfizh/create.vue'),
					meta : {
						title :'Master Tahfizh'
					}
				}

			]
		},


		{
			path:'/m_spiritual',
			name:'',
			component:require('./pages/parlookup/m_observasi_spiritual/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'m_spiritual.data',
					component:require('./pages/parlookup/m_observasi_spiritual/m_observasi_spiritual.vue'),
					meta : {
						title :'Master Observasi Spiritual'
					}
				},
				{
					path:'edit/:id',
					name:'m_spiritual.edit',
					component:require('./pages/parlookup/m_observasi_spiritual/edit.vue'),
					meta:{
						title:'Ubah Observasi Spiritual'
					}
				},
				{
					path:'create',
					name:'m_spiritual.create',
					component:require('./pages/parlookup/m_observasi_spiritual/create.vue'),
					meta : {
						title :'Master Observasi Spiritual'
					}
				}

			]
		},

		{
			path:'/m_sosial',
			name:'',
			component:require('./pages/parlookup/m_observasi_sosial/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'m_sosial.data',
					component:require('./pages/parlookup/m_observasi_sosial/m_observasi_sosial.vue'),
					meta : {
						title :'Master Observasi Sosial'
					}
				},
				{
					path:'edit/:id',
					name:'m_sosial.edit',
					component:require('./pages/parlookup/m_observasi_sosial/edit.vue'),
					meta:{
						title:'Ubah Observasi Sosial'
					}
				},
				{
					path:'create',
					name:'m_sosial.create',
					component:require('./pages/parlookup/m_observasi_sosial/create.vue'),
					meta : {
						title :'Master Observasi Sosial'
					}
				}

			]
		},


		{
			path:'/summary_value',
			name:'',
			component:require('./pages/summary_value/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'summary_value.data',
					component:require('./pages/summary_value/summary_value.vue'),
					meta : {
						title :'Rekapitulasi Per Mata Pelajaran '
					}
				},
				{
					path:'view_summary/:id/:class_grade_id/:study_group_id',
					name:'summary_value.view_summary',
					component:require('./pages/summary_value/view_summary.vue'),
					meta:{
						title:'Lihat Rekapitulasi'
					}
				},
			]
		},

		{
			path:'/ledger_pas',
			name:'',
			component:require('./pages/ledger_pas/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'ledger_pas.data',
					component:require('./pages/ledger_pas/ledger_pas.vue'),
					meta : {
						title :'Ledger PAS '
					}
				},
				{
					path:'print_ledger/:id/:class_grade_id',
					name:'ledger_pas.print_ledger',
					component:require('./pages/ledger_pas/print_ledger.vue'),
					meta : {
						title :'Ledger PAS'
					}
				},
			]
		},

		{
			path:'/ledger_pts',
			name:'',
			component:require('./pages/ledger_pts/index.vue'),
			meta: {
				requiresAuth: true
			},
			children:[
				{
					path:'',
					name:'ledger_pts.data',
					component:require('./pages/ledger_pts/ledger_pts.vue'),
					meta : {
						title :'Ledger PTS '
					}
				},
				{
					path:'print_ledger/:id/:class_grade_id',
					name:'ledger_pts.print_ledger',
					component:require('./pages/ledger_pts/print_ledger.vue'),
					meta : {
						title :'Ledger PTS'
					}
				},
			]
		},


		{
			path:'/',
			name:'home',
			component:home,
			meta: {
				requiresAuth: true
			}
		},
		{
			path:'/dashboard',
			name:'home',
			component:home,
			meta: {
				requiresAuth: true
			}
		},
		{
			path:'/home',
			name:'',
			component:home,
			meta: {
				requiresAuth: true
			}
		},
		{
			path: '/login',
			component: login,
			name:'login',
			meta: {
				title: 'Page - Login'
			}
		},
	]
})


router.beforeEach((to,from,next)=>{
	store.commit('CLEAR_ERRORS');
	document.title = to.meta.title
	// console.log(record=>record.meta.requiresAuth);
	if(to.matched.some(record=>record.meta.requiresAuth)){
		let auth = store.getters.isAuth
		if(!auth){
			next({name:'login'})
		}else{
			// alert('tes1');
			next()
		}
	}else{
		next()
	}
})

export default router