<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tahun Ajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Tahun Ajaran
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
                        <h5 class="card-header-text"> Tahun Ajaran </h5>
                    </div>
                    <router-link :to="{name:'unit_year.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>
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
                                        <th>Tahun Ajaran</th>
                                        <th> Unit </th>
                                        <th> Singkatan </th>
                                        <th> Tahapan Belajar </th>
                                        <th> Status </th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody  v-if="data_show.length">
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.unit_year_name}}</td>
                                        <td>{{row.unit.unit_name}}</td>
                                        <td>{{row.unit_year_prefix}}</td>
                                        <td> <router-link :to="{path:'step_study/'+row.unit_year_id}" class="btn btn-success">Tahapan Belajar  </router-link> </td>
                                        <td> 
                                            <button v-if="row.unit_year_status === 'active'" class="btn btn-primary" @click="change_status(row.unit_year_id,'active')">Aktif</button> 
                                            <button v-else class="btn btn-danger" @click="change_status(row.unit_year_id,'deactive')"> Tidak Aktif</button>
                                        </td>
                                      
                                        <td>
                                            <router-link class="btn btn-warning" :to="{name:'unit_year.edit',params:{id:row.unit_year_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                            <button class="btn btn-danger" type="button" @click="delete_unit_year(row.unit_year_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left">
                              <vue-pagination :data="data_post" v-on:pagination-change-page="get_data"></vue-pagination>
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
                data_post:{}
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_unit_year();
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
                axios.get('unit_year?page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_unit_year(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('unit_year?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
                })
            },
            delete_unit_year(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('unit_year/'+id)
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
            change_status(id,status){
                if(status == 'active')
                {
                   var text =  "Apakah Kamu Yakin  Non Aktifkan Tahun Ajaran Ini!";
                   var title =  "Non Aktifkan Tahun Ajaran";
                    var confirm =  "Ya Non Aktifkan ! ";
                    var status = 'deactive';
                }
                else if(status == 'deactive')
                {
                    var text =  "Apakah Kamu Yakin   Aktifkan Tahun Ajaran Ini!";
                    var title =  " Aktifkan Tahun Ajaran";
                    var confirm =  "Ya Aktifkan ! ";
                    var status = 'active'
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

                        axios.get('change_status?unit_year_id='+id+'&status='+status)
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