<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Kompetensi Dasar</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/kd"> Kompetensi Dasar </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Kompetensi Dasar
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
                    <h5 class="card-header-text">Ubah Kompetensi Dasar</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :is-full-page="fullPage"></loading>
                            <form id="form-class-grade" @submit="update_kd">


                             <!--    <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="kd.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>                                
 -->
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
                                        <input class="form-control" autocomplete="off" name="kd_code" type="hidden" value=""  v-model="kd.kd_id">
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
                                            <button type="submit" id="btn-simpan" class="btn btn-primary m-r-30">Update</button>
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
                    kd_id:'',
                    kd_code:'',
                    kd_name:'',
                    kd_desc:'',
                    kd_type:'',
                    course_id:null,
                    class_grade_id:'',
                    unit_id:''
                },   
                isLoading: false,
                fullPage: true,
                time:'',
            }
        },
        created(){
            // this.get_unit();
            // $axios.get('/get_course_by_class_drop?class_grade_id='+this.$route.params.id).then(function(resp){
            //         app.list_course_ = resp.data;
            //     });  
            this.get_class_grade_all();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                course:state=>state.course,
                class_grade:state=>state.class_grade,
                course_study_group:state=>state.course_study_group,
            }),
        },
        mounted(){

            var id = this.$route.params.id;
            var app = this;
            // app.isLoading = true;
            $axios.get('/kd/'+id+'/edit')
            .then(function(resp){
                console.log(resp);

                $axios.get('/get_course_edit_kd?class_grade_id='+resp.data.data.class_grade_id).then(function(resp){
                    app.list_course_ = resp.data.data;
                    console.log(resp.data);
                });       

                // app.isLoading = false;
                app.kd.kd_id = resp.data.data.kd_id;
                app.kd.kd_name = resp.data.data.kd_name;
                app.kd.kd_desc = resp.data.data.kd_desc;
                app.kd.kd_code = resp.data.data.kd_code;
                app.kd.kd_type = resp.data.data.kd_type;
                app.kd.course_id = resp.data.data.course_setting_id;
                app.kd.unit_id = resp.data.data.unit_id;
                app.kd.class_grade_id = resp.data.data.class_grade_id;
            })
            .catch(function(resp){

            })
        },
        methods:{

            ...mapActions('application',['get_class_grade','get_unit','get_class_grade_all']),
            clear_form(){
                this.kd.kd_code='';
                this.kd.kd_name='';
                this.kd.kd_desc='';
                this.kd.kd_type='';
                this.kd.course_id='';
                this.errors=[];
            },
            onCancel() {
            },
            get_course_(e){      
                var app = this;
                $axios.get('/get_course_by_class_drop?class_grade_id='+e.target.value).then(function(resp){
                    app.list_course_ = resp.data;
                });       
            },
            update_kd(e){
                e.preventDefault();
                var app = this;
                $('#btn-simpan').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    $axios.put('/kd/'+this.kd.kd_id,this.kd).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/kd');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-simpan').attr('disabled',true);
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