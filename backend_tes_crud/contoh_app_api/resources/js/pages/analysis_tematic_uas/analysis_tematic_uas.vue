<template>
    <div>
        <loading/>    
        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4>  Input Analisis TEMA PAS </h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item">  Input Analisis TEMA PAS
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
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="analysis_tematic_uas.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                        <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="analysis_tematic_uas.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                    </div>
                                </div>


                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                        <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_tematik($event)" v-model="analysis_tematic_uas.study_group_id">
                                            <option value=""> - Pilih Rombel - </option>
                                            <option  v-for="(item, index) in list_study_group.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Tematik</label>
                                        <select class="form-control" id="structure_tematic_id" name="structure_tematic_id" @change="get_data_setting($event)" v-model="analysis_tematic_uas.structure_tematic_id">
                                            <option value=""> - Pilih Tematik - </option>
                                            <option  v-for="(item, index) in list_tematic.data " :key="index" :value="item.structure_tematic_id"> {{item.structure_tematic_name}} </option>
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
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" @click="close_modal()">Close</button>
                <button type="button" class="btn btn-primary" @click="saveUpload()" id="upload_btn"> <i class="fa fa-upload"></i> Upload</button>
            </div>
        </div>
    </div>
</div>


<!-- Tables start -->
<!-- Row start -->
<div class="row" style="display: none" id="row_setting">
    <div class="col-sm-12">
        <!-- Basic Table starts -->
        <div class="card">
            <div class="card-header">
                <div>
                    <h5 class="card-header-text"> Input Analisis Tema PAS</h5>
                    <div class="m-t-2">
                        <button class="btn btn-primary" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                        <button class="btn btn-success" @click="uploadExcel()"> <i class="fa fa-upload"></i> Upload Nilai  </button>
                    </div>
                </div>

            </div>
            <div class="card-block" id="table_input">
                <div class="row">
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
                                        <div  v-for="ia,id in val_input_analysis" v-if="ia.student_id === row.student_id && ia.number_question === nn.number_question ">
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
        <!-- Basic Table ends -->
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
										<input type="text" name="" @change="insert_analisis($event,student_id,index,dt.kd,'uas',dt.input_analysis_tema_id)" class="form-control" :value="dt.value">
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
import $axios from '../../api.js'
import loading from '../../components/loading.vue';

export default{
    name:'create',
    components: {
        'loading':loading,
    },
    data(){
        return {
			loading_overlay:true,
            errors : [],
            result_view:'',
            list_input:false,
            list_kd : [],
            student_name:'',
			student_id:'',
            total_question:'',
            total_bobot:0,
            // list_class_grade:[],
            list_study_group:[],
            list_course_:[],
			list_question : [],
			list_form : [],
            list_tematic:[],
            data_show:[],
            analysis_tematic_uas:{
                unit_id:localStorage.getItem('unit_id'),
                class_grade_id:localStorage.getItem('class_grade_id'),
                study_group_id:localStorage.getItem('study_group_id'),
                structure_tematic_id:'',
                course_id:'',
                kd_id:'',
            },
            list_course_:[],
            data_post:{},
            var_stu:[]

        }
    },

    created(){
        this.get_unit();
        this.get_class_grade_all();  
        this.get_study_group_all(this.analysis_tematic_uas.class_grade_id);  
        this.get_data_tematik();
    },
    computed:{
        ...mapState('application', {
            unit:state=>state.unit,
            class_grade:state=>state.class_grade,
            course:state=>state.course,
            data_kd_course:state=>state.data_kd_course,
            study_group:state=>state.study_group,
            course_study_group:state=>state.course_study_group,
            tematic_group:state=>state.tematic_group,
            list_class_grade:state=>state.class_grade,
            study_group_all:state=>state.study_group_all,
        }),
    },
    methods:{
     ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_tematic_group','get_class_grade_all','get_study_group_all']),

            get_class_(e){
                this.get_class_grade(e.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            get_study_group_(e){
                this.get_study_group_all(event.target.value);                          
            },

            get_data_tematik(){
                this.get_tematic_group(this.analysis_tematic_uas.class_grade_id).then(()=>{                    
                    this.list_tematic = this.tematic_group.data;
                });  
                this.get_data_setting();
            },

            async get_data_setting(e){
                $('#row_setting').show();
                $('#loading_show').show();
                var kd_id = $('#kd_id').val();
                var app =this;

                await app.reload_table(app.analysis_tematic_uas.study_group_id,app.analysis_tematic_uas.structure_tematic_id);
            },
            
            exportTableToExcel(table, name=''){
                var study_group_id = $('#study_group_id').val();
                var kd_id = $('#kd_id').val();
                window.open('analysis_tematic_uas/export?study_group_id='+study_group_id+'&structure_tematic_id='+this.analysis_tematic_uas.structure_tematic_id);
            },
            uploadExcel(){
                $('#modal').modal('show');
            },
            saveUpload(){
                $('#loading_show').show();
                $('#modal').modal('hide');                
                $('#upload_btn').attr("disabled",true);
                var app = this;
                let formData = new FormData(); 
                formData.append('file_excel', app.file_excel);               
                $axios.post('/analysis_tematic_uas_upload',formData,
                {

                    headers: {

                        'Content-Type': 'multipart/form-data'
                    }
                })
                .then(function(resp){
                    app.reload_table(app.analysis_tematic_uas.study_group_id,app.analysis_tematic_uas.structure_tematic_id); 
                    app.close_modal();
                    $('#upload_btn').attr("disabled",false);
            }).catch(function(resp){
                swal('Error','File Masih Kosong','error');
                $('#loading_show').hide();
                $('#upload_btn').attr("disabled",false);
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
		reload_table(study_group_id,structure_tematic_id){
			var app = this;
            $('#loading_show').show();
            console.log('arief');
            console.log(structure_tematic_id);
            // alert(structure_tematic_id);

			$axios.get('/load_data_tema?type=uas&study_group_id='+study_group_id+'&structure_tematic_id='+structure_tematic_id)
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
			app.reload_table(app.analysis_tematic_uas.study_group_id,app.analysis_tematic_uas.structure_tematic_id); 
		},
		get_value(student_id){
			var app = this;
				
			$axios.get('/get_value_analisis_tema',{
				params: {
					'student_id':student_id,
					'structure_tematic_id' : app.analysis_tematic_uas.structure_tematic_id,
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
	    insert_analisis(e,student_id,question,kd_id,type,input_analysis_tema_id){
			
	        $axios.post('/input_form_analisis_tema',{
	        	'value_quality': e.target.value,
	        	'student_id':student_id,
	        	'number_question' : question,
	        	'kd_id' : kd_id,
	        	'type':type,
                'structure_tematic_id': this.analysis_tematic_daily.structure_tematic_id,
                'input_analysis_tema_id':input_analysis_tema_id

	        })
	        .then(function(resp){

	        }).
	        catch(function(resp){
	        	
	        })             
	    },

    },
}
</script>