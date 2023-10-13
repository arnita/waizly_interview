<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Pemetaan Kompetensi Dasar</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">
                        <router-link to="/kd">Kompetensi Dasar  </router-link> 
                        
                    </li>
                    <li class="breadcrumb-item">
                        Pemetaan Kompetensi Dasar
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <!-- Header end -->

    <!-- Tables start -->
    <!-- Row start -->
   <div class="row">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h5 class="card-header-text"> Pemetaan Kompetensi Dasar {{step_study_active.step_study_name}} </h5>
                    </div>

                    <button class="btn btn-primary pull-left txt-white m-t-2" @click="get_data_kd_()">  Tambah </button>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search">
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <select class="form-control" id="class_grade_id_parent"  name="class_grade_id_parent" v-model="class_grade_id_parent">
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
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th> Kelas </th>
                                        <th> Mata Pelajaran </th>
                                        <th> Kode </th>
                                        <th> Kompetensi Dasar </th>
                                        <th> Type</th>
                                        <th> Action  </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.class_grade_name}}</td>
                                        <td>{{row.course_name}}</td>
                                        <td>{{row.kd_code}}</td>
                                        <td>{{row.kd_name}}</td>
                                        <td>{{row.kd_type}}</td>
                                        <td>
                                            <button class="btn btn-danger" type="button" @click="delete_kd_detail(row.kd_detail_id)"><i class="fa fa-minus"></i>
                                            </button>
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


     <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title"> Data KD</h4>
                </div>
                <div class="modal-body" style="padding: 0">
                     <div class="col-sm-3 m-t-2 pull-left">
                        <select class="form-control" id="course_id"  name="class_grade_id" v-model="class_grade_id">
                            <option value=""> - Pilih Kelas - </option>
                            <option  v-for="(item, index) in list_grade" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                        </select>
                        
                    </div>
                     <div class="col-sm-3 m-t-2 pull-left">
                       <select class="form-control" id="course_id"  name="course_id" v-model="course_id">
                            <option value=""> - Pilih Mata Pelajaran - </option>
                            <option  v-for="(item, index) in list_course_" :key="index" :value="item.course_id"> {{item.course_name}} </option>
                        </select>
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search_modal">
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                     <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" @click="selectAll_" name="kd_id" v-model="allSelected">
                                        </label>
                                    </div>
                                </th>
                                <th> Kelas </th>
                                <th> Mata Pelajaran </th>
                                <th> Kode </th>
                                <th> Kompetensi Dasar </th>
                                <th> Type </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in list_kd">
                                <td>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" v-model="selected" :value="row.kd_id" name="kd_id">
                                        </label>
                                    </div>
                                </td>
                                <td>{{row.class_grade_name}}</td>
                                <td>{{row.course_code}}</td>
                                <td>{{row.kd_code}}</td>
                                <td>{{row.kd_name}}</td>
                                <td>{{row.kd_type}}</td>
                               
                            </tr>
                        </tbody>
                    </table>
                    <div class="pull-left m-l-2">
                      <vue-pagination :data="data_post_modal" :limit="2"  v-on:pagination-change-page="get_data_page_modal">
                        <span slot="prev-nav">&lt; Previous</span>
                        <span slot="next-nav">Next &gt;</span>
                      </vue-pagination>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-save" @click="save_kd">Simpan</button>
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>

                </div>
            </div>
        </div>
    </div>

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
                list_kd:[],
                loading:true,
                search:'',
                search_modal:'',
                selected:[],
                allSelected:false,
                data_post:{},
                list_course_:[],
                list_grade:[],
                course_id:'',
                class_grade_id:'', 
                course_id_parent:'',
                class_grade_id_parent:'',
                data_post_modal:{}
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_kd();
                }
                else
                {
                    this.get_data_page();
                }
            },
            search_modal:function(q){
                if(q!=''){
                    this.search_kd_modal();
                }
                else
                {
                    this.get_data_kd_(1);
                }
            },
            class_grade_id:function(q){
                if(q!=''){
                    this.class_grade_id = q;
                    this.search_kd_modal();
                }
                else
                {
                    this.class_grade_id = '';
                    this.get_data_kd_(1);
                }  
               
            },
            course_id:function(q){
                if(q!=''){
                    this.course_id =q;
                    this.search_kd_modal();
                }
                else
                {
                    this.course_id ='';
                    this.get_data_page(1);
                }  
              
            },
            class_grade_id_parent:function(q){
                if(q!=''){
                    this.class_grade_id_parent = q;
                    this.search_kd();
                }
                else
                {
                    this.class_grade_id_parent = '';
                    this.get_data_page(1);
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
        mounted(){
            this.get_step_study_active();
            this.get_data_page();        
            this.get_course();
            this.get_grade();
        },
        computed:{
            ...mapState('application', {
                step_study_active:state=>state.step_study_active,
                data_kd_detail:state=>state.data_kd_detail,
                data_kd_detail_page:state=>state.data_kd_detail_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_step_study_active','get_data_kd']),
            search_kd_modal(page=1){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }


                app.get_data_kd({step_study_id:app.step_study_active.step_study_id,page:page,q:app.search_modal,class_grade_id:app.class_grade_id,course_id:app.course_id}).then(()=>{
                    app.list_kd = app.data_kd_detail;

                    app.data_post_modal = app.data_kd_detail_page;
                });

            }, 
            
            get_course(){
                var app = this;
                axios.get('/get_course').then(function(resp){
                    app.list_course_ = resp.data.data.data;
                }); 
            }, 
            get_grade(){
                var app = this;
                axios.get('/get_class_grade_all').then(function(resp){
                    app.list_grade = resp.data.data.data;
                }); 
            },
            get_data_kd_(page){
                var app =this;
                app.search_modal = '';
                app.selected =[];
                if(typeof page == 'undefined'){
                    page = 1;
                }
                app.get_data_kd({step_study_id:app.step_study_active.step_study_id,page:page,q:app.search_modal,class_grade_id:app.class_grade_id,course_id:app.course_id}).then(()=>{
                // app.get_data_kd({step_study_id:app.step_study_active.step_study_id,page:page}).then(()=>{
                    app.list_kd = app.data_kd_detail;
                    app.data_post_modal = app.data_kd_detail_page;
                });
                $('#modal').modal('show');
            },
            save_kd(){
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/kd_detail`,
                        {
                            'kd_id':this.selected,
                        }
                    )
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        $('#btn-save').attr('disabled',false);    
                        $('#modal').modal('hide');
                        app.get_data_page();                                
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-save').attr('disabled',false);
                    })
                })
            },
            selectAll_(){
                this.selected =[];
                if(!this.allSelected){
                    for(var kd in this.list_kd){
                        this.selected.push(this.list_kd[kd].kd_id);
                    }
                }
                else
                {
                    this.selected=[];
                }
            },
            get_data_page(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }

                axios.get('kd_detail?page='+page+'&q='+app.search+'&class_grade_id='+app.class_grade_id_parent+'&course_id='+app.course_id_parent)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_page_modal(page){
                var app =this;
                // app.search_modal = '';
                app.selected =[];
                if(typeof page == 'undefined'){
                    page = 1;
                }
                app.get_data_kd({step_study_id:app.step_study_active.step_study_id,page:page,q:app.search_modal,class_grade_id:app.class_grade_id,course_id:app.course_id}).then(()=>{
                    app.list_kd = app.data_kd_detail;
                    app.data_post_modal = app.data_kd_detail_page;
                });
            },
            search_kd(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                
                axios.get('kd_detail?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id_parent+'&course_id='+app.course_id_parent)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
                })
            },
            delete_kd_detail(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('kd_detail/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.get_data_page();    
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