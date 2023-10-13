<template>
<div>

    <div id="loading_show" class="loader-overlay-back" style="display:none">
        <div class="loader"><img src="assets/images/1.gif"></div> 
    </div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ekstrakurikuler</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Ekstrakurikuler
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
                            <div class="col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="extracurricular.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="extracurricular.class_grade_id">
                                        <option value=""> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                    <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_setting($event)" v-model="extracurricular.study_group_id">
                                        <option value=""> - Pilih Rombel - </option>
                                        <option  v-for="(item, index) in list_study_group.data " :key="index" :value="item.study_group_id"> {{item.study_group_name}} </option>
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
                        <h5 class="card-header-text"> Ekstrakurikuler </h5>
                    </div>
                    <div class="m-t-2 pull-left" >
                        <button class="btn btn-primary" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                        <button class="btn btn-success" @click="uploadExcel()"> <i class="fa fa-upload"></i> Upload Nilai  </button>
                    </div>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari...." @keyup.enter="search_extracurricular($event)">
                    </div>
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <!-- <th>ACTION</th> -->
                                        <th>NISN </th>
                                        <th> Nama Siswa</th>
                                        <th> Jenis Kelamin</th>
                                        <th v-for="m,index in eskul" style="text-align: center;">
                                            {{ m.name }}
                                            <tr>
                                                <td style="width: 0.1%"> Nilai </td>
                                            </tr>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                       
                                        <td>{{index+1}}</td>
                                        <!-- <td><button class="btn btn-success" @click="tambah(row.student_name,row.student_id)" title ="tambah"> <i class="fa fa-plus"></i> </button></td> -->
                                        <td>{{row.student_nisn}}</td>
                                        <td>{{row.student_name}}</td>
                                        <td>{{row.student_gender}}</td>
                                         <td v-for="m,index in eskul"  align="center">

                                            <span v-for="es,zz in val_eskul"  align="center" v-if="es.type === m.name  && es.student_id === row.student_id " > {{es.value+'-'+es.desc}}</span>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <!-- <vue-simple-spinner v-if="loading"></vue-simple-spinner> -->
                            <div class="pull-left">
                              <vue-pagination :data="data_post" v-on:pagination-change-page="get_data_page"></vue-pagination>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Basic Table ends -->
        </div>
    </div>

    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle"> Upload File </h5>
            </div>
            <div class="modal-body">
              <form id="form-all">
                      <div class="form-group row">
                          <div class="col-sm-12">
                              <input type="file" id="file" ref="file" v-on:change="onChangeFileUpload()" class="form-control">
                          </div>
                      </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" @click="close_modal()">Close</button>
              <button type="button" class="btn btn-primary" @click="saveUpload()"> <i class="fa fa-upload"></i> Upload</button>
            </div>
          </div>
        </div>
    </div>  


    <div class="modal fade" id="modal-tambah" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle"> Tambah Eskul {{student_name}}  </h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div v-for="ex in ekstrakurikuler">
                            <div class="col-sm-4">
                                    <label for="exampleInputEmail1" class="form-control-label">Eskul {{ex.name}} </label>
                                    <input type="text" name="" class="form-control" @change="insert_ekstrakurikuler($event,student_id,ex.name,'')" :value="get_value(student_id,ex.name,'value')">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" @click="close_modal_tambah()">Close</button>
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
import store from '../../store.js'

    export default{
        data:function(){
            return {
                data_show:[],
                student_name:'',
                student_id:'',
                data_show_modal:[],
                list_student:[],
                list_class_grade:[],
                list_study_group:[],
                eskul:[],
                val_eskul:[],
                loading:true,
                search:'',
                looping_ekstrakurikuler :[],
                showModal: false,
                extracurricular:{
                    unit_id:'',
                    class_grade_id:'',
                    study_group_id:'',
                },
                data_post:{},
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
                student_by_class:state=>state.student_by_class,
                student_by_class_page:state=>state.student_by_class_page,
                ekstrakurikuler:state=>state.ekstrakurikuler,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_student_by_class','get_ekstrakurikuler']),
            
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
                var study_group_id =$('#study_group_id').val();
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
                $('#loading_show').show();
                var app =this;
              
                /* Ajax untuk get data ekstrakurikuler */
                app.reload_table(event.target.value);
            },

            search_extracurricular(e){
                var app = this;
                /* Ajax untuk get data siswa */
                axios.get('study_group_setting?study_group_id='+$('#study_group_id').val()+'&q='+e.target.value)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })

                /* Ajax untuk get data bulan */
                app.reload_table(event.target.value);

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

            insert_ekstrakurikuler(e,student_id,type,category){
                axios.post('extracurricular',{
                    'value': e.target.value,
                    'student_id':student_id,
                    'type':type,
                    'category' : category,
                })
                .then(function(resp){
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })             
            },
            
            
            exportTableToExcel(table, name=''){
                var study_group_id = $('#study_group_id').val();
                var kd_id = $('#kd_id').val();
                window.open('extracurricular/export?study_group_id='+study_group_id);
             
            },
            uploadExcel(){
                $('#modal').modal('show');
            },
            reload_table(study_group_id){
                var app = this;
                axios.get('/load_extracurricular?study_group_id='+study_group_id)
                    .then(function(resp){
                        console.log(resp);
                        app.data_show = resp.data.result;
                        app.eskul = resp.data.eskul;
                        app.val_eskul = resp.data.val_eskul;
                        $('#loading_show').hide();
                        app.loading=false;  
                })
                .catch(function(resp){
                    $('#loading_show').hide();
                    app.loading=false;  
                })
            },
            saveUpload(){
                $('#loading_show').show();

                var app = this;
                app.close_modal();
                let formData = new FormData(); 
                formData.append('file_excel', app.file_excel);               
                axios.post('/extracurricular_upload',formData,
                    {

                    headers: {

                        'Content-Type': 'multipart/form-data'
                    }
                  }
                )
                .then(function(resp){
                    app.reload_table(app.extracurricular.study_group_id)
                }).catch(function(resp){
                    $('#loading_show').hide();
                    console.log(resp);
                    swal('Error','File Masih Kosong','error');
                })
            },
            onChangeFileUpload(){
                this.file_excel = this.$refs.file.files[0];
            },
            close_modal(){
                $('#form-all')[0].reset();
                $('#modal').modal('hide');
            },
            close_modal_tambah(){
                $('#form-all')[0].reset();
                $('#modal-tambah').modal('hide');
                var app = this;
                app.reload_table(app.extracurricular.study_group_id);
            },
             get_value(student_id,type,cat){
                let input_ekstrakurikuler;
                const token = store.state.token

                 $.ajax({
                        url: '/api/get_value_extracurricular',
                        type:'GET',
                         headers:{
                            'Content-Type': 'application/json',
                            'Authorization':`Bearer ${token}`,
                        },
                        async: false,
                        data:{
                            'student_id' : student_id,
                            'type': type,
                            'category' :cat,
                        },
                        beforeSend(){
                            $('#loading_show').show();
                        },
                        success:function(resp){
                            console.log(resp.data);
                              return input_ekstrakurikuler = resp.data;
                        }
                    })
                    .done(function(){
                        $('#loading_show').hide();
                    })
                 return input_ekstrakurikuler;
            },
   

            tambah(nama,id){
                var app = this;
                app.student_name = nama;
                app.student_id = id;
                $("#modal-tambah").modal('show');
                $('#loading_show').show();

                app.get_ekstrakurikuler().then(function(resp){
                    $('#loading_show').hide();
                });
            }

         
        }
    }
</script>
