<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Rombongan Belajar</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/study_group">  Rombongan Belajar </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Rombongan Belajar
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
                    <h5 class="card-header-text">Tambah Rombongan Belajar</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade" @submit="submit">
                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="study_group.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>    

                                
                             
                                <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Tingkat Kelas  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="class_grade_id" name="class_grade_id" v-model="study_group.class_grade_id">
                                            <option value="" v-if="list_class_grade.data"> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                    </div>
                                </div>   
                             
                                <div class="form-group row" :class="{'has-danger':errors.class_room_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Ruangan Kelas  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="class_room_id" name="class_room_id" v-model="study_group.class_room_id">
                                            <option value="" v-if="list_class_grade.data"> - Pilih Ruangan - </option>
                                            <option  v-for="(item, index) in list_class_room.data " :key="index" :value="item.class_room_id"> {{item.class_room_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.class_room_id">{{errors.class_room_id[0]}}</div>
                                    </div>
                                </div>   

                                
                                <div class="form-group row" :class="{'has-danger':errors.study_group_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label"> Nama Rombel <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="study_group_name" type="text" value=""  v-model="study_group.study_group_name">
                                        <div class="form-control-feedback" v-if="errors.study_group_name">{{errors.study_group_name[0]}}</div>
                                    </div>
                                </div>




                                <div class="form-group row" :class="{'has-danger':errors.study_group_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="study_group_desc" v-model="study_group.study_group_desc">
                                        <div class="form-control-feedback" v-if="errors.study_group_desc">{{errors.study_group_desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/study_group" class="btn btn-default m-r-30">Batal</router-link>
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
            list_class_room : [],
            study_group:{
                class_grade_id:'',
                class_room_id:'',
                study_group_name:'',
                study_group_status:'',
                study_group_desc:'',
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
                class_grade:state=>state.class_grade,
                class_room:state=>state.class_room,
            }),
        },
        methods:{

            ...mapActions('application',['get_unit','get_class_grade','get_class_room']),
            clear_form(){
                this.study_group.study_group_name='';
                this.study_group.class_grade_id='';
                this.study_group.study_group_status='';
                this.study_group.study_group_desc='';
                this.study_group.unit_id='';
                this.errors=[];
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{
                    this.list_class_grade = this.class_grade;
                    
                });                
                this.get_class_room(event.target.value).then(()=>{
                    
                    this.list_class_room = this.class_room;
                    
                });                
            },
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/study_group`,this.study_group).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/study_group');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>