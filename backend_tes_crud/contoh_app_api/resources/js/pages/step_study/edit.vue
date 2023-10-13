<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Tahapan Belajar</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/step_study" > Tahun Ajaran </router-link>
                    </li>
                    <li class="breadcrumb-item"> <router-link :to="{path:'/step_study/'+$route.params.id}" > Tahapan Belajar </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Tahapan Belajar Tahun 
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
                    <h5 class="card-header-text">Tambah Tahapan Belajar</h5>
                </div>


                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-unit-year" @submit="update_step_study">
                                 <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                                <div class="form-group row" :class="{'has-danger':errors.step_study_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Tahapan Belajar <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="step_study" v-model="step_study.step_study_id">
                                        <input class="form-control " name="unit_year_id" type="hidden"   v-model="step_study.unit_year_id">
                                        <input class="form-control " name="step_study_name" type="text"   v-model="step_study.step_study_name">
                                        <div class="form-control-feedback" v-if="errors.step_study_name">{{errors.step_study_name[0]}}</div>
                                    </div>
                                </div>
                             

                                <div class="form-group row" :class="{'has-danger':errors.step_study_start}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Tanggal Mulai <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <datetime v-model="step_study.step_study_start"   format="dd-MM-yyyy"  input-class="form-control"></datetime>
                                        <div class="form-control-feedback" v-if="errors.step_study_start">{{errors.step_study_start[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.step_study_end}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Tanggal Selesai <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        
                                        <datetime v-model="step_study.step_study_end" format="dd-MM-yyyy"   input-class="form-control"></datetime>

                                        <div class="form-control-feedback" v-if="errors.step_study_end">{{errors.step_study_end[0]}}</div>
                                    </div>
                                </div> 


                                <div class="form-group row" :class="{'has-danger':errors.date_pts}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Tanggal Cetak Raport PTS <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        
                                        <datetime v-model="step_study.date_pts" format="dd-MM-yyyy"   input-class="form-control"></datetime>

                                        <div class="form-control-feedback" v-if="errors.date_pts">{{errors.date_pts[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.date_pas}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Tanggal Cetak Raport PAS <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        
                                        <datetime v-model="step_study.date_pas" format="dd-MM-yyyy"   input-class="form-control"></datetime>

                                        <div class="form-control-feedback" v-if="errors.date_pas">{{errors.date_pas[0]}}</div>
                                    </div>
                                </div> 



                                  <div class="form-group row" :class="{'has-danger':errors.step_study_desc}">
                                    <label for="example-search-input" class="col-xs-2 col-form-label form-control-label"> Keterangan </label>
                                    <div class="col-sm-10">
                                        
                                        <input class="form-control" name="step_study_desc" type="text"  v-model="step_study.step_study_desc">
                                        
                                        <div class="form-control-feedback" v-if="errors.step_study_desc">{{errors.step_study_desc[0]}}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" id="btn-simpan" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link :to="{path:'/step_study/'+$route.params.id}" class="btn btn-default m-r-30">  Batal </router-link>
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
            step_study:{
                    step_study_name:'',
                    step_study_id:'',
                    unit_year_id:this.$route.params.id,
                    step_study_desc:'',
                    step_study_start:'',
                    step_study_start:'',
                    step_study_end:'',
                    date_pts:'',
                    date_pas:''
                },  
                isLoading: false,
                fullPage: true,
            }
        },
        mounted(){
            var id = this.$route.params.id_edit;
            var app = this;
            app.isLoading = true;
            $axios.get('/step_study/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.step_study.step_study_name= resp.data.step_study_name;
                app.step_study.step_study_desc=resp.data.step_study_desc;
                app.step_study.step_study_start=resp.data.step_study_start;
                app.step_study.step_study_prefix=resp.data.step_study_prefix;
                app.step_study.step_study_end=resp.data.step_study_end;
                app.step_study.date_pts=resp.data.date_pts;
                app.step_study.date_pas=resp.data.date_pas;
                app.step_study.step_study_id = resp.data.step_study_id;
                
            })
            .catch(function(resp){

            })
        },
        methods:{
            clear_form(){
                this.step_study.step_study_name='';
                this.step_study.step_study_desc='';
                this.step_study.step_study_start='';
                this.step_study.step_study_start='';
                this.step_study.date_pts='';
                this.step_study.date_pas='';
                this.step_study.step_study_end='';
                this.errors=[];
            },
             onCancel() {
            },
            update_step_study(e){
                e.preventDefault();
                $('#btn-simpan').attr("disabled",true);
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/step_study/'+this.step_study.step_study_id,this.step_study).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                          app.$router.push({
                                    path: '/step_study/' + app.step_study.unit_year_id, 
                                })
                    }).catch(function(resp){
                        $('#btn-simpan').attr("disabled",false);
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>