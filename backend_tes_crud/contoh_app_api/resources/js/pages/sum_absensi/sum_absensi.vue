<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Total Absensi dan Nilai Rata Siswa</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Total Absensi dan Nilai Rata Siswa
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

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Tahun Ajaran</label>
                                    <select class="form-control" id="unit_year_id" @change="get_class_($event)" name="unit_year_id" v-model="study_group_setting.unit_year_id">
                                        <option value=""> - Pilih Tahun Ajaran - </option>
                                        <option  v-for="(item, index) in unit_year.data " :key="index" :value="item.unit_year_id"> {{item.unit_year_name}} </option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Semester</label>
                                    <select class="form-control" id="step_study_id" name="step_study_id" @change="get_class_($event)" v-model="study_group_setting.step_study_id">
                                        <option value=""> - Pilih Semester - </option>
                                        <option  v-for="(item, index) in step_study.data " :key="index" :value="item.step_study_id"> {{item.step_study_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="study_group_setting.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="study_group_setting.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                    <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_setting($event)" v-model="study_group_setting.study_group_id">
                                        <option value=""> - Pilih Rombel - </option>
                                        <option  v-for="(item, index) in list_study_group.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
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
   <div class="row" style="display: none" id="row_setting">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h5 class="card-header-text"> Total Absensi dan Nilai Rata Siswa </h5>
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." @keyup.enter="search_absensi($event)">
                    </div>
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>NISN </th>
                                        <th> Nama Siswa</th>
                                        <th> Jenis Kelamin</th>
                                        <th align="center" v-for="ab,index in looping_absensi" style="width: 3%">
                                            {{ab}}
                                        </th>
                                        <th align="center"> Nilai Rata - rata Pengetahuan  </th>
                                        <th> Nilai Rata - rata Keterampilan  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                       
                                        <td>{{index+1}}</td>
                                        <td>{{row.student.student_nisn}}</td>
                                        <td>{{row.student.student_name}}</td>
                                        <td>{{row.student.student_gender}}</td>
                                        <td align="center"  v-for="ab,index in looping_absensi" style="width: 0.1%">
                                            {{get_value(row.student.student_id,ab)}}
                                        </td>
                                        <td>
                                             <div style="width:100px">{{get_avg(row.student.student_id)}}</div>
                                        </td>


                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading" size="large" message="Loading ..."></vue-simple-spinner>
                            <div class="pull-left">
                              <vue-pagination :data="data_post" :limit="2" v-on:pagination-change-page="get_data_page">
                                    <span slot="prev-nav">&lt; Previous</span>
                                    <span slot="next-nav">Next &gt;</span>
                              </vue-pagination>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Basic Table ends -->
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
import Vue from 'vue';
import store from '../../store.js'

    export default{
        data:function(){
            return {
                data_show:[],
                data_show_modal:[],
                list_student:[],
                list_class_grade:[],
                list_study_group:[],
                month:[],
                loading:true,
                search:'',
                looping_absensi :['S','I','A'],
                showModal: false,
                study_group_setting:{
                    unit_id:'',
                    unit_year_id:'',
                    step_study_id:'',
                    class_grade_id:'',
                    study_group_id:'',
                },
                data_post:{},
            }
        },
     
        created(){
            this.get_unit();
            this.get_unit_year();
            this.get_step_study();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                unit_year:state=>state.unit_year,
                step_study:state=>state.step_study,
                class_grade:state=>state.class_grade,
                study_group:state=>state.study_group,
                student_by_class:state=>state.student_by_class,
                student_by_class_page:state=>state.student_by_class_page,
            }),
        },
        methods:{

            ...mapActions('application',['get_unit','get_unit_year','get_step_study','get_class_grade','get_study_group','get_student_by_class','get_year_step_active']),
            
            load_data(id){
                var app =this;
                axios.get('study_group_setting?study_group_id='+id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_page(page){
                var app =this;
                var study_group_id =$('#study_group_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('study_group_setting?page='+page+'&study_group_id='+study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_setting(event){
                $('#row_setting').show();
                var app =this;
                /* Ajax untuk get data siswa */
                axios.get('study_group_setting?study_group_id='+event.target.value)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })


            },

            search_absensi(e){
                var app = this;
                /* Ajax untuk get data siswa */
                axios.get('study_group_setting?study_group_id='+$('#study_group_id').val()+'&q='+e.target.value)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })

            },
            
            get_data_student(page){
                this.selected=[];
                this.search_modal = '';
                if(typeof page == 'undefined'){
                    page = 1;
                }

                this.get_student_by_class({class_grade_id:$('#class_grade_id').val(),page:page}).then(()=>{
                    this.list_student = this.student_by_class;
                });                
                $('#modal').modal('show');
            },
           
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            get_study_group_(e){
                this.get_study_group(event.target.value).then(()=>{                    
                    this.list_study_group = this.study_group;
                });                
            },

            get_value(student_id,absensi_type,month){
                var app =this;
                let input_absensi;
                const token = store.state.token
                 $.ajax({
                        url: '/api/get_value_sum_absensi',
                        type:'GET',
                         headers:{
                            'Content-Type': 'application/json',
                            'Authorization':`Bearer ${token}`,
                        },
                        async: false,
                        data:{
                            'student_id' : student_id,
                            'absensi_type': absensi_type,
                            'month' :month,
                        },
                        success:function(resp){
                              return input_absensi = resp.data;
                        }
                    })
                 return input_absensi;
            },
            get_avg(student_id,absensi_type,month){
                var app =this;
                let input_absensi;
                const token = store.state.token
                 $.ajax({
                        url: '/api/get_value_avg_score',
                        type:'GET',
                         headers:{
                            'Content-Type': 'application/json',
                            'Authorization':`Bearer ${token}`,
                        },
                        async: false,
                        data:{
                            'student_id' : student_id,
                            'kd_type' : "Pengetahuan"
                        },
                        success:function(resp){
                              return input_absensi = resp.data;
                        }
                    })
                 return input_absensi;
            }

         
        }
    }
</script>