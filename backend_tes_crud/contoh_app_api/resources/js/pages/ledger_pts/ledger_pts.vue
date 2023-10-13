<template>
<div>

    <div id="loading_show" class="loader-overlay-back" style="display:none">
        <div class="loader"><img src="assets/images/1.gif"></div> 
    </div>


    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4> Ledger PTS </h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> </li>
                    <li class="breadcrumb-item">Ledger PTS</li>
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
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="ledger_pts.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="ledger_pts.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
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


 <div class="row" style="display: none" id="row_setting">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h5 class="card-header-text"> Input  Ledger PTS</h5>
                    </div>
                </div>
                <div class="card-block" id="table_input">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th> Nama Rombel</th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.study_group_name}}</td>
                                        <td>
                                            <button class="btn btn-primary" type="button" @click="download_ledger_pts(row.study_group_id)"> Download Ledger
                                            </button>
                                            <router-link :to="{name:'ledger_pts.print_ledger',params:{id:row.study_group_id,class_grade_id:row.class_grade_id}}" class="btn btn-success"> Lihat Ledger </router-link>       
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
                list_course:[],
                pd_spiritual:[],
                pd_sosial:[],
                loading:true,
                search:'',
                result_view:'',
                looping_pd :['SB','PB'],
                showModal: false,
                ledger_pts:{
                    unit_id:'',
                    class_grade_id:'',
                    study_group_id:'',
                    course_id:'',
                },
                data_post:{},
            }
        },
     
        created(){
            this.get_unit();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                study_group:state=>state.study_group,
                student_by_class:state=>state.student_by_class,
                student_by_class_page:state=>state.student_by_class_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_student_by_class']),
            
            async load_data(id){
                var app =this;
                await axios.get('get_course_study_group?study_group_id='+id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            async get_data_page(page){
                var app =this;
                var study_group_id =$('#study_group_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await axios.get('study_group_setting?page='+page+'&study_group_id='+study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
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
            async get_study_group_(e){
                $('#row_setting').show();
                var app = this;
                await app.get_study_group(event.target.value).then((resp)=>{                    
                    app.data_show = resp.data;
                    app.data_post = resp;
                    app.loading=false; 

                });                
            },


            async download_ledger_pts(id){
                $('#loading_show').show();
                var app =this;
                 await axios.get('insert_raport_pts?study_group_id='+id+'&class_grade_id='+app.ledger_pts.class_grade_id)
                .then(function(resp){
                    $('#loading_show').hide();
                    window.open('download_ledger_pts/export?study_group_id='+id+'&class_grade_id='+app.ledger_pts.class_grade_id);    
                    
                }).catch(function(resp){
                    
                    $('#loading_show').hide();
                      swal('Error',resp.response.data.message,'error');
                })

            }           

         
        }
    }
</script>