<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Jam Pelajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Jam Pelajaran
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
                        <h5 class="card-header-text"> Jam Pelajaran </h5>
                    </div>
                    <router-link :to="{name:'lesson_hour.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>
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
                                        <th>Hari</th>
                                        <th>Pelajaran Ke -  </th>
                                        <th>Tipe Pelajaran</th>
                                        <th>Waktu Mulai</th>
                                        <th>Waktu Selesai</th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.lesson_day}}</td>
                                        <td>{{row.hour_to}}</td>
                                        <td>{{row.lesson_hour_type}}</td>
                                        <td>{{row.lesson_hour_start}}</td>
                                        <td>{{row.lesson_hour_end}}</td>
                                        <td>
                                            <router-link class="btn btn-warning" :to="{name:'lesson_hour.edit',params:{id:row.lesson_hour_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                            <button class="btn btn-danger" type="button" @click="delete_lesson_hour(row.lesson_hour_id)"><i class="fa fa-minus"></i>
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
import axios  from '../../api.js';
import Vue from 'vue';
    export default{
        data:function(){
            return {
                data_show:[],
                loading:true,
                search:'',
                data_post:{}
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_lesson_hour();
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
                axios.get('lesson_hour?page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_lesson_hour(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('lesson_hour?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
                })
            },
            delete_lesson_hour(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('lesson_hour/'+id)
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

        }
    }
</script>