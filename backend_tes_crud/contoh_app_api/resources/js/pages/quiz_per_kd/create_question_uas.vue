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
                    <li class="breadcrumb-item"> <router-link to="/quiz_uas"> Soal PAS </router-link>
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
                    <h5 class="card-header-text"> Buat Soal PAS </h5>
                </div>
                 <div class="alert alert-success" style="font-weight:bold;font-size:15px">
                    No soal yang sudah dipakai : {{no_exist}}
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
            total_question:'',
            isLoading : false,
            quiz_per_kd:{
                course_id:'',
                total_question:'',
                kd_id:'',
                description:'',
                type_question:'uas',
                },   
            }
        },
     
        created(){
            this.cek_number();
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
                        app.$router.push('/quiz_uas');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })  
            },
            onlyNumber ($event) {
               let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
               if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                  $event.preventDefault();
               }
            },
            insert_quality(e,id){
                //var insert_val ={'quality_question':e.target.value,'list_quiz_per_kd_id':id};
                var app = this;
                let formData = new FormData ()
                // Add data to body
                formData.set('quality_question', e.target.value)
                formData.set('list_question_per_kd_id', id)
                $axios.post('/quiz_per_kd/insert_quality',formData)
                .then(function(resp){

                }).catch(function(resp){
                    
                })
            },
            insert_number(e,id){

                var app = this;
                // var kd_id = app.$route.params.id;
                var course_id = app.$route.params.course_id;
                
                let formData = new FormData ()
                formData.set('number_question', e.target.value)
                formData.set('list_question_per_kd_id', id)
                formData.set('type_question', 'uas')
                formData.set('course_id', course_id)
                // formData.set('kd_id', kd_id)
                $axios.post('/quiz_per_kd/insert_number',formData)
                .then(function(resp){

                }).catch(function(resp){
                    swal('Error','No soal ini sudah dipakai','error');
                })
            },
            async cek_number(){
                var app = this;              
                var course_id = app.$route.params.course_id;
                var id = app.$route.params.id;
              
                await $axios.get('/cek_number_kd?type_question=uas&course_id='+course_id+'&id='+id)
                .then(function(resp){
                    console.log(resp.data.data);
                    // swal('Success','Simpan data berhasil','success');
                    app.no_exist = resp.data.data;
                }).catch(function(resp){
                        // swal('Error','No soal ini sudah dipakai','error');
                })
            }
            

        },
    }
</script>