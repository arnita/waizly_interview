<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Struktur Tematik</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Struktur Tematik
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
                        <h5 class="card-header-text"> Struktur Tematik </h5>
                    </div>
                    <router-link :to="{name:'structure_tematic.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" name="q" placeholder="Cari Nama Tematik...." v-model="search">
                    </div>

                    <div class="col-sm-3 m-t-2 pull-right">
                        <select class="form-control" id="course_id"  name="class_grade_id" v-model="class_grade_id">
                            <option value=""> - Pilih Kelas - </option>
                            <option  v-for="(item, index) in list_grade" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
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
                                        <th>Nama Tematik</th>
                                        <th>Kelas</th>
                                        <th>Keterangan</th>
                                        <th> Action  </th>
                                    </tr>
                                </thead>
                               
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.structure_tematic_name}}</td>
                                        <td>{{row.class_grade.class_grade_name}}</td>
                                        <td>{{row.structure_tematic_desc}}</td>
                                        <td>
                                            <router-link class="btn btn-warning" :to="{name:'structure_tematic.edit',params:{id:row.structure_tematic_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                            <button class="btn btn-danger" type="button" @click="delete_structure_tematic(row.structure_tematic_id)"><i class="fa fa-minus"></i>
                                            </button>
                                            <router-link class="btn btn-primary" :to="{name:'set_daily',params:{id:row.structure_tematic_id}}" > Set Daily Test
                                            </router-link>
                                            <router-link class="btn btn-primary" :to="{name:'set_uts',params:{id:row.structure_tematic_id}}" > Set PTS
                                            </router-link>
                                            <router-link class="btn btn-primary" :to="{name:'set_uas',params:{id:row.structure_tematic_id}}" > Set PAS
                                            </router-link>
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
                list_grade:[],
                data_post:{},
                class_grade_id:'',
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_structure_tematic();
                }
                else
                {
                    this.get_data();
                }
            },
            class_grade_id:function(q){
                if(q!=''){
                    this.class_grade_id = q;
                    this.search_structure_tematic();
                }
                else
                {
                    this.class_grade_id = '';
                    this.get_data();
                }  

            },
        },
        mounted(){
            this.get_data();
            this.get_grade();
        },

        methods:{
            get_grade(){
                var app = this;
                axios.get('/get_class_grade_all').then(function(resp){
                    app.list_grade = resp.data.data.data;
                }); 
            },
            get_data(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('structure_tematic?page='+page+'&class_grade_id='+app.class_grade_id)
                .then(function(resp){
                    
                    app.data_show = resp.data.data;
                    app.data_post = resp;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_structure_tematic(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('structure_tematic?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp;
                })
                .catch(function(error){
                })
            },
            delete_structure_tematic(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('structure_tematic/'+id)
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