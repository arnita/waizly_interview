<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Kelola Penetapan Guru </h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Penetapan Guru 
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
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="teacher_setting.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="teacher_setting.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                    <select class="form-control" id="study_group_id" @change="get_course_($event)"  name="study_group_id" v-model="teacher_setting.study_group_id">
                                        <option value=""> - Pilih Rombel - </option>
                                        <option  v-for="(item, index) in list_study_group.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Mata Pelajaran</label>
                                    <select class="form-control" id="course_id" name="course_id" @change="get_data_setting($event)" v-model="teacher_setting.course_id">
                                        <option value=""> - Pilih Mata Pelajaran - </option>
                                        <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course_id"> {{item.course_name}} </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            <!-- Basic Table ends -->
        </div>
    </div>



    <!-- Tables start -->
    <!-- Row start -->
   <div class="row" style="display: none" id="row_setting">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h5 class="card-header-text"> Mata Pelajaran {{mapel}}</h5>
                    </div>
                    <button class="btn btn-primary pull-left txt-white m-t-2" @click="get_data_employee()">  Tambah </button>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search">
                    </div>
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th> NIK </th>
                                        <th> Nama Guru </th>
                                        <th> Department </th>
                                        <th> Jabatan </th>
                                        <th>  Terakhir Diubah </th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.employee.nik}}</td>
                                        <td>{{row.employee.employee_name}}</td>
                                        <td></td>
                                        <td></td>
                                        <td>{{row.update_time}}</td>
                                        <td>
                                            <button class="btn btn-danger" type="button" @click="delete_teacher_setting(row.teacher_setting_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left">
                              <vue-pagination :data="data_post" :limit="2" v-on:pagination-change-page="get_data_page">
                                    <span slot="prev-nav">&lt; Previous</span>
                                    <span slot="next-nav">Next &gt;</span>
                              </vue-pagination>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Basic Table ends -->
        </div>
    </div>




    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="padding: 0">
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search_modal">
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th> NIK </th>
                                <th> Nama Karyawan</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in list_teacher">
                                <td>{{row.employee_nik }}</td>
                                <td>{{row.employee_name }}</td>
                                <td><button class="btn btn-success" @click="save_empolyee(row.employee_id)"> <i fa-fa-save></i> Pilih </button></td>
                         </tr>
                        </tbody>
                    </table>
                    <div class="pull-left m-l-2">
                        <vue-pagination :data="data_post_modal" v-on:pagination-change-page="get_data_page_modal"></vue-pagination>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>

                </div>
            </div>
        </div>
    </div>

    <!-- Row end -->
    <!-- Row end -->
    <!-- Tables end -->
</div>

       
</template>


<script>
import {mapActions,mapState,mapMutations} from 'vuex'
import axios  from '../../api.js';
import Vue from 'vue';
    export default{
        data:function(){
            return {
                data_show:[],
                data_show_modal:[],
                list_teacher:[],
                list_class_grade:[],
                list_study_group:[],
                list_course_:[],
                loading:true,
                search:'',
                mapel:'',
                search_modal:'',
                showModal: false,
                teacher_setting:{
                    unit_id:'',
                    class_grade_id:'',
                    study_group_id:'',
                    course_id:'',
                },

                data_post:{},
                data_post_modal:{}
            }
        },
        watch:{
            search:function(q){
                if(q!='')
                {
                    this.get_data_search();
                }
                else
                {
                    
                    this.search_teacher_setting();
                }
            },
            search_modal:function(q){
                if(q!=''){
                    this.search_teacher_modal();
                }
                else
                {
                    this.get_employee_setting({course_id : $('#course_id').val(),employee_id:0 }).then(()=>{
                        this.list_teacher = this.employee_setting;
                    }); 
                }
            }
        },
        created(){
            this.get_unit();

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                study_group:state=>state.study_group,
                employee_setting:state=>state.employee_setting,
                course_study_group:state=>state.course_study_group,
                employee_setting_page:state=>state.employee_setting_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_employee_setting','get_course_study_group']),
            save_empolyee(id){
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/teacher_setting`,
                        {
                            'employee_id':id,
                            'course_id':app.teacher_setting.course_id,
                            'study_group_id':app.teacher_setting.study_group_id,
                        }
                    )
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        $('#btn-save').attr('disabled',false);    
                        $('#modal').modal('hide');
                        app.load_data();                                
                    }).catch(function(resp){
                        $('#btn-save').attr('disabled',false);
                    })
                })
            },
            search_teacher_modal(page){
                var app = this;
                var class_grade_id = $('#class_grade_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('get_employee_setting?q='+app.search_modal+'&page='+page+'&course_id='+ app.teacher_setting.course_id )
                .then(function(resp){
                    app.list_teacher = resp.data.data.data.data;
                    app.data_post_modal = resp.data.data;
                })
                .catch(function(error){
                })
            },
            get_data_page(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('teacher_setting?page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_page_modal(page){
                this.search_modal = '';
                if(typeof page == 'undefined'){
                    page = 1;
                }
                this.get_employee_setting({course_id : this.teacher_setting.course_id,employee_id:0,page:page }).then(()=>{
                    $('#modal').modal('show');                 
                    this.list_teacher = this.employee_setting;
                    this.data_post_modal = this.employee_setting_page;
                    this.loading=false;  
                })
                .catch(()=>{
                    this.loading= false;
                })          
            },

            get_data_search(page){
                $('#row_setting').show();
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('teacher_setting?q='+app.search+'&page='+page+'&course_id='+app.teacher_setting.course_id+'&study_group_id='+app.teacher_setting.study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = {};
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_setting(event){
                $('#row_setting').show();
                var app =this;
                var page = 1;
                axios.get('teacher_setting?course_id='+event.target.value+'&study_group_id='+app.teacher_setting.study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = resp.data.data.data;
                    app.mapel = $('#course_id option:selected').text();
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            load_data(){
                $('#row_setting').show();
                var app =this;
                axios.get('teacher_setting?course_id='+app.teacher_setting.course_id+'&study_group_id='+app.teacher_setting.study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = resp.data.data.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_teacher_setting(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('teacher_setting?q='+app.search+'&page='+page+'&course_id='+app.teacher_setting.course_id+'&study_group_id='+app.teacher_setting.study_group_id)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = resp.data.data.data;
                })
                .catch(function(error){
                })
            },
            get_study_group_(e){
                this.get_study_group(event.target.value).then(()=>{                    
                    this.list_study_group = this.study_group;
                });                
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },   
            get_course_(e){
                this.teacher_setting.course_id = "";
                // console.log(this.teacher_setting.class_grade_id);
                // console.log(e.target.value);
                this.get_course_study_group(this.teacher_setting.class_grade_id).then(()=>{                    
                    this.list_course_ = this.course_study_group;
                });                
            },
            get_data_employee(page){
                var app =this;
                this.search_modal = '';
                if(typeof page == 'undefined'){
                    page = 1;
                }
                this.get_employee_setting({course_id : app.teacher_setting.course_id,employee_id:0 ,page:page}).then(()=>{
                    $('#modal').modal('show');                 
                    app.list_teacher = this.employee_setting;
                    this.data_post_modal = this.employee_setting_page;
                    app.loading=false;  
                    app.teacher_setting.course_id =app.teacher_setting.course_id;
                })
                .catch(()=>{
                    app.loading= false;
                })
            }, 
            delete_teacher_setting(id){
               swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('teacher_setting/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {   
                                app.load_data();    
                            }
                        })
                        .catch(function(resp){

                        })
                    }
                })

            },
           

        }
    }
</script>