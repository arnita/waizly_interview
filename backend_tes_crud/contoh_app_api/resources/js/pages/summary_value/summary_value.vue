<template>
    <div>

        <div id="loading_show" class="loader-overlay-back" style="display:none">
            <div class="loader"><img src="assets/images/1.gif"></div> 
        </div>


        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4> Rekapitulasi Mata Pelajaran </h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item">  Rekapitulasi Mata Pelajaran 
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
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                        <select class="form-control" id="unit_id" name="unit_id" v-model="summary_value.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                        <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="summary_value.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                        <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_setting($event)" v-model="summary_value.study_group_id">
                                            <option value=""> - Pilih Rombel - </option>
                                            <option  v-for="(item, index) in study_group_all.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
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
                            <h5 class="card-header-text"> Input  Rekapitulasi Mata Pelajaran </h5>
                        </div>
                    </div>
                    <div class="card-block" id="table_input">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Kode Mata Pelajaran </th>
                                            <th> Nama Mata Pelajaran</th>
                                            <th> Action  </th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="row,index in data_show">
                                            <td>{{index+1}}</td>
                                            <td>{{row.course_code}}</td>
                                            <td>{{row.course_name}}</td>              
                                            <td>
                                                <button class="btn btn-primary" type="button" @click="download_rekap(row.course_id)"> Download Rekap
                                                </button>
                                                    <router-link :to="`/summary_value/view_summary/${row.course_id}/${summary_value.class_grade_id}/${summary_value.study_group_id}`"  class="btn btn-success"> Lihat Rekap </router-link>
                                                    
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
            // list_class_grade:[],
            list_study_group:[],
            list_course:[],
            pd_spiritual:[],
            pd_sosial:[],
            loading:true,
            search:'',
            div_seen:true,
            result_view:'',
            looping_pd :['SB','PB'],
            showModal: false,
            summary_value:{
                unit_id:localStorage.getItem('unit_id'),
                class_grade_id:localStorage.getItem('class_grade_id'),
                study_group_id:localStorage.getItem('study_group_id'),
                course_id:localStorage.getItem('course_id'),
            },
            data_post:{},
        }
    },
    
      created(){
        this.get_unit();  
        this.get_class_grade_all();  
        this.get_study_group_all_(this.summary_value.class_grade_id);  
        // this.get_data_setting();
        
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


          get_study_group_all_(e){
                this.get_study_group_all(this.summary_value.class_grade_id).then(()=>{                    
                    this.get_data_setting();
                });                
            },
            async get_data_page(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await axios.get('study_group_setting?page='+page+'&study_group_id='+app.summary_value.study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            async get_data_setting(){
                var app =this;
                app.div_seen = true;
                await axios.get('get_course_study_group?class_grade_id='+app.summary_value.class_grade_id)
                .then(function(resp){
                    
                    app.data_show = resp.data.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
                
            },

            
            
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            get_study_group_(e){
                // this.get_study_group(event.target.value).then(()=>{                    
                //     this.list_study_group = this.study_group;
                //     this.summary_value.class_grade_id = e.target.value;
                //     // alert(e.target.value);
                // });
                this.get_study_group_all(this.summary_value.class_grade_id);              
            },

            onlyNumber ($event) {
             let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                 if ((keyCode >= 50) && keyCode !== 46) { // 46 is dot
                  $event.preventDefault();
              }
          },

          download_rekap(id){
            $('#loading_show').show();
            var app =this;
            $('#loading_show').hide();
            window.open('download_summary_value/export?course_id='+id+'&study_group_id='+app.summary_value.study_group_id+'&class_grade_id='+app.summary_value.class_grade_id);    
        }           

        
    }
}
</script>