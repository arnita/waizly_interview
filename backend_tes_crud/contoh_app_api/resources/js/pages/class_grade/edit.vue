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
                    <li class="breadcrumb-item"> <router-link to="/class_grade"> Kelas </router-link>
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
                            <form id="form-class-grade" @submit="update_class_grade">
                                <div class="form-group row" :class="{'has-danger':errors.class_grade_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Kelas <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="class_grade_name" type="text" value=""  v-model="class_grade.class_grade_name">
                                        <input class="form-control " name="class_grade_id" type="hidden" value=""  v-model="class_grade.class_grade_id">
                                        <div class="form-control-feedback" v-if="errors.class_grade_name">{{errors.class_grade_name[0]}}</div>
                                    </div>
                                </div>

                             
                          

                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                       <select class="form-control" id="unit_id" name="unit_id" v-model="class_grade.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.class_grade_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="class_grade_desc" v-model="class_grade.class_grade_desc">
                                        <div class="form-control-feedback" v-if="errors.class_grade_desc">{{errors.class_grade_desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/class_grade" class="btn btn-default m-r-30">Batal</router-link>
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
            class_grade:{
                class_grade_name:'',
                class_grade_desc:'',
                class_grade_status:'',
                class_grade_id:'',
                unit_id:'',
                },  
                isLoading: false,
                fullPage: true,
            }
        },
        created(){
            this.get_unit();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit
            }),
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/class_grade/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.class_grade.class_grade_name = resp.data.class_grade_name;
                app.class_grade.class_grade_desc = resp.data.class_grade_desc;
                app.class_grade.class_grade_status = resp.data.class_grade_status;
                app.class_grade.class_grade_id = resp.data.class_grade_id;
                app.class_grade.unit_id = resp.data.unit_id;
                
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_unit']),
            clear_form(){
                this.class_grade.class_grade_name='';
                this.class_grade.class_grade_desc='';
                this.class_grade.class_grade_status='';
                this.class_grade.unit_id='';
                this.errors=[];
            },
            onCancel() {
            },
            update_class_grade(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/class_grade/'+this.class_grade.class_grade_id,this.class_grade).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/class_grade');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>