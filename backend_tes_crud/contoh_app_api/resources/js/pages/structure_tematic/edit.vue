<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Kelola Struktur Tematik</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Struktur Tematik
                    </li>    
                </ol>
            </div>
        </div>
    </div>
    <!-- Header end -->


    <div class="row">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <h5 class="card-header-text">Ubah  Tematik</h5>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-menu" >


                                <div class="col-sm-12">
                                    <div class="form-group row"  :class="{'has-danger':errors.structure_tematic_name}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Tematik <span class="form-mandatory">*</span> </label>
                                        <input type="hidden" name="structure_tematic_id" class="form-control" v-model="structure_tematic.structure_tematic_id">
                                        <input type="text" name="structure_tematic_name" class="form-control" v-model="structure_tematic.structure_tematic_name">
                                        <div class="form-control-feedback" v-if="errors.structure_tematic_name">{{errors.structure_tematic_name[0]}}</div>

                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group row"  :class="{'has-danger':errors.structure_tematic_desc}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Keterangan </label>
                                        <input type="text" name="structure_tematic_desc" class="form-control" v-model="structure_tematic.structure_tematic_desc">
                                        <div class="form-control-feedback" v-if="errors.structure_tematic_desc">{{errors.structure_tematic_desc[0]}}</div>

                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30" id="btn-save" @click="update_structure_tematic">Ubah</button>
                                            <router-link to="/structure_tematic" class="btn btn-default m-r-30">Batal</router-link>
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

</div>

       
</template>


<script>
import {mapActions,mapState,mapMutations} from 'vuex'
import axios  from '../../api.js';
import Vue from 'vue';
    export default{
        data:function(){
            return {
                structure_tematic:{
                    // unit_id:'',
                    study_group_id:null,
                    structure_tematic_question:'',
                    structure_tematic_desc:'',
                    structure_tematic_id:'',
                    class_grade_id:''
                },
                search:'',
                data_show:'',
                loading:true,
                data_post:{},
                errors:[],
            }
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            axios.get('/structure_tematic/'+id+'/edit')
            .then(function(resp){
                app.structure_tematic.structure_tematic_name= resp.data.structure_tematic_name;
                app.structure_tematic.structure_tematic_desc=resp.data.structure_tematic_desc;
                app.structure_tematic.structure_tematic_question=resp.data.structure_tematic_question;
                app.structure_tematic.class_grade_id=resp.data.class_grade_id;
                app.structure_tematic.structure_tematic_id=resp.data.structure_tematic_id;
                app.isLoading = false;                
            })
            .catch(function(resp){

            })
        },
       
        methods:{
            ...mapActions('application',['get_study_group']),
            
            clear_form(){
                this.structure_tematic.structure_tematic_name='';
                this.structure_tematic.structure_tematic_desc='';
                this.structure_tematic.structure_tematic_question='';
                this.structure_tematic.unit_id='';
                this.structure_tematic.class_grade_id='';
                this.errors=[];
            },
            update_structure_tematic(e){
                e.preventDefault();
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.put('/structure_tematic/'+this.structure_tematic.structure_tematic_id,this.structure_tematic).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                          app.$router.push({
                                    path: '/structure_tematic', 
                                })
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-save').attr('disabled',false);
                    })
                })
                
            },

        }
    }
</script>