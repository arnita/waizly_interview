<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Menu</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Menu
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
                    <h5 class="card-header-text">Tambah Menu</h5>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-menu" @submit="submit">
                                <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.menu_name}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Menu</label>
                                        <input type="text" name="menu_name" class="form-control" v-model="menu.menu_name">
                                        <input type="hidden" name="menu_id" class="form-control" v-model="menu.menu_id">
                                        <div class="form-control-feedback" v-if="errors.menu_name">{{errors.menu_name[0]}}</div>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div id="blekok"></div>
                                    <div class="form-group row" :class="{'has-danger':errors.menu_parent}" id="asem_telo">
                                        <label for="exampleInputEmail1" class="form-control-label"> Menu Induk </label>
                                        <select class="form-control" id="menu_parent" name="menu_parent" v-model="menu.menu_parent">
                                            <option value=""> - Pilih Menu - </option>
                                            <option value="0"> - Jadikan Menu Utama - </option>
                                         </select>
                                        <div class="form-control-feedback" v-if="errors.menu_parent">{{errors.menu_parent[0]}}</div>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.menu_url}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Menu Url </label>
                                        <input type="text" name="menu_url" class="form-control" v-model="menu.menu_url">
                                        <div class="form-control-feedback" v-if="errors.menu_url">{{errors.menu_url[0]}}</div>
                                    </div>
                                </div>



                                <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.no_urut}">
                                        <label for="exampleInputEmail1" class="form-control-label"> No Urut </label>
                                        <input type="text" name="no_urut" class="form-control" v-model="menu.no_urut">
                                        <div class="form-control-feedback" v-if="errors.no_urut">{{errors.no_urut[0]}}</div>
                                    </div>
                                </div>



                                <div class="col-sm-12">
                                    <div class="form-group row" :class="{'has-danger':errors.menu_desc}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Keterangan Menu </label>
                                        <input type="text" name="menu_desc" class="form-control" v-model="menu.menu_desc">
                                        <div class="form-control-feedback" v-if="errors.menu_desc">{{errors.menu_desc[0]}}</div>
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
                    <h5 class="card-header-text">Menu</h5>
                    </div>
                    <div class="col-sm-6 m-t-2 pull-right">
                        <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                    </div>
                </div>
                <div class="card-block table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama Menu</th>
                                <th> Menu Induk </th>
                                <th>Menu Url</th>       
                                <th>No Urut</th>           
                                <th>Keterangan Menu</th>           
                                <th> Action  </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in data_show">
                                <td>{{index+1}}</td>
                                <td>{{row.menu_name}}</td>
                                <td>{{row.menu_parent}}</td>
                                <td>{{row.menu_url}}</td>
                                <td>{{row.no_urut}}</td>
                                <td>{{row.menu_desc}}</td>
                                <td>
                                    <button class="btn btn-warning" @click="edit_menu(row.menu_id)" ><i class="fa fa-pencil"></i>
                                    </button>
                                    <button class="btn btn-danger" type="button" @click="delete_menu(row.menu_id)" id="save_btn"><i class="fa fa-minus"></i>
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
import $ from 'jquery';

    export default{
        data:function(){
            return {
                data_show:[],
                errors : [],
                loading:true,
                search:'',
                menu:{
                    menu_name:'',
                    menu_url:'',
                    no_urut:'',
                    menu_parent:'',
                    menu_desc:'',
                    menu_id:'',
                },
                data_post:{},
                data_post_modal:{},
            }
        },
         computed:{
            ...mapState('application', {
                menu_parent:state=>state.menu_parent,
                menu_sub:state=>state.menu_sub
            }),
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_menu();
                }
                else
                {
                    this.get_data();
                }
            },
        },
        created(){
            // this.get_menu_parent();
            this.get_data()
             axios.get('get_menu_all')
                .then(function(resp){
                    $.each(resp.data.data.data,function(index,val){
                        var sb1 = index.split('-');
                        $('#menu_parent').append('<option value="'+sb1[0]+'">'+sb1[1]+'</option>');        
                        $.each(val.sub,function(i,v){      
                            if(v != '')
                            {
                                var sb = v[0].split('-');
                                $('#menu_parent').append('<option value="'+sb[0]+'"> --'+sb[1]+'</option>');        
                            }
                        })
                    })
                    
                })
                .catch(function(error){
                    
                })      
        },
        methods:{
            ...mapActions('application',['get_menu_parent']),
            clear_form(){
                $('[name="no_urut"]').attr('readonly',false);
                this.menu.menu_name = '';
                this.menu.menu_parent = '';
                this.menu.menu_url = '';
                this.menu.no_urut = '';
                this.menu.menu_desc = '';
                this.menu.menu_id = '';
            },

            submit(e){
                e.preventDefault();
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/menu`,this.menu)
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        $('#btn-save').attr('disabled',false);    
                        $('#modal').modal('hide');
                        location.reload();
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
                axios.get('menu?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;
                })
                .catch(function(error){
                    app.loading=false;
                })              
            },


            search_menu(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('menu?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                })
                .catch(function(error){
                })
            },
            delete_menu(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('menu/'+id)
                        .then(function(resp){
                            location.reload();
                        })
                        .catch(function(resp){

                        })
                    }
                })
            },
            edit_menu(id){
                $('[name="no_urut"]').attr('readonly',true);
                var app = this;
                axios.get('menu/'+id+'/edit')
                .then(function(resp){
                    app.menu.menu_name = resp.data.menu_name;
                    app.menu.menu_parent = resp.data.menu_parent;
                    app.menu.menu_url = resp.data.menu_url;
                    app.menu.no_urut = resp.data.no_urut;
                    app.menu.menu_desc = resp.data.menu_desc;
                    app.menu.menu_id = resp.data.menu_id;
                    app.get_data();
                })
                .catch(function(resp){

                })
            },

        }
    }

</script>