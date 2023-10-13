<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4> Buat Soal </h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/quiz_per_kd"> Soal Daily Test </router-link>
                    </li>
                    <li class="breadcrumb-item">  Buat Soal 
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
                    <h5 class="card-header-text"> Buat Soal </h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <loading :active.sync="isLoading"></loading>
                            <form id="form-class-grade" @submit="submit">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th align="center"> No </th>
                                        <th align="center"> No Soal </th>
                                        <th align="center"> Bobot </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for=" val,index in list_kd">
                                        <td>{{index+1}}</td>
                                        <td> <input type="text" name="" class="form-control" style="width:100px" :value="val.number_question" @change="insert_number($event,val.list_question_per_kd_id)">  </td>
                                        <td><input type="text" name="" class="form-control" style="width:100px" :value="val.quality_question" @change="insert_quality($event,val.list_question_per_kd_id)"></td>
                                    </tr>
                                </tbody>
                                
                            </table>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <router-link to="/quiz_per_kd" class="btn btn-default m-r-30">Batal</router-link>
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
            isLoading :false,
            errors : [],
            list_kd : [],
            total_question:'',
            quiz_per_kd:{
                course_id:'',
                total_question:'',
                kd_id:'',
                description:'',
                number_question:'',
                },   
            }
        },
     
        created(){
            this.get_list_question_per_kd();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                course:state=>state.course,
                data_kd_course:state=>state.data_kd_course,
            }),
        },
        methods:{

            ...mapActions('application',['get_unit','get_data_kd_course']),
            get_list_question_per_kd(){
                var app = this;
                var id = app.$route.params.id;
                app.isLoading = true;
                $axios.get('/get_list_question_per_kd?quiz_per_kd_id='+id)
                .then(function(resp){
                    app.list_kd = resp.data;
                    app.isLoading = false;
                }).catch(function(resp){
                    
                })
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/quiz_per_kd`,this.quiz_per_kd).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/quiz_per_kd');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })  
            },
            insert_number(e,id){
                // alert(id);
                var app = this;
                var course_id = app.$route.params.course_id;
                // var id = app.$route.params.id;
                
                let formData = new FormData ()
                formData.set('number_question', e.target.value)
                formData.set('list_question_per_kd_id', id)
                formData.set('course_id', course_id)
                formData.set('kd_id', app.$route.params.kd_id)
                formData.set('type_question', 'daily')
                $axios.post('/quiz_per_kd/insert_number',formData)
                .then(function(resp){
                }).catch(function(resp){
                    swal('Error','No soal ini sudah dipakai','error');
                })
            },
            onlyNumber ($event) {
               let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
               if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                  $event.preventDefault();
               }
            },
            insert_quality(e,id){
                let formData = new FormData ()
                // Add data to body
                formData.set('quality_question', e.target.value)
                formData.set('list_question_per_kd_id', id)
                formData.set('type_question', 'daily')
                $axios.post('/quiz_per_kd/insert_quality',formData)
                .then(function(resp){
                    app.list_kd = resp.data;
                }).catch(function(resp){
                    
                })
            }
            

        },
    }
</script>