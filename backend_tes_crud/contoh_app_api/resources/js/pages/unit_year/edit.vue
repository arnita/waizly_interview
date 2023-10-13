<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Tahun Ajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/unit_year"> Tahun Ajaran </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Tahun Ajaran
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
                    <h5 class="card-header-text">Ubah Tahun Ajaran</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                             <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                            <form id="form-unit-year" @submit="update_unit_year">
                                <div class="form-group row" :class="{'has-danger':errors.unit_year_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Tahun Ajaran <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="unit_year_id" v-model="unit_year.unit_year_id">
                                        <input class="form-control " name="unit_year_name" type="text" value=""  v-model="unit_year.unit_year_name">
                                        <div class="form-control-feedback" v-if="errors.unit_year_name">{{errors.unit_year_name[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit<span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <!-- <input class="form-control " name="unit_id" type="text" value=""  v-model="unit_year.unit_id"> -->
                                        <select class="form-control" id="unit_id" name="unit_id" v-model="unit_year.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.unit_year_status}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Status  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_year_status" name="unit_year_status" v-model="unit_year.unit_year_status">
                                            <option value="active"> Aktif </option>
                                            <option value="deactive"> Tidak Aktif </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_year_status">{{errors.unit_year_status[0]}}</div>
                                    </div>
                                </div>
                                
                                

                                <div class="form-group row" :class="{'has-danger':errors.unit_year_prefix}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Singkatan  </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="unit_year_prefix" v-model="unit_year.unit_year_prefix">
                                        <div class="form-control-feedback" v-if="errors.unit_year_prefix">{{errors.unit_year_prefix[0]}}</div>
                                    </div>
                                </div> 

                               
                                  <div class="form-group row" :class="{'has-danger':errors.unit_year_desc}">
                                    <label for="example-search-input" class="col-xs-2 col-form-label form-control-label">Keterangan</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="unit_year_desc" type="text" value="" v-model="unit_year.unit_year_desc">
                                        <div class="form-control-feedback" v-if="errors.unit_year_desc">{{errors.unit_year_desc[0]}}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit"  id="btn-simpan"  class="btn btn-primary m-r-30">Ubah</button>
                                            <router-link to="/unit_year" class="btn btn-default m-r-30">Batal</router-link>
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
        // Import component
    
    export default{
        name:'create',
        data(){
        return {
            errors : [],
            unit_year:{
                unit_year_name:'',
                unit_id:'',
                unit_year_desc:'',
                unit_year_start:'',
                unit_year_prefix:'',
                unit_year_end:'',
                unit_year_id:'',
                unit_year_status:'',
                },
                isLoading: false,
                fullPage: true,
            }
        },
        created(){
            this.get_unit();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit
            }),
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/unit_year/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.unit_year.unit_year_name= resp.data.unit_year_name;
                app.unit_year.unit_id=resp.data.unit_id;
                app.unit_year.unit_year_desc=resp.data.unit_year_desc;
                app.unit_year.unit_year_start=resp.data.unit_year_start;
                app.unit_year.unit_year_prefix=resp.data.unit_year_prefix;
                app.unit_year.unit_year_end=resp.data.unit_year_end;
                app.unit_year.unit_year_id=resp.data.unit_year_id;
                app.unit_year.unit_year_status=resp.data.unit_year_status;
                
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_unit']),
            clear_form(){
                this.unit_year.unit_year_name='';
                this.unit_year.unit_id='';
                this.unit_year.unit_year_desc='';
                this.unit_year.unit_year_start='';
                this.unit_year.unit_year_prefix='';
                this.unit_year.unit_year_end='';
                this.errors=[];
            },
             onCancel() {
            },
            update_unit_year(e){
                e.preventDefault();
                $('#btn-simpan').attr("disabled",true);
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/unit_year/'+this.unit_year.unit_year_id,this.unit_year).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/unit_year');
                    }).catch(function(resp){
                        $('#btn-simpan').attr("disabled",false);
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>