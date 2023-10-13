<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4> Tambah Soal Ulangan PAS</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/quiz_uas"> Soal Ulangan PAS </router-link>
                    </li>
                    <li class="breadcrumb-item">  Tambah Soal Ulangan PAS
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
                    <h5 class="card-header-text"> Tambah Soal Ulangan PAS</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade" @submit="submit">




                                <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                    <label for="exampleInputEmail1"  class="col-xs-2 col-form-label form-control-label"> Kelas  <span class="form-mandatory">*</span>  </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="quiz_per_kd.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in class_grade.data" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                    </div>
                                </div>


                                <!-- <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                    <label for="exampleInputEmail1"  class="col-xs-2 col-form-label form-control-label"> Rombel  <span class="form-mandatory">*</span>  </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="study_group_id" name="study_group_id" @change="get_course_($event)" v-model="quiz_per_kd.study_group_id">
                                            <option value=""> - Pilih Rombel - </option>
                                            <option  v-for="(item, index) in list_study_group.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
                                        </select>

                                        <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                    </div>
                                </div> -->

                                <div class="form-group row" :class="{'has-danger':errors.course_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Pilih Mata Pelajaran<span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="course_id" @change="get_kd_($event)" name="course_id" v-model="quiz_per_kd.course_id">
                                            <option value=""> - Pilih Mata Pelajaran - </option>
                                            <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course_id"> {{item.course_name}} </option>
                                            <!-- <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course.course_id"> {{item.course.course_name}} </option> -->
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.course_id">{{errors.course_id[0]}}</div>
                                    </div> 
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.kd_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">  Pilih KD  <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="kd_id"  name="kd_id" v-model="quiz_per_kd.kd_id">
                                            <option value=""> - Pilih KD - </option>
                                            <option  v-for="(item, index) in list_kd " :key="index" :value="item.kd_id"> {{item.kd_code}} - {{item.kd_name}} - {{item.kd_type}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.kd_id">{{errors.kd_id[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.description}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan  <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="description" v-model="quiz_per_kd.description">
                                        <div class="form-control-feedback" v-if="errors.description">{{errors.description[0]}}</div>
                                    </div>
                                </div> 



                                <div class="form-group row" :class="{'has-danger':errors.total_question}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label"> Jumlah Soal  <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" @keypress="onlyNumber"  name="total_question" v-model="quiz_per_kd.total_question">
                                        <div class="form-control-feedback" v-if="errors.total_question">{{errors.total_question[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30" id="btn-simpan">Simpan</button>
                                            <router-link to="/quiz_uas" class="btn btn-default m-r-30">Batal</router-link>
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
            list_kd : [],
            list_course_ : [],
            list_class_grade:[],
            list_study_group:[],
            quiz_per_kd:{
                course_id:'',
                total_question:'',
                kd_id:'',
                description:'',
                class_grade_id:'',
                study_group_id:'',
                type_question:'uas',
                },   
            }
        },
     
        created(){
            // this.get_course();
            this.get_class_grade_all();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                course:state=>state.course,
                data_kd_course:state=>state.data_kd_course,
                class_grade:state=>state.class_grade,
                course_study_group:state=>state.course_study_group,
                study_group:state=>state.study_group,

            }),
        },
        methods:{

            ...mapActions('application',['get_unit','get_data_kd_course','get_class_grade_all','get_course_study_group','get_study_group']),
            clear_form(){
                this.quiz_per_kd.course_id='';
                this.quiz_per_kd.total_question='';
                this.quiz_per_kd.description='';
                this.quiz_per_kd.kd_id='';
                this.errors=[];
            },

            get_study_group_(e){
                var app = this;
                app.get_course_study_group(event.target.value).then(()=>{                    
                    app.list_course_ = app.course_study_group;
                });                
            },
            get_course_(e){
                var app = this;

                $axios.get('/get_course_per_kd?study_group_id='+e.target.value)
                .then(function(resp){
                    app.list_course_ = resp.data.data;
                }).catch(function(resp){
                    
                }) ;

                // app.get_course_study_group(event.target.value).then(()=>{                    
                //     app.list_course_ = app.course_study_group;
                // });                
            },
            get_kd_(e){

                var app = this;
                $axios.get('/get_data_kd_course?course_id='+e.target.value+'&type=per_kd&class_grade_id='+app.quiz_per_kd.class_grade_id+'&type_question=uas')
                .then(function(resp){
                    app.list_kd = resp.data;
                }).catch(function(resp){
                    
                })

                // this.get_data_kd_course(e.target.value).then((resp)=>{
                //     this.list_kd = this.data_kd_course;
                // });                
            },
            submit(e){
                $('#btn-simpan').attr('disabled',true);
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/quiz_per_kd`,this.quiz_per_kd).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/quiz_uas');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-simpan').attr('disabled',false);
                    })
                })  
            },
            onlyNumber ($event) {
               let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
               if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                  $event.preventDefault();
               }
            },
            

        },
    }
</script>