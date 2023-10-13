<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Kompetensi Dasar</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/kd">  Kompetensi Dasar </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Kompetensi Dasar
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
                    <h5 class="card-header-text">Tambah Kompetensi Dasar</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade" @submit="submit">

                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="kd.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>                                

                                <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                    <label for="exampleInputEmail1"  class="col-xs-2 col-form-label form-control-label"> Kelas  <span class="form-mandatory">*</span>  </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="class_grade_id" @change="get_course_($event)" name="class_grade_id" v-model="kd.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in class_grade.data" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                    </div>
                                </div>
                             

                                <div class="form-group row" :class="{'has-danger':errors.course_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Mata Pelajaran  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="course_id"  name="course_id" v-model="kd.course_id">
                                            <option value=""> - Pilih Mata Pelajaran - </option>
                                            <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course_setting_id"> {{item.course_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.course_id">{{errors.course_id[0]}}</div>
                                    </div>
                                </div>           


                                <div class="form-group row" :class="{'has-danger':errors.kd_code}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Kode <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off" name="kd_code" type="text" value=""  v-model="kd.kd_code">
                                        <div class="form-control-feedback" v-if="errors.kd_code">{{errors.kd_code[0]}}</div>
                                    </div>
                                </div>                     

                             
                                <div class="form-group row" :class="{'has-danger':errors.kd_name}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label"> Nama KD <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off"  type="text" value=""  name="kd_name" v-model="kd.kd_name">
                                        <div class="form-control-feedback" v-if="errors.kd_name">{{errors.kd_name[0]}}</div>
                                    </div>
                                </div>
                                     

                                     
                                <div class="form-group row" :class="{'has-danger':errors.kd_type}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label"> Type KD <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="kd_type" v-model="kd.kd_type">
                                            <option  value=""> - Pilih Type KD  -  </option>
                                            <option value="Pengetahuan"> Pengetahuan </option>
                                            <option value="Keterampilan"> Keterampilan </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.kd_type">{{errors.kd_type[0]}}</div>
                                    </div>
                                </div>
                                     

                                <div class="form-group row" :class="{'has-danger':errors.kd_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label"> Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off"  type="text" value=""  name="kd_desc" v-model="kd.kd_desc">
                                        <div class="form-control-feedback" v-if="errors.kd_desc">{{errors.kd_desc[0]}}</div>
                                    </div>
                                </div>

                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" id="btn-simpan" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/kd" class="btn btn-default m-r-30">Batal</router-link>
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
            list_class_grade : [],
            list_course_ : [],
            kd:{
                    kd_code:'',
                    kd_name:'',
                    kd_desc:'',
                    kd_type:'',
                    course_id:'',
                    class_grade_id:'',
                    unit_id:'',
                },   

            }
        },
     
        created(){
            this.get_unit();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                course:state=>state.course,
                class_grade:state=>state.class_grade,
                course_study_group:state=>state.course_study_group,
            }),
        },
        methods:{
            ...mapActions('application',['get_class_grade','get_unit']),
            clear_form(){
                this.kd.kd_code='';
                this.kd.kd_name='';
                this.kd.kd_desc='';
                this.kd.kd_type='';
                this.kd.course_id='';
                this.kd.unit_id='';
                this.errors=[];
            },

            get_course_(e){      
                var app = this;
                $axios.get('/get_course_by_id?class_grade_id='+e.target.value).then(function(resp){
                    app.list_course_ = resp.data;
                });       
            },
           
            submit(e){
                e.preventDefault();
                $('#btn-simpan').attr('disabled',true);
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/kd`,this.kd).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/kd');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        if(resp.response.data.errors.code == 1)
                        {
                            swal('Error',resp.response.data.errors.message,'error');
                        }
                        else
                        {
                            app.errors = resp.response.data.errors;
                        }
                        $('#btn-simpan').attr('disabled',false);
                    })
                })  
            },

            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },

            

        },
    }
</script>