<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4> Setting Soal PAS  {{tematic_active.structure_tematic_name}} </h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">
                        <router-link to="/structure_tematic"> Struktuk Tematik   </router-link> 
                        
                    </li>
                    <li class="breadcrumb-item">
                        Setting Soal PAS
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
                        <h5 class="card-header-text"> Setting Soal PAS  {{tematic_active.structure_tematic_name}} </h5>
                    </div>

                    <button class="btn btn-primary pull-left txt-white m-t-2  m-r-1" @click="add_detail()">  Tambah KD</button>
                    <router-link class="btn btn-warning pull-left txt-white m-t-2" to="/structure_tematic">  Kembali </router-link>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                    </div>
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th> Mata Pelajaran </th>
                                        <th>Nama Kelas</th>
                                        <th> Kode KD </th>
                                        <th> Nama KD </th>
                                        <th> Type KD </th>
                                        <th> Jumlah Soal PAS </th>
                                        <!-- <th> Jumlah Soal PAS </th>
                                        <th> Jumlah Soal UAS </th>
                                        <th> Buat Soal PAS </th>
                                        <th> Buat Soal PAS </th>
                                        <th> Buat Soal UAS </th> -->
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
                                         <td>{{row.question_uas}}</td>
                                       <!-- 
                                        <td>{{row.question_uas}}</td>
                                        <td>{{row.question_uas}}</td>
                                        <td>
                                            <router-link class="btn btn-primary" :to="{name:'structure_tematic.create_question_uas',params:{id:row.kd_id}}" >PAS</router-link>
                                        </td>
                                        <td>
                                            <router-link class="btn btn-primary" :to="{name:'structure_tematic.create_question_uas',params:{id:row.kd_id}}" >PAS</router-link>
                                        </td>
                                        <td>
                                            <router-link class="btn btn-primary" :to="{name:'structure_tematic.create_question_uas',params:{id:row.kd_id}}" >UAS</router-link>

                                        </td> -->
                                        <td>
                                            <button class="btn btn-warning" type="button" @click="edit_detail(row.structure_tematic_detail_id)"><i class="fa fa-pencil"></i>
                                            </button>

                                             <button class="btn btn-danger" type="button" @click="delete_detail(row.structure_tematic_detail_id)"><i class="fa fa-minus"></i>
                                            </button>

                                            <router-link class="btn btn-primary" :to="{name:'structure_tematic.create_question_uas',params:{id:row.kd_id,st_id:row.structure_tematic_id}}" >Buat Soal</router-link>
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
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title"> Input KD </h4>
                </div>
                <div class="modal-body">
                
                        <div class="row">
                            <div class="col-sm-12 table-responsive">

                                <form id="form-menu"  class="form-horizontal">

                                    <div id="form_create" style="display:none">
                                        <div class="col-sm-12">
                                            <div class="form-group row"  :class="{'has-danger':errors.course_id}">
                                                <label for="exampleInputEmail1" class="form-control-label"> Mata Pelajaran </label>
                                                <select class="form-control" id="course_id"  name="course_id" v-model="structure_tematic_detail.course_id" @change="get_kd_($event)">
                                                    <option value=""> - Pilih Mata Pelajaran - </option>
                                                    <option  v-for="(item, index) in list_course " :key="index" :value="item.course_id"> {{item.course_name}} </option>
                                                </select>
                                                <div class="form-control-feedback" v-if="errors.course_id">{{errors.course_id[0]}}</div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="form-group row"  :class="{'has-danger':errors.kd_id}">
                                                <label for="exampleInputEmail1" class="form-control-label"> KD </label>
                                                <select class="form-control" id="kd_id"  name="kd_id" v-model="structure_tematic_detail.kd_id">
                                                    <option value=""> - Pilih KD - </option>
                                                    <option  v-for="(item, index) in list_kd " :key="index" :value="item.kd_id"> {{item.kd_code}} - {{item.kd_name}} -  {{item.kd_type}} </option>
                                                </select>
                                                <div class="form-control-feedback" v-if="errors.kd_id">{{errors.kd_id[0]}}</div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="form-group row"  :class="{'has-danger':errors.question_all}">
                                                <label for="exampleInputEmail1" class="form-control-label"> Jumlah Soal PAS </label>
                                                <input type="text" name="question_all" class="form-control" v-model="structure_tematic_detail.question_all">
                                                <div class="form-control-feedback" v-if="errors.question_all">{{errors.question_all[0]}}</div>
                                            </div>
                                        </div>  

                                    </div>

                                    <div id="form_update" style="display:none">

                                        <div class="col-sm-12">
                                            <div class="form-group row"  :class="{'has-danger':errors.question_all}">
                                                <label for="exampleInputEmail1" class="form-control-label"> Jumlah Soal PAS </label>
                                                <input type="text" name="question_all" class="form-control" v-model="structure_tematic_detail.question_all">
                                                <div class="form-control-feedback" v-if="errors.question_all">{{errors.question_all[0]}}</div>
                                            </div>
                                        </div>  

                                    </div>

                                </form>

                               </div>
                           </div>
                      
   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-save" @click="save_detail">Simpan</button>
                    <button type="button" class="btn btn-primary" id="btn-update" @click="update_detail" style="display:none">Update</button>
                    <button type="button" class="btn btn-warning" @click="close_modal">Batal</button>

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
                structure_tematic_detail: {
                    structure_tematic_id: '',
                    structure_tematic_detail_id: '',
                    kd_id :'',
                    course_id :'',
                    question_uas :'',
                    question_all :'',
                    type_question:'uas'
                },
                loading:true,
                list_course:[],
                class_grade_id:'',
                search:'',
                errors:[],
                data_post:{},
                list_kd:[],
                id_detail : this.$route.params.id,
                type_detail : 'uas',
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_detail();
                }
                else
                {
                    this.get_data_page();
                }
            },
        },
        created(){
            this.get_tematic_active_();
            this.get_data_page();
        },
        computed:{
            ...mapState('application', {
                tematic_active:state=>state.tematic_active,
                course_by_study_group:state=>state.course_by_study_group,
                data_kd_course:state=>state.data_kd_course,
            }),
        },
        methods:{
            ...mapActions('application',['get_tematic_active','get_course_by_study_group','get_data_kd_course']),
             clear_form(){
                this.structure_tematic_detail.course_id='';
                this.structure_tematic_detail.structure_tematic_id='';
                this.structure_tematic_detail.structure_tematic_detail_id='';
                this.structure_tematic_detail.kd_id='';
                this.structure_tematic_detail.question_all='';
                this.errors=[];
            },
            get_tematic_active_(id){
                var app = this;
                 app.get_tematic_active(app.id_detail).then((resp)=>{                    
                    app.class_grade_id = resp.class_grade_id;
                });    
            },  
            get_course_by_study_group_(){
                 this.get_course_by_study_group(this.class_grade_id).then((resp)=>{                    
                    this.list_course = resp;                    
                });    
            },  
            save_detail(){
                var app = this;
                app.structure_tematic_detail.structure_tematic_id = app.id_detail;

                $('#btn-save').attr('disabled',true);
                axios.post(`/structure_tematic_detail`,app.structure_tematic_detail)
                .then(function(resp){
                    app.get_data_page();  
                    swal('Success','Simpan data berhasil','success');
                    $('#btn-save').attr('disabled',false);    
                    $('#modal').modal('hide');
                    app.clear_form();        
                }).catch(function(resp){
                    app.clear_form();        
                    app.errors = resp.response.data.errors;
                    $('#btn-save').attr('disabled',false);
                })
            
            },
            add_detail()
            {
                $('#form_update').hide();
                $('#form_create').show();

                $('#btn-save').show();
                $('#btn-update').hide();
                this.list_course = [];
                this.clear_form();
                this.get_course_by_study_group_();  
                $('#modal').modal('show');
            },

            edit_detail(id)
            {   
                $('#form_update').show();
                $('#form_create').hide();


                $('#btn-save').hide();
                $('#btn-update').show();
                this.get_course_by_study_group_();  
                var app = this;
                axios.get('structure_tematic_detail/'+id+'/edit')
                .then(function(resp){
                    axios.get('get_kd').then((rs)=>{
                        app.list_kd = rs.data;
                    });         

                    app.structure_tematic_detail.kd_id= resp.data.data.data.kd_id;
                    app.structure_tematic_detail.course_id= resp.data.data.data.course_id;
                    app.structure_tematic_detail.question_all= resp.data.data.data.question_uas;    
                    app.structure_tematic_detail.structure_tematic_detail_id=resp.data.data.data.structure_tematic_detail_id;
                    app.structure_tematic_detail.structure_tematic_id=resp.data.data.data.structure_tematic_id;
                    
                })
                $('#modal').modal('show');
            },
            get_data_page(page){

                    var app =this;
                    if(typeof page == 'undefined'){
                        page = 1;
                    }
                    axios.get('structure_tematic_detail?page='+page+'&structure_tematic_id='+app.id_detail+'&type_detail='+app.type_detail)
                    .then(function(resp){
                        app.data_show = resp.data.data;
                        app.data_post = resp.data;
                        app.loading=false;  
                    }).
                    catch(function(resp){
                        app.loading=false;
                    })
            },
            search_detail(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('structure_tematic_detail?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
                })
            },
            delete_detail(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('structure_tematic_detail/'+id+'?type_question=uas')
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
            get_kd_(e){
                axios.get('get_data_kd_course?course_id='+e.target.value+'&type=per_kd&class_grade_id='+this.class_grade_id+'&type_question=uas'+'&type_tema=tematic')
                // axios.get('get_data_kd_course?course_id='+e.target.value+'&type=per_kd')
                //this.get_data_kd_course(e.target.value)
                .then((resp)=>{
                    this.list_kd = resp.data;
                });  

            },
            close_modal(){
                $('#modal').modal('hide');
                $('#form-menu')[0].reset();
            },
            update_detail(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    axios.put('/structure_tematic_detail/'+app.structure_tematic_detail.structure_tematic_detail_id,app.structure_tematic_detail).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.get_data_page();
                        $('#modal').modal('hide');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })  


            }



            },
            
          
        }
    
</script>