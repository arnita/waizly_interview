<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Kelola Mata Pelajaran</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Mata Pelajaran
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
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="course_setting.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_data_setting($event)" name="class_grade_id" v-model="course_setting.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
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
                        <h5 class="card-header-text"> Kelola Mata Pelajaran </h5>
                    </div>
                    <button class="btn btn-primary pull-left txt-white m-t-2" @click="get_course()">  Tambah </button>
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
                                        <th>Kode Mata Pelajaran </th>
                                        <th> Nama Mata Pelajaran</th>
                                        <th>  Guru Koordinator</th>
                                        <th>  Terakhir Diubah </th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.course.course_code}}</td>
                                        <td>{{row.course.course_name}}</td>
                                        <td v-if="row.employee !=null "> <button class="btn btn-success"  @click="get_data_employee(1,row.course.course_id,row.course_setting_id)"> <i class="fa fa-plus"></i></button> {{row.employee.employee_name}}   </td>
                                        <td v-else>  <button class="btn btn-success"  @click="get_data_employee(1,row.course.course_id,row.course_setting_id)">  <i class="fa fa-plus"></i></button></td>
                                        <td>{{row.course_setting_insert_time}}</td>
                                        <td>
                                            <button class="btn btn-danger" type="button" @click="delete_course_setting(row.course_setting_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left m-l-2">
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
    <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="padding: 0">
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." v-model="search_modal2">
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
                        <vue-pagination :data="data_post_modal2" v-on:pagination-change-page="get_data_page_modal2"></vue-pagination>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>

                </div>
            </div>
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
                                <th>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" @click="selectAll_" name="course_id" v-model="allSelected">
                                        </label>
                                    </div>
                                </th>
                                <th>Kode </th>
                                <th> Mata Pelajaran</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in list_course">
                                <td>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" v-model="selected" :value="row.course_id" name="course_id">
                                        </label>
                                    </div>
                                </td>
                                <td>{{row.course_code }}</td>
                                <td>{{row.course_name}}</td>
                         </tr>
                        </tbody>
                        
                    </table>
                    <div class="pull-left m-l-2">
                        <vue-pagination :data="data_post_modal" v-on:pagination-change-page="get_data_page_modal"></vue-pagination>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-save" @click="save_course">Simpan</button>
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
                list_course:[],
                list_class_grade:[],
                list_study_group:[],
                selected:[],
                allSelected:false,
                loading:true,
                search:'',
                search_modal:'',
                search_modal2:'',
                list_teacher:'',
                showModal: false,
                course_setting:{
                    unit_id:'',
                    class_grade_id:'',
                    study_group_id:'',
                    course_setting_id:'',
                },
                data_post:{},
                data_post_modal:{},
                data_post_modal2:{},
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_course_setting();
                }
                else
                {
                    this.load_data(this.course_setting.class_grade_id);
                }
            },
            search_modal:function(q){
                if(q!=''){
                    this.search_study_group_modal();
                }
                else
                {
                    var page=1;
                    this.selected=[];
                    this.get_course_by_class({class_grade_id:this.course_setting.class_grade_id,page:page}).then(()=>{                    
                        this.list_course = this.course_by_class;
                    }); 
                }
            },
            search_modal2:function(q){
                if(q!=''){
                    this.search_teacher_modal();
                }
                else
                {
                    this.get_employee_setting({course_id :this.course_setting.course_id,employee_id:0 }).then(()=>{
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
                course_by_class:state=>state.course_by_class,
                course_by_class_page:state=>state.course_by_class_page,
                employee_setting_page:state=>state.employee_setting_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_course_by_class','get_employee_setting']),
            selectAll_(){
                this.selected =[];
                if(!this.allSelected){
                    for(var course in this.list_course){
                        this.selected.push(this.list_course[course].course_id);
                    }
                }
                else
                {
                    this.selected=[];
                }
            },
            search_teacher_modal(page){
                var app = this;
                var class_grade_id = app.course_setting.class_grade_id;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('get_employee_setting?q='+app.search_modal2+'&page='+page+'&course_id='+ app.course_setting.course_id )
                .then(function(resp){
                    app.list_teacher = resp.data.data.data.data;
                    app.data_post_modal2 = resp.data.data;
                })
                .catch(function(error){
                })
            },
            save_empolyee(id){
                var app = this;
                // $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/teacher_coordinator`,
                        {
                            'employee_id':id,
                            'course_setting_id':app.course_setting.course_setting_id,
                            'course_id':app.course_setting.course_id,
                            // 'course_id':app.teacher_setting.course_id,
                            // 'study_group_id':app.teacher_setting.study_group_id,
                        }
                    )
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        // $('#btn-save').attr('disabled',false);    
                        $('#modal2').modal('hide');
                        app.load_data(app.course_setting.class_grade_id);                                
                    }).catch(function(resp){
                        // $('#btn-save').attr('disabled',false);
                    })
                })
            },
            save_course(){
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/course_setting`,
                        {
                            'course_id':this.selected,
                            'study_group_id':app.course_setting.study_group_id,
                            'class_grade_id':app.course_setting.class_grade_id,
                        }
                    )
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        $('#btn-save').attr('disabled',false);    
                        $('#modal').modal('hide');
                        app.load_data(app.course_setting.class_grade_id);                                
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-save').attr('disabled',false);
                    })
                })
            },
            load_data(id){
                var app =this;
                axios.get('course_setting?class_grade_id='+id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_employee(page,course,course_setting_id){
                var app =this;
                app.search_modal2 = '';
                if(typeof page == 'undefined'){
                    page = 1;
                }
                app.get_employee_setting({course_id : course,employee_id:0 ,page:page}).then(()=>{
                    $('#modal2').modal('show');                 
                    app.list_teacher = this.employee_setting;
                    this.data_post_modal2= this.employee_setting_page;
                    app.loading=false;  
                    app.course_setting.course_id =course;
                    app.course_setting.course_setting_id =course_setting_id;
                })
                .catch(()=>{
                    app.loading= false;
                })
            }, 
            get_data_page(page){
                  
                var app =this;
                app.loading=true;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                
                axios.get('course_setting?page='+page+'&class_grade_id='+app.course_setting.class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            }, 
             get_data_page_modal2(page){
                this.search_modal2 = '';
                if(typeof page == 'undefined'){
                    page = 1;
                }
                this.get_employee_setting({course_id : this.course_setting.course_id,employee_id:0,page:page }).then(()=>{
                    // $('#modal2').modal('show');                 
                    this.list_teacher = this.employee_setting;
                    this.data_post_modal2 = this.employee_setting_page;
                    this.loading=false;  
                })
                .catch(()=>{
                    this.loading= false;
                })          
            },
            get_data_page_modal(page){
                  
                this.selected=[];
                this.search_modal = '';
                this.allSelected =false;
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                this.get_course_by_class({class_grade_id:app.course_setting.class_grade_id,page:page}).then(()=>{                   
                    this.list_course = this.course_by_class;
                    this.data_post_modal = this.course_by_class_page;

                });                
            },
            get_data_setting(event){
                $('#row_setting').show();
                var app =this;
                axios.get('course_setting?class_grade_id='+event.target.value)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_course_setting(page){
                var app = this;
                // var study_group_id = $('#study_group_id').val();

                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('course_setting?q='+app.search+'&page='+page+'&class_grade_id='+app.course_setting.class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                })
                .catch(function(error){
                })
            },
            search_study_group_modal(page){

                var app = this;
                // var study_group_id = $('#study_group_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('get_course_by_class?q='+app.search_modal+'&page='+page+'&class_grade_id='+app.course_setting.class_grade_id)
                .then(function(resp){
                    app.list_course = resp.data.data.data.data;
                })
                .catch(function(error){
                })
            },
            get_course(page){
                this.selected=[];
                this.search_modal = '';
                this.allSelected =false;
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }

                this.get_course_by_class({class_grade_id:app.course_setting.class_grade_id,page:page}).then(()=>{                    
                    this.list_course = this.course_by_class;
                    this.data_post_modal = this.course_by_class_page;
                });                
                $('#modal').modal('show');
            },
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
            final_status(){
                var app = this;
                swal({
                    title:"Apakah kamu yakin",
                    text:"Untuk mengubah data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        return new Promise((resolve,reject)=>{
                            axios.put('/course_setting/'+app.course_setting.class_grade_id)
                            .then(function(resp){
                                    swal('Success','Simpan data berhasil','success');
                                    app.load_data(app.course_setting.class_grade_id);    
                            }).catch(function(resp){
                                app.errors = resp.response.data.errors;
                            })
                        });
                  }
                })

            },
            delete_course_setting(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('course_setting/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.load_data(app.course_setting.class_grade_id);    
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