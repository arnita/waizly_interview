<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4> Daily Test </h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> Daily Test 
                    </li>    
                </ol>
            </div>
        </div>
    </div>
    <!-- Header end -->


    <!-- Tables start -->
    <!-- Row start -->
   <div class="row"id="row_setting">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h5 class="card-header-text">  Daily Test  </h5>
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search">
                    </div>
                     
                    

                    <div class="col-sm-3 m-t-2 pull-right">
                        <select class="form-control" id="course_id"  name="class_grade_id" v-model="class_grade_id">
                            <option value=""> - Pilih Kelas - </option>
                            <option  v-for="(item, index) in list_grade" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                        </select>  
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                       <select class="form-control" id="course_id_parent"  name="course_id_parent" v-model="course_id_parent">
                            <option value=""> - Pilih Mata Pelajaran - </option>
                            <option  v-for="(item, index) in list_course_" :key="index" :value="item.course_id"> {{item.course_name}} </option>
                        </select>
                    </div>
                    <router-link :to="{name:'quiz_per_kd.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>
                </div>
                <div class="card-block" v-if="showTable">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th> Nama Mata Pelajaran </th>
                                        <th> Nama Kelas </th>
                                        <th> Kode KD </th>
                                        <th> Nama KD </th>
                                        <th> Type KD </th>
                                        <th> Jumlah Soal</th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.course_name}}</td>
                                        <td>{{row.class_grade_name}}</td>
                                        <td>{{row.kd_code}}</td>
                                        <td>{{row.kd_name}}</td>
                                        <td>{{row.kd_type}}</td>
                                        <td>{{row.total_question}}</td>
                                        <td>
                                            <router-link class="btn btn-warning"  v-if="role_name == 'Admin' "  :to="{name:'quiz_per_kd.edit',params:{id:row.quiz_per_kd_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                             <button class="btn btn-danger" v-if="role_name == 'Admin' " type="button" @click="delete_quiz_per_kd(row.quiz_per_kd_id)"><i class="fa fa-minus"></i>
                                             </button>
                                             <router-link class="btn btn-primary" :to="{name:'quiz_per_kd.create_question',params:{id:row.quiz_per_kd_id,course_id:row.course_id,kd_id:row.kd_id}}" > Buat Soal
                                            </router-link>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left m-l-2">
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
    export default{
        data:function(){
            return {
                data_show:[],
                data_show_modal:[],
                list_quiz_per_kd:[],
                list_class_grade:[],
                list_study_group:[],
                list_grade:[],
                class_grade_id:'',
                selected:[],
                list_course_:[],
                allSelected:false,
                showTable:false,
                loading:true,
                search:'',
                search_modal:'',
                course_id_parent:'',
                role_name:localStorage.getItem('role_name'),
                showModal: false,
                quiz_per_kd:{
                    kd_id:'',
                    total_question:'',
                    description:'',
                    type_question:'daily',
                },
                study_group_id:'',
                data_post:{},
                data_post_modal:{},

            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_quiz_per_kd();
                }
                else
                {
                    this.get_data_page();
                }
            },
            class_grade_id:function(q){
                if(q!=''){
                    this.class_grade_id = q;
                    this.search_quiz();
                }
                else
                {
                    this.class_grade_id = '';
                    this.get_data_page();
                }  
            },
             course_id_parent:function(q){
                if(q!=''){
                    this.course_id_parent =q;
                    this.search_kd();
                }
                else
                {
                    this.course_id_parent ='';
                    this.get_data_page(1);
                }  
            }
        },
        created(){
            this.get_grade();
            this.get_quiz_per_kd_();
            this.get_course();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                study_group:state=>state.study_group,
                employee_by_advisor:state=>state.employee_by_advisor,
                employee_by_advisor_page:state=>state.employee_by_advisor_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group']),
    
            get_data_page(page){
                  
                var app =this;
                app.loading=true;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                var class_grade_id = $('#class_grade_id').val();
                axios.get('get_quiz_per_kd?page='+page+'&type_question='+app.quiz_per_kd.type_question+'&class_grade_id='+app.class_grade_id+'&course_id='+app.course_id_parent)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    app.showTable= true;
                }).
                catch(function(resp){
                    app.loading=false;
                })
            }, 

            get_course(){
                var app = this;
                axios.get('/get_course').then(function(resp){
                    app.list_course_ = resp.data.data.data;
                }); 
            }, 
            search_quiz(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('get_quiz_per_kd?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id+'&type_question='+app.quiz_per_kd.type_question+'&course_id='+app.course_id_parent)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                })
                .catch(function(error){
                })
            },
            search_kd(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                
                axios.get('get_quiz_per_kd?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id+'&type_question='+app.quiz_per_kd.type_question+'&course_id='+app.course_id_parent)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                    app.showTable= true;
                })
                .catch(function(error){
                })
            },
            get_grade(){
                var app = this;
                axios.get('/get_class_grade_all').then(function(resp){
                    app.list_grade = resp.data.data.data;
                }); 
            },
           
            search_quiz_per_kd(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('get_quiz_per_kd?q='+app.search+'&page='+page+'&type_question='+app.quiz_per_kd.type_question+'&class_grade_id='+app.class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    app.showTable= true;

                })
                .catch(function(error){
                    app.loading=false;
                })
            },

            get_quiz_per_kd_(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                
                axios.get('get_quiz_per_kd?page='+page+'&type_question='+app.quiz_per_kd.type_question)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
          


            delete_quiz_per_kd(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('quiz_per_kd/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.get_quiz_per_kd_();    
                            }
                        })
                        .catch(function(resp){

                        })
                    }
                })
            },

        }
    }
</script>