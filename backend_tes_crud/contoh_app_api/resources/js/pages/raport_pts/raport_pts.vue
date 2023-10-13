<template>
<div>
    <loading/>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Raport PTS Siswa</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Raport PTS Siswa
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
                                    <select class="form-control" id="unit_id"  name="unit_id" v-model="raport_pts.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="raport_pts.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                    <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_setting($event)" v-model="raport_pts.study_group_id">
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



    <!-- Tables start -->
    <!-- Row start -->
   <div class="row"  v-if="div_seen"  id="row_setting">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h5 class="card-header-text"> Raport PTS Siswa</h5>
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search">
                    </div>
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>NISN </th>
                                        <th> Nama Siswa</th>
                                        <th> Jenis Kelamin</th>
                                        <th> Action </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                       
                                        <td>{{index+1}}</td>
                                        <td>{{row.student_nisn}}</td>
                                        <td>{{row.student_name}}</td>
                                        <td>{{row.student_gender}}</td>
                                        <td> 
                                            
                                            <button @click="downloadWithCSS(row.student_id,row.student_name)" class="btn btn-primary" > Cetak Raport </button>
                                            <router-link :to="{name:'raport_pts.print_pts',params:{id:row.student_id,name:row.student_name,study_group_id:raport_pts.study_group_id,class_grade_id:raport_pts.class_grade_id}}" class="btn btn-success"> Lihat Raport </router-link>
                                            
                                         </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
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
import loading from '../../components/loading.vue';


    export default{
        data:function(){
            return {
                data_show:[],
                data_show_modal:[],
                list_student:[],
                // list_class_grade:[],
                div_seen:true, 
                list_study_group:[],
                month:[],
                loading:false,
                search:'',
                looping_absensi :['S','I','A'],
                showModal: false,
                raport_pts:{
                    unit_id:localStorage.getItem('unit_id'),
                    class_grade_id:localStorage.getItem('class_grade_id'),
                    study_group_id:localStorage.getItem('study_group_id'),
                   
                },
                data_post:{},
            }
        },
        components:{
            'loading':loading,
        },     
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_raport_pts();
                }
                else
                {
                    this.get_data();
                }
            },
        },
        created(){
            this.get_unit();
            this.get_class_grade_all();  
            this.get_study_group_all(this.raport_pts.class_grade_id);  
        

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                study_group:state=>state.study_group,
                student_by_class:state=>state.student_by_class,
                student_by_class_page:state=>state.student_by_class_page,
                list_class_grade:state=>state.class_grade,
                study_group_all:state=>state.study_group_all,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_student_by_class','get_class_grade_all','get_study_group_all','get_course_study_group']),
            
            
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

            get_study_group_all_(e){
                this.get_study_group_all(this.raport_pts.class_grade_id).then(()=>{                    
                    this.get_data_page();
                });                
            },

            get_study_group_(e){
                // alert('tes');
                this.get_study_group_all(event.target.value);              
            },
            search_raport_pts(page){
                
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                /* Ajax untuk get data siswa */
                axios.get('study_group_setting?study_group_id='+app.raport_pts.study_group_id+'&q='+app.search)
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
            downloadWithCSS(id,name) {
                var app = this;
                window.open('raport/print_raport_pts?id='+ id +'&study_group_id='+app.raport_pts.study_group_id+'&class_grade_id='+app.raport_pts.class_grade_id);
            }
         
        }
    }
</script>