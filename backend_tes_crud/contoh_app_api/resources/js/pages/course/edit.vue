<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Mata Pelajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/course"> Kelas </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Mata Pelajaran
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
                    <h5 class="card-header-text">Ubah Mata Pelajaran</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                            <form id="form-class-grade" @submit="update_course">


                                <div class="form-group row" :class="{'has-danger':errors.course_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Mata Pelajaran <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="course_id" type="hidden"  v-model="course.course_id">
                                        <input class="form-control " name="course_name" type="text"  v-model="course.course_name">
                                        <div class="form-control-feedback" v-if="errors.course_name">{{errors.course_name[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.course_code}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">  Kode Mata Pelajaaran </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="course_code" type="text" value=""  v-model="course.course_code">
                                        <div class="form-control-feedback" v-if="errors.course_code">{{errors.course_code[0]}}</div>
                                    </div>
                                </div>


<!-- 
                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id" @change="telo($event)" name="unit_id" v-model="course.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>                                



                             
                                <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Tingkat Kelas  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="class_grade_id" name="class_grade_id" v-model="course.class_grade_id">
                                            <option value="" v-if="list_class_grade.data"> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                    </div>
                                </div>
 -->

                                <div class="form-group row" :class="{'has-danger':errors.course_type}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Type Mata Pelajaran  <span class="form-mandatory">*</span></label>
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
                // class_grade_id:'',
                course_name:'',
                course_status:'',
                course_desc:'',
                course_code:'',
                kkm_value:'',
                // unit_id:'',
                course_id:'',
                course_type:'',
                },   
                isLoading: false,
                fullPage: true,
                time:'',
            }
        },
        created(){
            this.get_unit();
            this.get_class_grade_all().then(()=>{
                this.list_class_grade = this.class_grade;
            });     
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                class_grade_all:state=>state.class_grade_all,
            }),
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/course/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.course.course_name = resp.data.course_name;
                app.course.course_code = resp.data.course_code;
                // app.course.class_grade_id = resp.data.class_grade_id;
                app.course.course_status = resp.data.course_status;
                app.course.course_desc = resp.data.course_desc;
                // app.course.unit_id = resp.data.unit_id;
                app.course.kkm_value = resp.data.kkm_value;
                app.course.course_id = resp.data.course_id;                
                app.course.course_type = resp.data.course_type;                
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_class_grade_all']),
            clear_form(){
                this.course.course_name='';
                // this.course.class_grade_id='';
                this.course.course_status='';
                this.course.course_desc='';
                this.course.course_code='';
                this.course.kkm_value='';
                // this.course.unit_id='';
                this.course.course_type='';
                this.errors=[];
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{
                    this.list_class_grade = this.class_grade;
                });                
            },
            onCancel() {
            },
            update_course(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/course/'+this.course.course_id,this.course).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
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