<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Yayasan</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/foundation"> Yayasan </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Yayasan
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
                    <h5 class="card-header-text">Tambah Yayasan</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-foundation" @submit="submit">
                                <div class="form-group row" :class="{'has-danger':errors.foundation_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Yayasan <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="foundation_name" type="text" value=""  v-model="foundations.foundation_name">
                                        <div class="form-control-feedback" v-if="errors.foundation_name">{{errors.foundation_name[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.foundation_telp}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label">No Telepon <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="foundation_telp" v-model="foundations.foundation_telp">
                                        <div class="form-control-feedback" v-if="errors.foundation_telp">{{errors.foundation_telp[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.foundation_address}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label">Alamat <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="foundation_address" v-model="foundations.foundation_address">
                                        <div class="form-control-feedback" v-if="errors.foundation_address">{{errors.foundation_address[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.foundation_email}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Email Yayasan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="email" value=""  name="foundation_email" v-model="foundations.foundation_email">
                                        <div class="form-control-feedback" v-if="errors.foundation_email">{{errors.foundation_email[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.foundation_desc}">
                                    <label for="example-search-input" class="col-xs-2 col-form-label form-control-label">Keterangan</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="foundation_desc" type="text" value="" v-model="foundations.foundation_desc">
                                        <div class="form-control-feedback" v-if="errors.foundation_desc">{{errors.foundation_desc[0]}}</div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/foundation" class="btn btn-default m-r-30">Batal</router-link>
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
    <!-- Tables end -->
</div>
       
</template>
<script>
    import {mapActions,mapState,mapMutations} from 'vuex'
    import axios from '../../api.js'
    export default{
        name:'create',
        data(){
        return {
            errors : [],
            foundations:{
                foundation_name:'',
                foundation_desc:'',
                foundation_address:'',
                foundation_telp:'',
                foundation_email:'',
                foundation_start_time:'',
                foundation_end_time:'',
                foundation_status:'',
                },
                
            }
        },
        methods:{
            clear_form(){
                this.foundations.foundation_name='';
                this.foundations.foundation_desc='';
                this.foundations.foundation_address='';
                this.foundations.foundation_telp='';
                this.foundations.foundation_email='';
                this.foundations.foundation_start_time='';
                this.foundations.foundation_end_time='';
                this.foundations.foundation_status='';
                this.errors=[];
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    axios.post(`/foundation`,this.foundations).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        location.reload(true);
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>