<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Role</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Role
                    </li>    
                </ol>
            </div>
        </div>
    </div>
    <!-- Header end -->



    <div class="row">
        <div class="col-sm-6">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <h5 class="card-header-text">Tambah Role</h5>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-role" @submit="submit">
                                <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.name}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Role</label>
                                        <input type="text" name="name" class="form-control" v-model="role.name">
                                        <input type="hidden" name="id" class="form-control" v-model="role.id">
                                        <div class="form-control-feedback" v-if="errors.name">{{errors.name[0]}}</div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30" id="btn-save">Simpan</button>
                                            <button type="reset" class="btn btn-default m-r-30" @click="clear_form">Batal</button>
                                        </center>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                    
                </div>
                
            </div>
            <!-- Basic Table ends -->
        </div>

        <div class="col-sm-6">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                    <h5 class="card-header-text">Role</h5>
                    </div>
                    <div class="col-sm-6 m-t-2 pull-right">
                        <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                    </div>
                </div>
                <div class="card-block">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama Role</th>         
                                <th> Action  </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in data_show">
                                <td>{{index+1}}</td>
                                <td>{{row.name}}</td>
                                <td>
                                    <button class="btn btn-warning" @click="edit_role(row.id)" ><i class="fa fa-pencil"></i>
                                    </button>
                                    <button class="btn btn-danger" type="button" @click="delete_role(row.id)" id="save_btn"><i class="fa fa-minus"></i>
                                    </button>
                                    <!-- <router-link  :to="{name:'role.role_setting',query:{id:row.id,name:row.name}}" class="btn btn-primary"  ><i class="fa fa-gears"></i>
                                    </router-link> -->

                                    <router-link  :to="{name:'role.role_setting',params:{id:row.id,name:row.name}}" class="btn btn-primary"  ><i class="fa fa-gears"></i>
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
                errors : [],
                loading:true,
                search:'',
                role:{
                    name:'',
                    id:'',
                },
                data_post:{},
                data_post_modal:{},
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_role();
                }
                else
                {
                    this.get_data();
                }
            },
        },
        created(){
            this.get_data()
        },
        methods:{
            clear_form(){
                this.role.name = '';
                this.role.id = '';
            },

            submit(e){
                e.preventDefault();
                var app = this;
                $('#btn-save').attr('disabled',true);
                
                return new Promise((resolve,reject)=>{
                    axios.post(`/role`,this.role)
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        $('#btn-save').attr('disabled',false);    
                        app.get_data();
                        app.clear_form();
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-save').attr('disabled',false);
                    })
                })
            },
         
            get_data(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('role?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;
                })
                .catch(function(error){
                    app.loading=false;
                })              
            },

            search_role(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('role?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                })
                .catch(function(error){
                })
            },
            delete_role(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('role/'+id)
                        .then(function(resp){
                            app.get_data();
                        })
                        .catch(function(resp){

                        })
                    }
                })
            },
            edit_role(id){
                var app = this;
                axios.get('role/'+id+'/edit')
                .then(function(resp){
                    app.role.name = resp.data.name;
                    app.role.id = resp.data.id;
                })
                .catch(function(resp){

                })
            },

        }
    }
</script>