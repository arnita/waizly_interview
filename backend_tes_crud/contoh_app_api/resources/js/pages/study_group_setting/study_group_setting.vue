<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Kelola Penetapan Rombel</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Penetapan Rombel
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
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit </label>
                                    <select class="form-control" id="unit_id" name="unit_id" v-model="study_group_setting.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)"name="class_grade_id" v-model="study_group_setting.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                    <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_setting($event)" v-model="study_group_setting.study_group_id">
                                        <option value=""> - Pilih Rombel - </option>
                                        <option  v-for="(item, index) in study_group_all.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
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
                        <h5 class="card-header-text"> Kelola Penetapan Rombel </h5>
                    </div>
                    <button class="btn btn-primary pull-left txt-white m-t-2" @click="get_data_student()">  Tambah </button>
                    <button class="btn btn-success pull-left txt-white m-l-2 m-t-2" @click="final_status"> <i class="fa fa-save"></i>  Final </button>
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
                                        <th>NISN </th>
                                        <th> Nama Siswa</th>
                                        <th>  Status </th>
                                        <th>  Terakhir Diubah </th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.student_nisn}}</td>
                                        <td>{{row.student_name}}</td>
                                        <td>
                                            <div v-if="row.study_group_setting_status === 'final'">
                                              <label class="label bg-success">{{row.study_group_setting_status}}</label>
                                            </div>
                                            <div v-else>
                                                <label class="label bg-warning">{{row.study_group_setting_status}}</label>
                                            </div>
                                        </td>
                                        <td>{{row.study_group_setting_insert_time}}</td>
                                        
                                        <td>
                                            <button class="btn btn-danger" type="button" @click="delete_study_group_setting(row.study_group_setting_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading" size="large" message="Loading ..."></vue-simple-spinner>
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
                                <th>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" @click="selectAll_" name="student_id" v-model="allSelected">
                                        </label>
                                    </div>
                                </th>
                                <th>NISN </th>
                                <th> Nama Siswa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in list_student">
                                <td>
                                    <div class="form-check">
                                        <label for="chkme" class="form-check-label">
                                            <input type="checkbox" class="form-check-input" v-model="selected" :value="row.student_id" name="student_id">
                                        </label>
                                    </div>
                                </td>
                                <td>{{row.student_nisn }}</td>
                                <td>{{row.student_name}}</td>
                         </tr>
                        </tbody>
                    </table>
                    <div class="pull-left m-l-2">
                        <vue-pagination :data="data_post_modal" v-on:pagination-change-page="get_data_page_modal"></vue-pagination>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-save" @click="save_student">Simpan</button>
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
                list_student:[],
                // list_class_grade:[],
                list_study_group:[],
                selected:[],
                allSelected:false,
                loading:true,
                search:'',
                search_modal:'',
                showModal: false,
                study_group_setting:{
                    unit_id:localStorage.getItem('unit_id'),
                    class_grade_id:localStorage.getItem('class_grade_id'),
                    study_group_id:localStorage.getItem('study_group_id'),
                },
                data_post:{},
                data_post_modal:{}
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_study_group_setting();
                }
                else
                {
                    this.load_data($('#study_group_id').val());
                }
            },
            search_modal:function(q){
                if(q!=''){
                    this.search_study_group_modal();
                }
                else
                {     
                    this.selected=[];
                    this.get_data_page_modal();
                    
                }
            }
        },
        created(){
            this.get_unit();  
            this.get_class_grade_all();  
            this.get_study_group_all(this.study_group_setting.class_grade_id);  

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                list_class_grade:state=>state.class_grade,
                study_group_all:state=>state.study_group_all,
                study_group:state=>state.study_group,
                student_by_class:state=>state.student_by_class,
                student_by_class_page:state=>state.student_by_class_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_class_grade_all','get_study_group','get_study_group_all','get_student_by_class']),
            selectAll_(){
                this.selected =[];
                if(!this.allSelected){
                    for(var student in this.list_student){
                        this.selected.push(this.list_student[student].student_id);
                    }
                }
                else
                {
                    this.selected=[];
                }
            },
            save_student(){
                var app = this;
                $('#btn-save').attr('disabled',true);
                return new Promise((resolve,reject)=>{
                    axios.post(`/study_group_setting`,
                        {
                            'student_id':this.selected,
                            'study_group_id':$('#study_group_id').val()
                        }
                    )
                    .then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        $('#btn-save').attr('disabled',false);    
                        $('#modal').modal('hide');
                        app.load_data($('#study_group_id').val());                                
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        $('#btn-save').attr('disabled',false);
                    })
                })
            },
            load_data(id){
                var app =this;
                axios.get('study_group_setting?study_group_id='+id)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_page(page){
                var app =this;
                var study_group_id = $('#study_group_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('study_group_setting?page='+page+'&study_group_id='+study_group_id)
                .then(function(resp){

                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            get_data_setting(event){
                $('#row_setting').show();
                var app =this;
                axios.get('study_group_setting?study_group_id='+event.target.value)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },


            search_study_group_setting(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('study_group_setting?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
                })
            },
             async search_study_group_modal(page){
                var app = this;
                var class_grade_id = $('#class_grade_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await axios.get('get_student_by_class?q='+app.search_modal+'&page='+page+'&class_grade_id='+class_grade_id)
                .then(function(resp){
                    console.log(resp.data.data.data.data);
                    app.list_student = resp.data.data.data.data;
                    app.data_post_modal = {};
                })
                .catch(function(error){
                })
            },
            get_data_student(page){
                this.selected=[];
                this.search_modal = '';
                this.allSelected =false;
                if(typeof page == 'undefined'){
                    page = 1;
                }

                this.get_student_by_class({class_grade_id:$('#class_grade_id').val(),page:page}).then(()=>{
                    this.list_student = this.student_by_class;
                    this.data_post_modal = this.student_by_class_page;
                });                
                $('#modal').modal('show');
            },
            async get_data_page_modal(page){
                  
                this.selected=[];
                this.search_modal = '';
                this.allSelected =false;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                await this.get_student_by_class({class_grade_id:$('#class_grade_id').val(),page:page}).then(()=>{
                    this.list_student = this.student_by_class;
                    this.data_post_modal = this.student_by_class_page;

                });                
            },

            // get_class_(e){
            //     this.get_class_grade(event.target.value).then(()=>{                    
            //         this.list_class_grade = this.class_grade;
            //     });                
            // },
            get_study_group_(e){
                // this.get_study_group(event.target.value).then(()=>{                    
                //     this.list_study_group = this.study_group;
                // });                
                this.get_study_group_all(e.target.value);                         
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
                            axios.put('/study_group_setting/'+$('#study_group_id').val())
                            .then(function(resp){
                                    swal('Success','Simpan data berhasil','success');
                                    app.load_data($('#study_group_id').val());    
                            }).catch(function(resp){
                                app.errors = resp.response.data.errors;
                            })
                        });
                  }
                })

            },
            delete_study_group_setting(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('study_group_setting/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.load_data($('#study_group_id').val());    
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