<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Unit</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/unit"> Unit </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Unit
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
                    <h5 class="card-header-text">Tambah Unit</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-unit" @submit="submit">
                                <div class="form-group row" :class="{'has-danger':errors.unit_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Unit <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="unit_name" type="text" value=""  v-model="units.unit_name">
                                        <div class="form-control-feedback" v-if="errors.unit_name">{{errors.unit_name[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.unit_telp}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label">No Telepon <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="unit_telp" v-model="units.unit_telp">
                                        <div class="form-control-feedback" v-if="errors.unit_telp">{{errors.unit_telp[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.unit_address}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label">Alamat <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="unit_address" v-model="units.unit_address">
                                        <div class="form-control-feedback" v-if="errors.unit_address">{{errors.unit_address[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.unit_email}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Email Unit </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="email" value=""  name="unit_email" v-model="units.unit_email">
                                        <div class="form-control-feedback" v-if="errors.unit_email">{{errors.unit_email[0]}}</div>
                                    </div>
                                </div>
                                  <div class="form-group row" :class="{'has-danger':errors.unit_desc}">
                                    <label for="example-search-input" class="col-xs-2 col-form-label form-control-label">Keterangan</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="unit_desc" type="text" value="" v-model="units.unit_desc">
                                        <div class="form-control-feedback" v-if="errors.unit_desc">{{errors.unit_desc[0]}}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/unit" class="btn btn-default m-r-30">Batal</router-link>
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
    import $axios from '../../api.js'
    export default{
        name:'create',
        data(){
        return {
            errors : [],
            units:{
                unit_name:'',
                unit_desc:'',
                unit_address:'',
                unit_telp:'',
                unit_email:'',
                },
                
            }


        },
        methods:{
            clear_form(){
                this.units.unit_name='';
                this.units.unit_desc='';
                this.units.unit_address='';
                this.units.unit_telp='';
                this.units.unit_email='';
                this.errors=[];
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/unit`,this.units).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/unit');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>