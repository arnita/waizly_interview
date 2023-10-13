<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tahapan Belajar</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li> 
                    <li class="breadcrumb-item"> <router-link to="/unit_year"> Tahun Ajaran  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Tahapan Belajar Tahun Ajaran {{unit_year_name}}
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
                        <h5 class="card-header-text"> Tahapan Belajar {{unit_year_name}}  </h5>
                    </div>
                    <router-link to="/unit_year" class="btn btn-warning pull-left txt-white m-t-2" style="margin-left: 20px;">   Kembali </router-link>
                    <router-link :to="{name:'step_study.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>
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
                                        <th>Tahapan Belajar</th>
                                        <th>Tanggal Mulai</th>
                                        <th>Tanggal Selesai</th>
                                        <th>Tanggal Cetak PTS</th>
                                        <th>Tanggal Cetak PAS</th>
                                        <th>Status</th>
                                        <th> Action  </th>                    
                                    </tr>
                                </thead>
                                <tbody  v-if="data_show.length">
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td> {{row.step_study_name}}</td>
                                        <td> {{row.step_study_start | moment("D-MM-YYYY")}}</td>
                                        <td> {{row.step_study_end | moment("D-MM-YYYY")}}</td>
                                        <td> {{row.date_pts | moment("D-MM-YYYY")}}</td>
                                        <td> {{row.date_pas | moment("D-MM-YYYY")}}</td>
                                        <td> <button v-if="row.step_study_status === 'active'" class="btn btn-primary" @click="change_status(row.step_study_id,'deactive',$route.params.id)">Aktif</button> 
                                            <button v-else class="btn btn-danger" @click="change_status(row.step_study_id,'active',$route.params.id)"> Tidak Aktif</button></td>
                                        <td>
                                            <router-link :to="{path:'/step_study/'+$route.params.id+'/edit/'+row.step_study_id}" class="btn btn-warning"> <i class="fa fa-pencil"></i> </router-link> 
                                            <button class="btn btn-danger" type="button" @click="delete_step_study(row.step_study_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left">
                              <vue-pagination :data="data_post" :limit="2" v-on:pagination-change-page="get_data">
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
import {mapActions,mapState} from 'vuex';
import axios  from '../../api.js';
import Vue from 'vue';
    export default{
        data:function(){
            return {
                data_show:[],
                loading:true,
                search:'',
                unit_year_id:this.$route.params.id,
                unit_year_name:'',
                data_post:{}
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_step_study();
                }
                else
                {
                    this.get_data();
                }
            }
        },
        mounted(){
            this.get_data();
        },

        methods:{
            get_data(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('step_study?page='+page+'&id='+app.unit_year_id)
                .then(function(resp){
                    app.unit_year_name = resp.data.data.unit_year.unit_year_name;
                    app.data_show = resp.data.data.list.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_step_study(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('step_study?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
                })
            },
            delete_step_study(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('step_study/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.get_data();    
                            }
                        })
                        .catch(function(resp){

                        })
                    }
                })
            },
            change_status(id,status,id_year){
                if(status == 'active')
                {
                   var text =  "Apakah Kamu Yakin  Aktifkan Tahun Ajaran Ini!";
                   var title =  "Aktifkan Tahun Ajaran";
                    var confirm =  "Ya  Aktifkan ! ";
                    var status = 'active';
                }
                else if(status == 'deactive')
                {
                    var text =  "Apakah Kamu Yakin Non   Aktifkan Tahun Ajaran Ini!";
                    var title =  " NonAktifkan Tahun Ajaran";
                    var confirm =  "Ya Non Aktifkan ! ";
                    var status = 'deactive'
                }

                 swal({
                    title:title,
                    text:text,
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                    confirmButtonText: confirm,
                    showCancelButton: true,
                }).then((willdelete)=>{                
                    if(willdelete){
                        var app = this;

                        axios.get('change_status_step?step_study_id='+id+'&status='+status+'&id_year='+id_year)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                location.reload(true);
                            }
                        })
                        .catch(function(resp){

                        })
                    }
                })

            }

        }
    }
</script>