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
                    <li class="breadcrumb-item"> <router-link to="/structure_tematic">   Struktur Tematik </router-link>
                    </li>    
                    <li class="breadcrumb-item">Tambah Struktur Tematik
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
                    <h5 class="card-header-text">Tambah Tematik</h5>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-menu" >


                            <div class="col-sm-12">
                                <div class="form-group row"  :class="{'has-danger':errors.unit_id}">
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit <span class="form-mandatory">*</span> </label>
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="structure_tematic.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                    <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group row"  :class="{'has-danger':errors.class_grade_id}">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas <span class="form-mandatory">*</span> </label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="structure_tematic.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                        <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                </div>
                            </div>
                            <!-- <div class="col-sm-12">
                                <div class="form-group row"  :class="{'has-danger':errors.study_group_id}">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                    <select class="form-control" id="study_group_id" name="study_group_id" v-model="structure_tematic.study_group_id">
                                        <option value=""> - Pilih Rombel - </option>
                                        <option  v-for="(item, index) in list_study_group.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
                                    </select>
                                        <div class="form-control-feedback" v-if="errors.study_group_id">{{errors.study_group_id[0]}}</div>

                                </div>
                            </div> -->

                                <div class="col-sm-12">
                                    <div class="form-group row"  :class="{'has-danger':errors.structure_tematic_name}">
                                        <label for="exampleInputEmail1" class="form-control-label"> Nama Tematik <span class="form-mandatory">*</span> </label>
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
                                            <button type="submit" class="btn btn-primary m-r-30" id="btn-save" @click="save_tematic">Simpan</button>
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
                    unit_id:'',
                    class_grade_id:'',
                    study_group_id:null,
                    study_group_name:'',
                    structure_tematic_question:'',
                    structure_tematic_desc:'',
                },
                list_course:[],
                list_class_grade:[],
                list_study_group:[],
                search:'',
                data_show:'',
                selectAll_:'',
                search_modal:'',
                allSelected:'',
                list_course:'',
                loading:true,
                data_post:{},
                errors:[],
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_structure_tematic();
                }
                else
                {
                    this.load_data();
                }
            },
        },
        created(){
            this.get_unit();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                study_group:state=>state.study_group,
                course_by_class:state=>state.course_by_class,
                course_by_class_page:state=>state.course_by_class_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_course_by_class']),
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            get_study_group_(e){
                this.get_study_group(event.target.value).then(()=>{                    
                    this.list_study_group = this.study_group;
                });                
            },
            clear_form(){
                this.structure_tematic.structure_tematic_name='';
                this.structure_tematic.structure_tematic_desc='';
                this.structure_tematic.structure_tematic_question='';
                this.structure_tematic.unit_id='';
                this.structure_tematic.class_grade_id='';
                this.structure_tematic.study_group_id=null;
                this.errors=[];
            },
            save_tematic(e){
                e.preventDefault();
                var app = this;
                $('#btn-save').attr('disabled',true);
                axios.post(`/structure_tematic`,app.structure_tematic)
                .then(function(resp){
                    swal('Success','Simpan data berhasil','success');
                    app.clear_form();

                    app.$router.push('/structure_tematic');

                }).catch(function(resp){
                    app.errors = resp.response.data.errors;
                    $('#btn-save').attr('disabled',false);
                })
            }

        }
    }
</script>