<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>YAYASAN</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Yayasan
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
                        <h5 class="card-header-text"> Yayasan </h5>
                    </div>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-institution" @submit="submit">
                                <div class="form-group row" :class="{'has-danger':errors.institution_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Yayasan <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control"  name="institution_id" type="hidden"  v-model="institution.institution_id">
                                        <input class="form-control " name="institution_name" type="text"  v-model="institution.institution_name">
                                        <div class="form-control-feedback" v-if="errors.institution_name">{{errors.institution_name[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.institution_telp}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label">No Telepon <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text"   name="institution_telp" v-model="institution.institution_telp">
                                        <div class="form-control-feedback" v-if="errors.institution_telp">{{errors.institution_telp[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.institution_address}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label">Alamat <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text"   name="institution_address" v-model="institution.institution_address">
                                        <div class="form-control-feedback" v-if="errors.institution_address">{{errors.institution_address[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.institution_email}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label"> <span class="form-mandatory">*</span>  Email Yayasan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="email"   name="institution_email" v-model="institution.institution_email">
                                        <div class="form-control-feedback" v-if="errors.institution_email">{{errors.institution_email[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.institution_desc}">
                                    <label for="example-search-input" class="col-xs-2 col-form-label form-control-label">Keterangan</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="institution_desc" type="text"  v-model="institution.institution_desc">
                                        <div class="form-control-feedback" v-if="errors.institution_desc">{{errors.institution_desc[0]}}</div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
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
                errors : [],
                institution:{
                    institution_name:'',
                    institution_desc:'',
                    institution_address:'',
                    institution_telp:'',
                    institution_email:'',
                    institution_id:'',
                    // institution_status:'',
                },
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
                axios.get('foundation?page='+page)
                .then(function(resp){
                    console.log(resp);
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  

                    app.institution.institution_id=resp.data.data.institution_id;
                    app.institution.institution_name=resp.data.data.institution_name;
                    app.institution.institution_desc=resp.data.data.institution_desc;
                    app.institution.institution_address=resp.data.data.institution_address;
                    app.institution.institution_telp=resp.data.data.institution_telp;
                    app.institution.institution_email=resp.data.data.institution_email;

                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
           
            clear_form(){
                this.institution.institution_name='';
                this.institution.institution_desc='';
                this.institution.institution_address='';
                this.institution.institution_telp='';
                this.institution.institution_email='';
                this.institution.institution_start_time='';
                this.institution.institution_end_time='';
                this.institution.institution_status='';
                this.errors=[];
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    axios.post(`/foundation`,this.institution).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        location.reload(true);
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })  
            },

        }
    }
</script>