<template>
    <div>
        <loading/>    
        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4> Input Analisis PAS </h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">

                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item">  Input Analisis PAS
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- Header end -->



        <div class="row">
            <div class="col-sm-12">
                <!-- Basic Table starts -->
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="input_analysis.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                        <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="input_analysis.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                    </div>
                                </div>


                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                        <select class="form-control" id="study_group_id" name="study_group_id" @change="get_course_($event)" v-model="input_analysis.study_group_id">
                                            <option value=""> - Pilih Rombel - </option>
                                            <option  v-for="(item, index) in study_group_all.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Mata Pelajaran</label>
                                        <select class="form-control" id="course_id" name="course_id" @change="get_data_setting($event)" v-model="input_analysis.course_id">
                                            <option value=""> - Pilih Mata Pelajaran - </option>
                                            <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course_id"> {{item.course_name}} </option>
                                        </select>
                                    </div>
                                </div>


                            </div>
                        </div>

                    </div>

                </div>
                <!-- Basic Table ends -->
            </div>
        </div>

        <!-- Tables start -->
        <!-- Row start -->
        <div class="row" style="" v-if="div_seen" >
            <div class="col-sm-12">
                <!-- Basic Table starts -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h5 class="card-header-text"> Input Analisis PAS</h5>
                            <div class="m-t-2">
                                <button class="btn btn-primary" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                                <button class="btn btn-success" @click="uploadExcel()"> <i class="fa fa-upload"></i> Upload Nilai  </button>
                            </div>
                        </div>

                    </div>
                    <div class="card-block" id="table_input">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <div class="col-sm-12 table-responsive">
								<table ref="table" id="loremTable" summary="Input analisis" class="table table-bordered m-t-2">
									<thead>
										<tr>
											<th  rowspan="4"  style="text-align:center" >No</th>
											<th  rowspan="4"  style="text-align:center"> Action </th>
											<th  rowspan="4"  style="text-align:center"> Nama </th>
											<th :colspan="total_question"  style="text-align:center">Bobot</th>
											<td rowspan="2">{{total_bobot}}</td>
										</tr>
										<tr >
											<td v-for="ll,index in list_question">{{ll.quality_question}}</td>
										</tr>
										<tr>
											<th :colspan="total_question" style="text-align:center"> Soal </th>
											<td rowspan="2">Nilai Akhir</td>
										</tr>
										<tr>
											<td  v-for="nn,index in list_question">{{nn.number_question}}</td>
										</tr>
									</thead>
									<tbody>
										<tr v-for="row,index in data_show">
											<td>{{index+1}}</td>
											<td><!-- <button class="btn btn-success" @click="tambah(row.student_name,row.student_id)" title ="tambah"> <i class="fa fa-plus"></i> </button> --></td>
											<td>{{row.student_name}}</td>
											<td v-for="nn,index in list_question" >
												<div  v-for="ia,id in val_input_analysis" v-if="ia.student_id === row.student_id && ia.number_question === nn.number_question && ia.kd_id == nn.kd_id ">
													{{ia.value_quality}}
												</div>
											</td>
                                            <td>
                                                <div v-for="row_,ind in var_stu" v-if="ind == row.student_id">
                                                    {{row_}}
                                                </div>
                                            </td>

										</tr>

									</tbody>
								</table>

							</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Basic Table ends -->
            </div>
        </div>




        <!-- Modal -->
        <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle"> Upload File </h5>
                    </div>
                    <div class="modal-body">
                        <form id="form-all">
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <input type="file" id="file" ref="file" v-on:change="onChangeFileUpload()" class="form-control">
                                </div>
                                <!-- <input type="file" name="file_excel" class="form-control"> -->
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="close_modal()">Close</button>
                        <button type="button" class="btn btn-primary" @click="saveUpload()" id="btn-upload"> <i class="fa fa-upload"></i> Upload</button>
                    </div>
                </div>
            </div>
        </div>



		<div class="modal fade" id="modal-tambah" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle"> Tambah Input Analisis {{student_name}}   </h5>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-12">
								<loading_overlay :active.sync="loading_overlay"></loading_overlay>
								<div v-for="dt,index in list_form">
									<div class="col-sm-2">
										<label for="exampleInputEmail1" class="form-control-label">No {{index}} -  {{dt.bobot}}  </label>
										<input type="text" name="" @change="insert_analisis($event,student_id,index,dt.kd,'uas',dt.input_analysis_id)" class="form-control" :value="dt.value">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" @click="close_modal_tambah()">Close</button>
					</div>
				</div>
			</div>
		</div>



</div>

</template>
<script>
import {mapActions,mapState,mapMutations} from 'vuex'
import $axios from '../../api.js';
import store from '../../store.js';
import loading from '../../components/loading.vue';

export default{
    name:'tes',
    components: {
        'loading':loading,
    },
    data(){
        return {
            loading_overlay:true,
            result_view:'',
            student_name:'',
			student_id:'',
            total_bobot:0,
            list_input:false,
            errors : [],    
            data_show:[],
            list_kd : [],
            loading:true,
            div_seen:false,
            // list_class_grade:[],
            list_study_group:[],
            list_course_:[],
            list_question : [],
			list_form : [],
            total_question:'',
            file_excel:'',
            input_analysis:{
                unit_id:localStorage.getItem('unit_id'),
                class_grade_id:localStorage.getItem('class_grade_id'),
                study_group_id:localStorage.getItem('study_group_id'),
                course_id:localStorage.getItem('course_id'),
                kd_id:'',
                type_question:'uas'
            },
            data_post:{},
            list_student_q:[],
            var_stu:[]
        }
    },

    created(){
        this.get_unit();  
        this.get_class_grade_all();  
        this.get_study_group_all(this.input_analysis.class_grade_id);  
        this.get_course_(this.input_analysis.study_group_id);  
        this.get_data_setting();  
        // this.get_data_kd_course_(this.input_analysis.course_id);  
    },
    computed:{
        ...mapState('application', {
            unit:state=>state.unit,
            class_grade:state=>state.class_grade,
            course:state=>state.course,
            data_kd_course:state=>state.data_kd_course,
            study_group:state=>state.study_group,
            course_study_group:state=>state.course_study_group,
            list_class_grade:state=>state.class_grade,
            study_group_all:state=>state.study_group_all,

        }),
    },
    methods:{

        ...mapActions('application',['get_unit','get_data_kd_course','get_class_grade','get_study_group','get_class_grade_all','get_study_group_all']),

        get_class_(e){
            this.get_class_grade(event.target.value).then(()=>{                    
                this.list_class_grade = this.class_grade;
            });                
        },
        get_study_group_(e){
            this.get_study_group_all(event.target.value);
                
        },
        get_course_(e){


            var app = this;
            if(typeof e == 'undefined')
            {
                e = e.target.value;
            }
            else
            {
                e = app.input_analysis.study_group_id;  
            }
            $axios.get('/get_course_per_kd?study_group_id='+e+'&class_grade_id='+this.input_analysis.class_grade_id+'&type_kd=non_tema&type_question=uas')
            .then(function(resp){
                app.list_course_ = resp.data.data;
            }).catch(function(resp){

            })   
            app.get_data_setting(e);
        },

       
        async get_data_setting(){

           
            var app =this;
            app.div_seen= true;


		    await app.reload_table(app.input_analysis.study_group_id,app.input_analysis.class_grade_id,app.input_analysis.course_id)
		
		
        },
        onlyNumber ($event) {
           let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
               if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                  $event.preventDefault();
              }
          },

          exportTableToExcel(table, name=''){
            var app = this;
            var study_group_id = $('#study_group_id').val();
            var kd_id = $('#kd_id').val();
            window.open('input_analysis_uas/export?course_id='+app.input_analysis.course_id+'&study_group_id='+study_group_id+'&type_question='+app.input_analysis.type_question+'&class_grade_id='+app.input_analysis.class_grade_id);

        },
        uploadExcel(){
            $('#modal').modal('show');
        },
        saveUpload(){
            $('#btn-upload').attr('disabled',true);
            $('#loading_show').show();
            var app = this;
            let formData = new FormData(); 
            formData.append('file_excel', app.file_excel);               
            $axios.post('/input_analysis_kd_uas',formData,
            {

                headers: {

                    'Content-Type': 'multipart/form-data'
                }
            }
            )
            .then(function(resp){
                $axios.get('get_study_group_setting?study_group_id='+app.input_analysis.study_group_id)
                .then(function(resp){
                    app.data_show = resp.data;
                    app.data_post = resp.data;
                    app.loading=false;  

                }).
                catch(function(resp){
                    app.loading=false;
                    $('#loading_show').hide();
                })

                $axios.get('get_list_question_n_total_kd_uas?course_id='+app.input_analysis.course_id+'&type_question='+app.input_analysis.type_question+'&class_grade_id='+app.input_analysis.class_grade_id)
                .then(function(resp){
                    var tot = 0;
                    app.list_question = resp.data.list_question; 
                    app.total_bobot = resp.data.total;
                    $axios.post('send_param_analysis_uas_kd',{
                        params:{
                            'data_show' : app.data_show,
                            'list_question' :app.list_question,
                            'total_bobot':app.total_bobot,
                            'type_page':'input_page'
                        }
                    })
                    .then(function(resp){
                        app.result_view = resp.data.data_all;
                        $('#loading_show').hide();
                        $('#btn-upload').attr('disabled',false);
                    }).
                    catch(function(resp){
                        $('#loading_show').hide();
                    })
                }).
                catch(function(resp){
                    app.loading=false;
                    $('#loading_show').hide();
                })

                app.close_modal();
            }).catch(function(resp){
                swal('Error','File Masih Ada Kesalahan','error');
                $('#loading_show').hide();
            })
        },
        onChangeFileUpload(){
            this.file_excel = this.$refs.file.files[0];
        },
        close_modal(){
            $('#form-all')[0].reset();
            $('#modal').modal('hide');
        },

        tambah(nama,id){
			var app = this;
			app.student_name = nama;
			app.student_id = id;
			$("#modal-tambah").modal('show');
			app.get_value(id)
			
		},
		reload_table(study_group_id,class_grade_id,course_id){
			var app = this;
			$('#loading_show').show();

			$axios.get('/load_data?type=uas&study_group_id='+study_group_id+'&class_grade_id='+class_grade_id+'&course_id='+course_id)
			.then(function(resp){
				app.data_show = resp.data.result;
				app.list_question = resp.data.list_question;
				app.total_question = resp.data.list_question.length;
				app.total_bobot = resp.data.total;
				app.val_input_analysis = resp.data.val_input_analysis;
				app.var_stu = resp.data.var_stu;

				$('#loading_show').hide();
				
			})
			.catch(function(resp){
				$('#loading_show').hide();
				
			})
		},

		close_modal_tambah(){
			$('#form-all')[0].reset();
			$('#modal-tambah').modal('hide');
			var app = this;
			app.reload_table(app.input_analysis.study_group_id,app.input_analysis.class_grade_id,app.input_analysis.course_id); 
		},
		get_value(student_id){
			var app = this;
				
			$axios.get('/get_value_analisis',{
				params: {
					'student_id':student_id,
					'course_id' : app.input_analysis.course_id,
					'class_grade_id' : app.input_analysis.class_grade_id,
					'type':'uas',
				}
				})
				.then(function(resp){
					// console.log(resp);
					app.loading_overlay=false;
					app.list_form = resp.data.data;
				}).
				catch(function(resp){
					app.loading_overlay=false;
				})         
				app.loading_overlay=true;
		},
	    insert_analisis(e,student_id,question,kd_id,type,input_analysis_id){
			
	        $axios.post('/input_form_analisis',{
	        	'value_quality': e.target.value,
	        	'student_id':student_id,
	        	'number_question' : question,
	        	'kd_id' : kd_id,
	        	'type':type,
                'input_analysis_id':input_analysis_id,
                'total_bobot':this.total_bobot,

	        })
	        .then(function(resp){

	        }).
	        catch(function(resp){
	        	
	        })             
	    },


    },
}

</script>