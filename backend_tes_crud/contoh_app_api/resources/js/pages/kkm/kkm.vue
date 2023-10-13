<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>KKM</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">KKM
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
                        <h5 class="card-header-text"> KKM </h5>
                    </div>

                    <div class="col-sm-3 pull-left">
                        <router-link :to="{name:'kkm.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>
                    </div>

                     <!-- <div class="col-sm-3 m-t-2 pull-left">
                        <button class="btn btn-success" @click="copy_kkm">  <span style="font-size:10px"> copy dari tahun sebelumnya   </span></button>
                    </div> -->
                    

                    <div class="col-sm-3 m-t-2 pull-right">                        
                        <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
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
                                        <th> Kelas </th>
                                        <th> Mata Pelajaran </th>
                                        <th> KKM </th>
                                        <th> Nilai Predikat A</th>
                                        <th> Nilai Predikat B</th>
                                        <th> Nilai Predikat C</th>
                                        <th> Nilai Predikat D</th>
                                        <th> Action  </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>
                                            <span v-if="row.class_grade !=  null ">
                                                {{row.class_grade.class_grade_name}}
                                            </span>
                                            <span v-else >
                                                
                                            </span>
                                        </td>
                                        <td>{{row.course.course_name}}</td>
                                        <td>{{row.kkm_value}}</td>
                                        <td>{{row.kkm_a}}</td>
                                        <td>{{row.kkm_b}}</td>
                                        <td>{{row.kkm_c}}</td>
                                        <td>{{row.kkm_d}}</td>
                                        <td>
                                            <router-link class="btn btn-warning" :to="{name:'kkm.edit',params:{id:row.kkm_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                            <button class="btn btn-danger" type="button" @click="delete_kkm(row.kkm_id)"><i class="fa fa-minus"></i>
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
                data_post:{},
                class_grade_id:'',
                list_grade:[],
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_kkm();
                }
                else
                {
                    this.get_data();
                }
            },
            class_grade_id:function(q){
                if(q!=''){
                    this.class_grade_id = q;
                    this.search_kkm();
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
            get_data(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('kkm?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id)
                .then(function(resp){
                    console.log(resp.data);
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_grade(){
                var app = this;
                axios.get('/get_class_grade_all').then(function(resp){
                    app.list_grade = resp.data.data.data;
                }); 
            },
            search_kkm(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('kkm?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                })
                .catch(function(error){
                })
            },
            delete_kkm(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('kkm/'+id)
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
            copy_kkm()
            {
                swal({
                    title:"Apakah kamu yakin",
                    text:"Akan Mengcopy data KKM dari tahun sebelumnya",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.post('copy_kkm')
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
            }

        }
    }
</script>