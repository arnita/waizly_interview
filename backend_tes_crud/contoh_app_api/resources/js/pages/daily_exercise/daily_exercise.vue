<template>
    <div>
        <div id="loading_show" class="loader-overlay-back" style="display:none">
            <div class="loader"><img src="assets/images/1.gif"></div> 
        </div>


        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4>Kelola Nilai Ulangan Daily Test Pengetahuan </h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item">Kelola Nilai Ulangan Daily Test Pengetahuan
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
                                        <select class="form-control" id="unit_id" name="unit_id" v-model="daily_exercise.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                        <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="daily_exercise.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                        <select class="form-control" id="study_group_id"   name="study_group_id" @change="get_course_($event)" v-model="daily_exercise.study_group_id">
                                            <option value=""> - Pilih Rombel - </option>
                                            <option  v-for="(item, index) in study_group_all.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Mata Pelajaran</label>
                                        <select class="form-control" id="course_id" name="course_id" v-model="daily_exercise.course_id" @change="get_daily_exercise($event)" >
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



        <div class="row" style="" v-if="div_seen" >
            <div class="col-sm-12">
                <!-- Basic Table starts -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h5 class="card-header-text"> Kelola Nilai Ulangan Daily Test Pengetahuan  </h5>
                            <div class="m-t-2">
                                <button class="btn btn-primary" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                                <button class="btn btn-success" @click="uploadExcel()"> <i class="fa fa-upload"></i> Upload Nilai  </button>
                            </div>
                        </div>

                    </div>
                    <div class="card-block" id="table_input">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <div v-html="result_view">

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
                  <button type="button" class="btn btn-primary" @click="saveUpload()"> <i class="fa fa-upload"></i> Upload</button>
              </div>
          </div>
      </div>
  </div>



  <!-- Row end -->
  <!-- Row end -->
  <!-- Tables end -->
</div>


</template>


<script>
import {mapActions,mapState,mapMutations} from 'vuex'
import axios  from '../../api.js';
import store from '../../store.js'

import Vue from 'vue';
export default{
    data:function(){
        return {
            data_show:[],
            data_course:[],
            data_show_modal:[],
            data_kd:[],
            list_course:[],
            // list_class_grade:[],
            // list_study_group:[],
            list_course_:[],
            data_tematic:[],
            looping_uh_skill :['U','P1','P2'],
            looping_uh :[1,2,3,4],
            loading:true,
            div_seen:false,
            search:'',
            search_modal:'',
            result_view:'',
            title:'',
            score:'',
            asem:[],
            daily_exercise:{
                unit_id:localStorage.getItem('unit_id'),
                class_grade_id:localStorage.getItem('class_grade_id'),
                study_group_id:localStorage.getItem('study_group_id'),
                course_id:localStorage.getItem('course_id'),
                kd_type:'',
            },
            score_student:[ [ ] ],
            data_post:{},
            data_post_course:{},
        }
    },

      created(){
        this.get_unit();  
        this.get_class_grade_all();  
        this.get_study_group_all(this.daily_exercise.class_grade_id);  
        this.get_course_(this.daily_exercise.study_group_id);  
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

        ...mapActions('application',['get_unit','get_data_kd_course','get_class_grade','get_study_group','get_class_grade_all','get_study_group_all','get_course_study_group']),


        get_value(dt_uh,kd_detail_id,student_id,structure_tematic_id){

            var course = $('#course_id').val();
            var kd_tp = $('#kd_type').val();
            var app =this;
            let input_score;
            const token = store.state.token
            $.ajax({
                url: '/api/get_value',
                type:'GET',
                headers:{
                    'Content-Type': 'application/json',
                    'Authorization':`Bearer ${token}`,
                },
                beforeSend(){
                    $('#loading_show').show();
                },
                async: false,
                data:{
                    'uh':dt_uh,
                    'kd_detail_id':kd_detail_id,
                    'student_id' : student_id,
                    'structure_tematic_id': structure_tematic_id,
                            // 'course_id' :course,
                    'kd_type' : app.daily_exercise.kd_type  
                        },
                        success:function(resp){

                          return input_score = resp.data;
                      }
                  })
            .done(function(){
                $('#loading_show').hide();
            })
            return input_score;
        },
         
        daily_exercise_student(event,dt_uh,kd_detail_id,student_id,structure_tematic_id){
            var course = $('#course_id').val();
            var kd_tp = $('#kd_type').val();
            if(course_id == '' || kd_tp == '' )
            {
                return swal('Error','Mata pelajaran atau type kd belum di pilih','error'); 
            }
            var app =this;
            axios.post('daily_exercise',{
                'score': event.target.value,
                'uh':dt_uh,
                'kd_detail_id':kd_detail_id,
                'student_id' : student_id,
                'structure_tematic_id': structure_tematic_id,
                    // 'course_id' :course,
                    'kd_type' : app.daily_exercise.kd_type
                })
            .then(function(resp){

            }).
            catch(function(resp){
                app.loading=false;
            })                
        },
        onlyNumber ($event) {
         let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
               if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                  $event.preventDefault();
              }
          },
          selectAll_(){
            this.selected =[];
            if(!this.allSelected){
                for(var course in this.list_course){
                    this.selected.push(this.list_course[course].course_id);
                }
            }
            else
            {
                this.selected=[];
            }
        },

        get_data_page(page){

            var app =this;
            app.loading=true;
            if(typeof page == 'undefined'){
                page = 1;
            }
            axios.get('daily_exercise?page='+page+'&study_group_id='+app.daily_exercise.study_group_id)
            .then(function(resp){
                app.data_show = resp.data.data;
                app.data_post = resp.data;
                app.loading=false;  

            }).
            catch(function(resp){
                app.loading=false;
            })
        }, 

        exportTableToExcel(table, name=''){
            var app = this;
            var study_group_id = $('#study_group_id').val();
            var kd_id = $('#kd_id').val();

            window.open('daily_exercise/export?study_group_id='+app.daily_exercise.study_group_id+'&class_grade_id='+app.daily_exercise.class_grade_id+'&course_id='+app.daily_exercise.course_id+'&kd_type=Pengetahuan');

        },
        uploadExcel(){
            $('#modal').modal('show');
        },
        saveUpload(){
            $('#loading_show').show();

            var app = this;
            app.close_modal();
            let formData = new FormData(); 
            formData.append('file_excel', app.file_excel);               
            axios.post('/daily_exercise_upload',formData,
            {

                headers: {

                    'Content-Type': 'multipart/form-data'
                }
            }
            )
            .then(function(resp){

               axios.get('get_study_group_setting?study_group_id='+app.daily_exercise.study_group_id)
               .then(function(resp){
                app.data_show = resp.data;
                app.data_post = resp.data;
                app.loading=false;  

            }).
               catch(function(resp){
                app.loading=false;
            })

               axios.get('get_total_daily_exercise?course_id='+app.daily_exercise.course_id+'&class_grade_id='+app.daily_exercise.class_grade_id+'&kd_type=Pengetahuan')
               .then(function(resp){
                app.data_daily_exercise = resp.data.data_daily_exercise; 
                app.category = resp.data.category; 
                app.structure_tematic = resp.data.structure_tematic;
                app.dt_k = resp.data.dt_k;
                app.tot_d = resp.data.tot_d;
                        app.data_kd2 = resp.data.data_kd2;

                        axios.post('send_param_daily_exercise',{
                            params:{
                                'data_show' : app.data_show,
                                'data_daily_exercise' :app.data_daily_exercise,
                                'category' : resp.data.category,
                                'structure_tematic':resp.data.structure_tematic,
                                'dt_k':resp.data.dt_k,
                                'tot_d':resp.data.tot_d,
                                'data_kd2':resp.data.data_kd2

                                }
                            })
                        .then(function(resp){
                            app.result_view = resp.data.data_all;
                            $('#loading_show').hide();
                        }).
                        catch(function(resp){
                        })
                    }).
               catch(function(resp){
                app.loading=false;
            })

           }).catch(function(resp){
            $('#loading_show').hide();
            swal('Error','File Masih Ada Kesalahan','error');
        })
       },
       onChangeFileUpload(){
        this.file_excel = this.$refs.file.files[0];
    },
    close_modal(){
        $('#form-all')[0].reset();
        $('#modal').modal('hide');
    },


    get_class_(e){
        this.get_class_grade(event.target.value).then(()=>{                    
            this.list_class_grade = this.class_grade;
        });                
    },
    get_study_group_(e){
        // this.get_study_group(event.target.value).then(()=>{                    
        //     this.list_study_group = this.study_group;
        // });     
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
            e = app.daily_exercise.study_group_id;  
        }

        app.get_course_study_group(app.daily_exercise.class_grade_id).then(()=>{      
        console.log(app.course_study_group)              
            app.list_course_ = app.course_study_group;
        });       
        app.get_daily_exercise();



    },
    async get_daily_exercise(e){                          
        $('#loading_show').show();
       
        var app = this;
        app.div_seen = true;
        await axios.get('get_study_group_setting?study_group_id='+app.daily_exercise.study_group_id)
        .then(function(resp){
            app.data_show = resp.data;
            app.data_post = resp.data;
            app.loading=false;  

            axios.get('get_total_daily_exercise?course_id='+app.daily_exercise.course_id+'&class_grade_id='+app.daily_exercise.class_grade_id+'&kd_type=Pengetahuan')
            .then(function(resp){
                app.data_daily_exercise = resp.data.data_daily_exercise; 
                app.category = resp.data.category; 
                app.structure_tematic = resp.data.structure_tematic;
                app.dt_k = resp.data.dt_k;
                app.tot_d = resp.data.tot_d;
                app.data_kd1 = resp.data.data_kd1;
                app.data_kd2 = resp.data.data_kd2;

                axios.post('send_param_daily_exercise',{
                    params:{
                        'data_show' : app.data_show,
                        'data_daily_exercise' :app.data_daily_exercise,
                        'category' : resp.data.category,
                        'structure_tematic':resp.data.structure_tematic,
                        'dt_k':resp.data.dt_k,
                        'tot_d':resp.data.tot_d,
                        'data_kd1':resp.data.data_kd1,
                        'data_kd2':resp.data.data_kd2

                    }
                })
                .then(function(resp){
                    app.result_view = resp.data.data_all;
                    $('#loading_show').hide();
                }).
                catch(function(resp){
                })
            }).
            catch(function(resp){
                app.loading=false;
            })

        }).
        catch(function(resp){
            app.loading=false;
        })

         },



     }
 }
 </script>