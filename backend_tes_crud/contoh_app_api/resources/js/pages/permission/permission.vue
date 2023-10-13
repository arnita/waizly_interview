<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Permission</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Permission
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
                    <h5 class="card-header-text">Tambah Permission</h5>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-menu" @submit="submit">


                                  <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.menu_id}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Menu </label>
                                        <select class="form-control" id="menu_id" name="menu_id" v-model="menu.menu_id">
                                            <option value=""> - Pilih Menu - </option>
                                            <option  v-for="(item, index) in data_menu" :key="index" :value="item.menu_id"> {{item.menu_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.menu_id">{{errors.menu_id[0]}}</div>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.name}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Permission</label>
                                        <input type="text" name="name" class="form-control" v-model="menu.name">
                                        <input type="hidden" name="id" class="form-control" v-model="menu.id">
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
                    <h5 class="card-header-text"> Permission </h5>
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
                                <th>Nama Menu</th>
                                <th> Nama Permission </th>
                                <th> Action  </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in data_show">
                                <td>{{index+1}}</td>
                                <td>{{row.menu_name}}</td>
                                <td>{{row.name}}</td>
                                <td>
                                    <button class="btn btn-warning" @click="edit_permission(row.id)" ><i class="fa fa-pencil"></i>
                                    </button>
                                    <button class="btn btn-danger" type="button" @click="delete_permission(row.id)" id="save_btn"><i class="fa fa-minus"></i>
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
                menu:{
                    name:'',
                    id:'',
                    menu_id:'',
                },
                data_post:{},
                data_post_modal:{},
            }
        },
         computed:{
            ...mapState('application', {
                data_menu:state=>state.menu
            }),
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_permission();
                }
                else
                {
                    this.get_data();
                }
            },
        },
        created(){
            this.get_menu();
            this.get_data()
        },
        methods:{
            ...mapActions('application',['get_menu']),
            clear_form(){
                this.menu.name = '';
                this.menu.menu_id = '';
                this.menu.id = '';
            },

            submit(e){
                e.preventDefault();
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/permission`,this.menu)
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        $('#btn-save').attr('disabled',false);    
                        $('#modal').modal('hide');
                        app.get_data();
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
                axios.get('permission?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;
                })
                .catch(function(error){
                    app.loading=false;
                })              
            },

            search_permission(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('permission?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                })
                .catch(function(error){
                })
            },
            delete_permission(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('permission/'+id)
                        .then(function(resp){
                            app.get_data();
                        })
                        .catch(function(resp){

                        })
                    }
                })
            },
            edit_permission(id){
                var app = this;
                axios.get('permission/'+id+'/edit')
                .then(function(resp){
                    app.menu.name = resp.data.name;
                    app.menu.menu_id = resp.data.menu_id;
                    app.menu.id = resp.data.id;
                })
                .catch(function(resp){

                })
            },

        }
    }
</script>