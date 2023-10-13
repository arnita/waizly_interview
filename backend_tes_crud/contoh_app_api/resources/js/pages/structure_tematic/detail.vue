<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Data</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">
                    	<router-link to="/structure_tematic"> Struktuk Tematik   </router-link> 
                    	
                    </li>
                    <li class="breadcrumb-item">
                    	Detail Struktur Tematik
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
                        <h5 class="card-header-text"> Detail Struktur Tematik {{tematic_active.structure_tematic_name}} </h5>
                    </div>

                    <button class="btn btn-primary pull-left txt-white m-t-2" @click="add_detail()">  Tambah KD</button>
                    
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
                                        <th> Nama KD </th>
                                        <th> Kode KD </th>
                                        <th> Jumlah Soal Daily Test </th>
                                        <th> Action  </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.course_name}}</td>
                                        <td>{{row.kd_name}}</td>
                                        <td>{{row.kd_code}}</td>
                                         <td>{{row.question_daily}}</td>
                                        <td>
                                            <button class="btn btn-warning" type="button" @click="edit_detail(row.structure_tematic_detail_id)"><i class="fa fa-pencil"></i>
                                            </button>
                                             <button class="btn btn-danger" type="button" @click="delete_detail(row.structure_tematic_detail_id)"><i class="fa fa-minus"></i>
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
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title"> Input Detail </h4>
                </div>
                <div class="modal-body">
                
	                    <div class="row">
	                        <div class="col-sm-12 table-responsive">

								<form id="form-menu"  class="form-horizontal">
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
                                                <option  v-for="(item, index) in list_kd " :key="index" :value="item.kd_id"> {{item.kd_name}} </option>
                                            </select>
                                            <div class="form-control-feedback" v-if="errors.kd_id">{{errors.kd_id[0]}}</div>
                                        </div>
                                    </div>

				                    <div class="col-sm-12">
				                        <div class="form-group row"  :class="{'has-danger':errors.question_daily}">
				                            <label for="exampleInputEmail1" class="form-control-label"> Jumlah Soal Daily Test </label>
				                            <input type="hidden" name="structure_tematic_detail_id" class="form-control" v-model="structure_tematic_detail.structure_tematic_detail_id">
				                            <input type="hidden" name="structure_tematic_id" class="form-control" v-model="structure_tematic_detail.structure_tematic_id">
				                            <input type="text" name="question_daily" class="form-control" v-model="structure_tematic_detail.question_daily">
				                            <div class="form-control-feedback" v-if="errors.question_daily">{{errors.question_daily[0]}}</div>
				                        </div>
				                    </div>	

                                    <div class="col-sm-12">
                                        <div class="form-group row"  :class="{'has-danger':errors.question_uts}">
                                            <label for="exampleInputEmail1" class="form-control-label"> Jumlah Soal PTS </label>
                                            <input type="text" name="question_uts" class="form-control" v-model="structure_tematic_detail.question_uts">
                                            <div class="form-control-feedback" v-if="errors.question_uts">{{errors.question_uts[0]}}</div>
                                        </div>
                                    </div>    

                                    <div class="col-sm-12">
                                        <div class="form-group row"  :class="{'has-danger':errors.question_uas}">
                                            <label for="exampleInputEmail1" class="form-control-label"> Jumlah Soal PAS </label>
                                            <input type="text" name="question_uas" class="form-control" v-model="structure_tematic_detail.question_uas">
                                            <div class="form-control-feedback" v-if="errors.question_uas">{{errors.question_uas[0]}}</div>
                                        </div>
                                    </div>      		                 

				                </form>

				               </div>
				           </div>
				      
   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-save" @click="save_detail">Simpan</button>
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
					question_daily :'',
                    question_uts :'',
                    question_uas :'',
                },
                loading:true,
                list_course:[],
                study_group_id:'',
                search:'',
                errors:[],
                data_post:{},
                list_kd:[],
                structure_tematic_id : this.$route.params.id,
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
        mounted(){
        	this.get_data_page();
        	this.get_tematic_active_();
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
                this.structure_tematic_detail.structure_tematic_id='';
                this.structure_tematic_detail.structure_tematic_detail_id='';
                this.structure_tematic_detail.kd_id='';
                this.structure_tematic_detail.question_daily='';
                this.structure_tematic_detail.question_uts='';
                this.structure_tematic_detail.question_uas='';
                this.errors=[];
            },
       		get_tematic_active_(id){
       			 this.get_tematic_active(this.structure_tematic_id).then((resp)=>{                    

                    this.study_group_id = resp.study_group_id;
                    this.structure_tematic_detail.structure_tematic_id = resp.structure_tematic_id;                    
                });    
       		},	
       		get_course_by_study_group_(){
       			 this.get_course_by_study_group(this.study_group_id).then((resp)=>{                    
                    this.list_course = resp;                    
                });    
       		},	
        	save_detail(){
        		var app = this;
                $('#btn-save').attr('disabled',true);
                axios.post(`/structure_tematic_detail`,this.structure_tematic_detail)
                .then(function(resp){
                    app.clear_form();        
                	app.get_data_page();  
                    swal('Success','Simpan data berhasil','success');
                    $('#btn-save').attr('disabled',false);    
                    $('#modal').modal('hide');
                }).catch(function(resp){
                    app.clear_form();        
                    $('#btn-save').attr('disabled',false);
                })
            
        	},
        	add_detail()
            {
            	this.list_course = [];
            	this.get_course_by_study_group_();	
            	$('#modal').modal('show');
            },

            edit_detail(id)
            {	
            	this.get_course_by_study_group_();	
            	var app = this;
            	axios.get('structure_tematic_detail/'+id+'/edit')
                .then(function(resp){
                    axios.get('get_kd').then((rs)=>{
                        app.list_kd = rs.data;
                    });         

	                app.structure_tematic_detail.kd_id= resp.data.data.data.kd_id;
                    app.structure_tematic_detail.course_id= resp.data.data.data.course_id;
	                app.structure_tematic_detail.question_daily=resp.data.data.data.question_daily;
                    app.structure_tematic_detail.question_uts=resp.data.data.data.question_uts;
                    app.structure_tematic_detail.question_uas=resp.data.data.data.question_uas;
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
	                axios.get('structure_tematic_detail?page='+page+'&structure_tematic_id='+this.structure_tematic_id)
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
                        axios.delete('structure_tematic_detail/'+id)
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
                this.get_data_kd_course(e.target.value).then((resp)=>{
                    this.list_kd = this.data_kd_course;
                });                
            },
            close_modal(){
                $('#modal').modal('hide');
                $('#form-menu')[0].reset();
            }



            },
            
          
        }
    
</script>