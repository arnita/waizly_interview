<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Mata Pelajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/course">  Mata Pelajaran </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Mata Pelajaran
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
                    <h5 class="card-header-text">Tambah Mata Pelajaran</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade" @submit="submit">


                                <div class="form-group row" :class="{'has-danger':errors.course_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Mata Pelajaran <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="course_name" type="text" value=""  v-model="course.course_name">
                                        <div class="form-control-feedback" v-if="errors.course_name">{{errors.course_name[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.course_code}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">  Kode Mata Pelajaran </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="course_code" type="text" value=""  v-model="course.course_code">
                                        <div class="form-control-feedback" v-if="errors.course_code">{{errors.course_code[0]}}</div>
                                    </div>
                                </div>



                                <div class="form-group row" :class="{'has-danger':errors.course_type}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Type Mata Pelajaran  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="course_type" v-model="course.course_type">
                                            <option value="muatan_lokal">Muatan Lokal</option>
                                            <option value="biasa"> Biasa </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.course_type">{{errors.course_type[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.course_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="course_desc" v-model="course.course_desc">
                                        <div class="form-control-feedback" v-if="errors.course_desc">{{errors.course_desc[0]}}</div>
                                    </div>
                                </div>
                                 

                      
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/course" class="btn btn-default m-r-30">Batal</router-link>
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
            course:{
                course_name:'',
                course_status:'',
                course_desc:'',
                course_code:'',
                kkm_value:'',
                course_type:'',
                },   
            }
        },
     
        created(){
            this.get_unit();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
            }),
        },
        methods:{

            ...mapActions('application',['get_unit','get_class_grade']),
            clear_form(){
                this.course.course_name='';
                this.course.course_status='';
                this.course.course_desc='';
                this.course.course_code='';
                this.course.kkm_value='';
                this.course.course_type='';
                this.errors=[];
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{
                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/course`,this.course).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/course');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>