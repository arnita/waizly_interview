<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah KKM</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/kkm"> KKM </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah KKM
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
                    <h5 class="card-header-text">Ubah KKM</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                           <form id="form-class-grade" @submit="update_kkm">



                            
                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="exampleInputEmail1" class="col-xs-2 col-form-label  form-control-label">Pilih Unit <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="kkm.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                    </div>
                                    <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                </div>
                            
                                <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                    <label for="exampleInputEmail1" class="col-xs-2 col-form-label  form-control-label"> Pilih Kelas <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="class_grade_id" @change="get_course_($event)" name="class_grade_id" v-model="kkm.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                    </div>
                                    <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                </div>
                            


                                <div class="form-group row" :class="{'has-danger':errors.course_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Mata Pelajaran  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="course_id"  name="course_id" v-model="kkm.course_id">
                                            <option value=""> - Pilih Mata Pelajaran - </option>
                                            <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course_id"> {{item.course_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.course_id">{{errors.course_id[0]}}</div>
                                    </div>
                                </div>           


                                <div class="form-group row" :class="{'has-danger':errors.kkm_value}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nilai KKM <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off" name="kkm_id" type="hidden" readonly  v-model="kkm.kkm_id">
                                        <input class="form-control" autocomplete="off" name="kkm_value" type="text"  @change="get_kkm($event)"  v-model="kkm.kkm_value">
                                        <div class="form-control-feedback" v-if="errors.kkm_value">{{errors.kkm_value[0]}}</div>
                                    </div>
                                </div>                     

                             
                                <div class="form-group row" :class="{'has-danger':errors.kkm_a}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Nilai Predikat A <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off"  type="text" readonly  name="kkm_a" v-model="kkm.kkm_a">
                                        <div class="form-control-feedback" v-if="errors.kkm_a">{{errors.kkm_a[0]}}</div>
                                    </div>
                                </div>
                                     
                                <div class="form-group row" :class="{'has-danger':errors.kkm_b}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Nilai Predikat B <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off"  type="text" readonly  name="kkm_b" v-model="kkm.kkm_b">
                                        <div class="form-control-feedback" v-if="errors.kkm_b">{{errors.kkm_b[0]}}</div>
                                    </div>
                                </div>
                                     
                                <div class="form-group row" :class="{'has-danger':errors.kkm_c}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Nilai Predikat C <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off"  type="text" readonly  name="kkm_c" v-model="kkm.kkm_c">
                                        <div class="form-control-feedback" v-if="errors.kkm_c">{{errors.kkm_c[0]}}</div>
                                    </div>
                                </div>
                                     
                                <div class="form-group row" :class="{'has-danger':errors.kkm_d}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Nilai Predikat D <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" autocomplete="off"  type="text" readonly  name="kkm_d" v-model="kkm.kkm_d">
                                        <div class="form-control-feedback" v-if="errors.kkm_d">{{errors.kkm_d[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" id="btn-simpan" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/kkm" class="btn btn-default m-r-30">Batal</router-link>
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
            list_course_ :[],
            kkm:{
                kkm_id:'',
                kkm_value:'',
                kkm_a:'',
                kkm_b:'',
                kkm_c:'',
                kkm_d:'',
                course_id:'',
                unit_id:'',
                class_grade_id:'',
                },   
                isLoading: false,
                fullPage: true,
            }
        },
        created(){
            this.get_unit();
            this.get_class_grade_all();
        },
        computed:{
            ...mapState('application', {
                course:state=>state.course,
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                course_study_group:state=>state.course_study_group,
            }),
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/kkm/'+id+'/edit')
            .then(function(resp){


                $axios.get('/get_course_by_class?class_grade_id='+resp.data.class_grade_id).then(function(response){
                    app.list_course_ = response.data.data.data.data;
                });       

                $axios.get('/get_unit_with_class?class_grade_id='+resp.data.class_grade_id).then(function(rs){
                    app.kkm.unit_id = rs.data.data.unit.unit_id;
                });       

                app.isLoading = false;
                app.kkm.kkm_id = resp.data.kkm_id;
                app.kkm.kkm_value = resp.data.kkm_value;
                app.kkm.kkm_a = resp.data.kkm_a;
                app.kkm.kkm_b = resp.data.kkm_b;
                app.kkm.kkm_c = resp.data.kkm_c;
                app.kkm.kkm_d = resp.data.kkm_d;
                app.kkm.class_grade_id = resp.data.class_grade_id;
                app.kkm.course_id = resp.data.course_id;
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_course','get_class_grade','get_unit','get_class_grade_all']),
            clear_form(){
                this.kkm.kkm_value='';
                this.kkm.kkm_a='';
                this.kkm.kkm_b='';
                this.kkm.kkm_c='';
                this.kkm.kkm_d='';
                this.kkm.course_id='';
                this.kkm.class_grade_id='';
                this.kkm.unit_id='';
                this.errors=[];
            },
            onCancel() {
            },
            update_kkm(e){
                e.preventDefault();
                $('#btn-simpan').attr('disabled',true);
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/kkm/'+this.kkm.kkm_id,this.kkm).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/kkm');
                        if(resp.response.data.errors.code == 1)
                        {
                             swal('Error',resp.response.data.errors.message,'error');
                        }
                        else
                        {
                            app.errors = resp.response.data.errors;
                        }
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-simpan').attr('disabled',false);
                    })
                })
            },

            get_kkm(e)
            {
                var app = this;
                app.kkm.kkm_d = e.target.value;
                app.kkm.kkm_c = e.target.value;
                app.kkm.kkm_b = Math.round(parseInt(e.target.value)+(100-e.target.value)/3);
                app.kkm.kkm_a = Math.round(parseInt(app.kkm.kkm_b)+(100-e.target.value)/3);
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            get_course_(e){      
                var app = this;
                $axios.get('/get_course_by_id?class_grade_id='+e.target.value).then(function(resp){
                    app.list_course_ = resp.data;
                });       
            },
            

        },
    }
</script>