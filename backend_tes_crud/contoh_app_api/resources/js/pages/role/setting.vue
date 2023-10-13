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
                    <h5 class="card-header-text"> Role</h5>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-role">
                                <div class="col-sm-12">
                                    <div class="form-group row" >
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Role</label>
                                        <input type="text" name="name" readonly class="form-control" v-model="role.name">
                                        <input type="hidden" name="id" class="form-control" v-model="role.id">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" @click="save_role_permission" class="btn btn-primary m-r-30" id="btn-save">Simpan</button>
                                            <router-link  to="/role" class="btn btn-default m-r-30">Batal</router-link>
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
                    <h5 class="card-header-text"> Setting Permission Role</h5>
                    </div>
                    <div class="col-sm-6 m-t-2 pull-right">
                        <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                    </div>
                </div>
                <div class="card-block">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" @click="selectAll_" name="student_id" v-model="allSelected">
                                        </label>
                                    </div>
                                </th>
                                <th>Nama Permission</th>                                         
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in data_show">
                                <td>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" v-model="selected"    @input="checked = $event.target.checked"  :value="row.id" name="permission_id">
                                        </label>
                                    </div>
                                </td>
                                <td>{{row.name}}</td>
                            </tr>
                        </tbody>
                        
                    </table>
                    <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                    

                    
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
                selected:[],
                allSelected:false,
                search:'',
                role:{
                    name:'',
                    id:'',
                },
                data_post:{},
                data_selected:[],
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
            this.get_data();
            // this.get_selected();
        },
        methods:{
            selectAll_(){
                this.selected =[];
                if(!this.allSelected){
                    for(var permission in this.data_show){
                        this.selected.push(this.data_show[permission].id);
                    }
                }
                else
                {
                    this.selected=[];
                }
            },
           async search_role(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await axios.get('role_setting?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data;
                    app.data_post = resp;
                })
                .catch(function(error){
                })
            },
            async get_data(page){
                var app = this;
                app.role.name=this.$route.params.name;
                app.role.id=this.$route.params.id;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await axios.get('role_setting?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data;
                    app.data_post = resp;
                    app.loading=false;

                    axios.get('get_selected?id='+app.role.id+'&page='+page)
                    .then(function(resp){
                        app.data_selected = resp.data;

                        
                        for(var row in app.data_show){

                            for(var i=0;i<app.data_selected.length;i++)
                            {
                                if(app.data_selected[i] == app.data_show[row].id)
                                {   
                                    app.selected.push(app.data_show[row].id);    
                                }
                            }
                        }
                        
                    })
                    .catch(function(error){
                    })    
                })
                .catch(function(error){
                    app.loading=false;
                })              
            },
            async get_selected(page){
                app.role.name=this.$route.params.name;
                app.role.id=this.$route.params.id;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await axios.get('get_selected?id='+app.role.id+'&page='+page)
                .then(function(resp){
                    app.data_selected = resp.data;

                    
                    for(var row in app.data_show){

                        for(var i=0;i<app.data_selected.length;i++)
                        {
                            if(app.data_selected[i] == app.data_show[row].id)
                            {   
                                console.log(app.data_show[row].id);
                                app.selected.push(app.data_show[row].id);    
                            }
                        }
                    }
                    
                })
                .catch(function(error){
                })              
            },
            save_role_permission(e){
                e.preventDefault();
                var app = this;
                $('#btn-save').attr('disabled',true);
                $('#btn-save').text('Loading ....');
                return new Promise((resolve,reject)=>{
                    axios.post(`/save_role_permission`,
                        {
                            'permission_id':app.selected,
                            'name':app.role.name,
                        }
                    )
                    .then(function(resp){
                        
                        $('#btn-save').attr('disabled',false);   
                        $('#btn-save').text('Simpan');
                        //app.$router.push('/role') 
                        swal({title: "Success", text: "Simpan data berhasil!", type: "success"},
                        ).then((response) => {
                             location.reload(true);
                        });
                    }).catch(function(resp){
                        console.log(resp);
                        app.errors = resp.response.data.errors;
                        $('#btn-save').attr('disabled',false);
                        $('#btn-save').text('Simpan');
                    })
                })
            }
        }
    }
</script>

