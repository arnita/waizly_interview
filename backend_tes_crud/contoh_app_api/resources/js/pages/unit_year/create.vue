<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Tahun Ajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/unit_year"> Tahun Ajaran </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Tahun Ajaran
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
                    <h5 class="card-header-text">Tambah Tahun Ajaran</h5>
                </div>


                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-unit-year" @submit="submit">
                                <div class="form-group row" :class="{'has-danger':errors.unit_year_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Tahun Ajaran <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="unit_year_name" type="text"   v-model="unit_year.unit_year_name">
                                        <div class="form-control-feedback" v-if="errors.unit_year_name">{{errors.unit_year_name[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
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
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Singkatan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text"   name="unit_year_prefix" v-model="unit_year.unit_year_prefix">
                                        <div class="form-control-feedback" v-if="errors.unit_year_prefix">{{errors.unit_year_prefix[0]}}</div>
                                    </div>
                                </div> 

                              
                                  <div class="form-group row" :class="{'has-danger':errors.unit_year_desc}">
                                    <label for="example-search-input" class="col-xs-2 col-form-label form-control-label">Keterangan</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="unit_year_desc" type="text"  v-model="unit_year.unit_year_desc">
                                        <div class="form-control-feedback" v-if="errors.unit_year_desc">{{errors.unit_year_desc[0]}}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit"  id="btn-simpan"  class="btn btn-primary m-r-30">Simpan</button>
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
    import { mapActions, mapMutations, mapGetters, mapState } from 'vuex';
    import $axios from '../../api.js'
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
                unit_year_status:'active',
                unit_year_end:'',
                },
                data_unit : [],

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
            submit(e){
                e.preventDefault();
                $('#btn-simpan').attr("disabled",true);
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/unit_year`,this.unit_year).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
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