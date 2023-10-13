<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Kelas</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/lesson_hour"> Kelas </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Kelas
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
                    <h5 class="card-header-text">Ubah Kelas</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                            <form id="form-class-grade" @submit="update_lesson_hour">
                                <div class="form-group row" :class="{'has-danger':errors.lesson_day}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Hari <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="lesson_hour_id" type="hidden" value=""  v-model="lesson_hour.lesson_hour_id">
                                        <input class="form-control " name="lesson_day" type="text" value=""  v-model="lesson_hour.lesson_day">
                                        <div class="form-control-feedback" v-if="errors.lesson_day">{{errors.lesson_day[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.hour_to}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Pelajaran Ke -  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="hour_to" type="number" value=""  v-model="lesson_hour.hour_to">
                                        <div class="form-control-feedback" v-if="errors.hour_to">{{errors.hour_to[0]}}</div>
                                    </div>
                                </div>

                             
                                <div class="form-group row" :class="{'has-danger':errors.lesson_hour_type}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Tipe Jam  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="lesson_hour_type" name="lesson_hour_type" v-model="lesson_hour.lesson_hour_type">
                                            <option value=""> - Pilih Tipe - </option>
                                            <option value="jam pelajaran"> Jam Pelajaran </option>
                                            <option value="jam isitrahat"> Jam Istirahat </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.lesson_hour_type">{{errors.lesson_hour_type[0]}}</div>
                                    </div>
                                </div>

                              

                                <div class="form-group row" :class="{'has-danger':errors.lesson_hour_start}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Waktu Mulai <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <datetime type="time" v-model="lesson_hour.lesson_hour_start" format="HH:mm" input-class="form-control"></datetime>

                                         <div class="form-control-feedback" v-if="errors.lesson_hour_start">{{errors.lesson_hour_start[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.lesson_hour_end}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Waktu Selesai  <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-10">
                                        <datetime type="time" v-model="lesson_hour.lesson_hour_end" format="HH:mm"  input-class="form-control"></datetime>

                                        <div class="form-control-feedback" v-if="errors.lesson_hour_end">{{errors.lesson_hour_end[0]}}</div>
                                    </div>
                                </div> 

                                <div class="form-group row" :class="{'has-danger':errors.lesson_hour_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="lesson_hour_desc" v-model="lesson_hour.lesson_hour_desc">
                                        <div class="form-control-feedback" v-if="errors.lesson_hour_desc">{{errors.lesson_hour_desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/lesson_hour" class="btn btn-default m-r-30">Batal</router-link>
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
            lesson_hour:{
                lesson_day:'',
                hour_to:'',
                lesson_hour_start:'',
                lesson_hour_end:'',
                lesson_hour_desc:'',
                lesson_hour_type:'',
                lesson_hour_id:'',
                },  
                isLoading: false,
                fullPage: true,
                time:'',
            }
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/lesson_hour/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.lesson_hour.lesson_day = resp.data.lesson_day;
                app.lesson_hour.hour_to = resp.data.hour_to;
                app.lesson_hour.lesson_hour_start = resp.data.lesson_hour_start;
                app.lesson_hour.lesson_hour_end = resp.data.lesson_hour_end;
                app.lesson_hour.lesson_hour_desc = resp.data.lesson_hour_desc;
                app.lesson_hour.lesson_hour_type = resp.data.lesson_hour_type;
                app.lesson_hour.lesson_hour_id = resp.data.lesson_hour_id;
                
            })
            .catch(function(resp){

            })
        },
        methods:{
            clear_form(){
                this.lesson_hour.lesson_day='';
                this.lesson_hour.hour_to='';
                this.lesson_hour.lesson_hour_start='';
                this.lesson_hour.lesson_hour_end='';
                this.lesson_hour.lesson_hour_desc='';
                this.lesson_hour.lesson_hour_type='';
                this.errors=[];
            },
            onCancel() {
            },
            update_lesson_hour(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/lesson_hour/'+this.lesson_hour.lesson_hour_id,this.lesson_hour).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/lesson_hour');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>