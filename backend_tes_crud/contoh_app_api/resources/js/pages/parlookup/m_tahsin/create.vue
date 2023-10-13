<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Input Tahsin</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/m_tahsin">  Input Tahsin </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Input Tahsin
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
                    <h5 class="card-header-text">Tambah Input Tahsin</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade" @submit="submit">
                                <div class="form-group row" :class="{'has-danger':errors.name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Input Tahsin <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="name" type="text" value=""  v-model="parlookup_tahsin.name">
                                        <div class="form-control-feedback" v-if="errors.name">{{errors.name[0]}}</div>
                                    </div>
                                </div>

                        

                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                       <select class="form-control" id="unit_id" name="unit_id" v-model="parlookup_tahsin.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="desc" v-model="parlookup_tahsin.desc">
                                        <div class="form-control-feedback" v-if="errors.desc">{{errors.parlookup_tahsin_desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/m_tahsin" class="btn btn-default m-r-30">Batal</router-link>
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
    import $axios from '../../../api.js'
    export default{
        name:'create',
        data(){
        return {
            errors : [],
            parlookup_tahsin:{
                name:'',
                unit_id:'',
                desc:'',
                unit_id:'',
                category:'tahsin'
                },   
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
                this.parlookup_tahsin.name='';
                this.parlookup_tahsin.desc='';
                this.parlookup_tahsin.unit_id='';
                this.errors=[];
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/store_parlookup`,this.parlookup_tahsin).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/m_tahsin');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>