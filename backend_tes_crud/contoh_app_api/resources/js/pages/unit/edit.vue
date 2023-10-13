<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Unit</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/unit"> Unit </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Unit
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
                    <h5 class="card-header-text">Ubah Unit</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-unit" @submit="update_unit">
                                 <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                                <div class="form-group row" :class="{'has-danger':errors.unit_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Unit <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="unit_name" type="text" value=""  v-model="units.unit_name">
                                        <input type="hidden" name="unit_id" v-model="units.unit_id">
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
                                            <button type="submit" class="btn btn-primary m-r-30">Ubah</button>
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
                unit_id :''
                },
                isLoading: false,
                fullPage: true,
            }
        },
        mounted(){
            this.isLoading = true;
            var id = this.$route.params.id;
            var app = this;
            $axios.get('/unit/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.units.unit_id = resp.data.unit_id;
                app.units.unit_name = resp.data.unit_name;
                app.units.unit_desc = resp.data.unit_desc;
                app.units.unit_address = resp.data.unit_address;
                app.units.unit_telp = resp.data.unit_telp;
                app.units.unit_email = resp.data.unit_email;
            })
            .catch(function(resp){

            })
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
            onCancel() {
            },
            update_unit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/unit/'+this.units.unit_id,this.units).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
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