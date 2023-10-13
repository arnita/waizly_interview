<template>
<div>

    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Kelola Wali Kelas</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Kelola Wali Kelas
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
                                    <select class="form-control" id="class_grade_id" @change="get_study_group_()" name="class_grade_id" v-model="course_setting.class_grade_id">
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
                        <h5 class="card-header-text"> Kelola Wali Kelas </h5>
                    </div>
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
                                        <th> Nama Rombel </th>
                                        <th> Wali Rombel </th>
                                        <th>  Terkahir dirubah </th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.study_group_name}}</td>
                                        <td>{{row.employee_name}}</td>
                                        <td>{{row.class_advisor_insert_time}}</td>
                                        <td>
                                            <button class="btn btn-success" type="button" @click="add_employee(row.study_group_id)"><i class="fa fa-edit"></i>
                                             </button>
                                             <button v-if='row.class_advisor_id != null' class="btn btn-danger" type="button" @click="delete_employee(row.class_advisor_id)"><i class="fa fa-minus"></i>
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
                                <th>Kode </th>
                                <th> Nama Karyawan</th>
                                <th> Action </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="row,index in list_employee">
                                <td>{{row.employee_nik }}</td>
                                <td>{{row.employee_name}}</td>
                                <td> <button class="btn btn-success" @click="input_employee(row.employee_id,row)"> <i class="fa fa-save"></i> Pilih  </button> </td>
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
                list_employee:[],
                list_class_grade:[],
                list_study_group:[],
                selected:[],
                allSelected:false,
                loading:true,
                search:'',
                search_modal:'',
                showModal: false,
                course_setting:{
                    unit_id:'',
                    class_grade_id:'',
                    study_group_id:'',
                },
                study_group_id:'',
                data_post:{},
                data_post_modal:{},
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_advisor();
                }
                else
                {
                    this.get_study_group_();
                }
            },
            search_modal:function(q){
                if(q!=''){
                    this.search_modal_employee();
                }
                else
                {
                    this.selected=[];
                    this.add_employee(this.study_group_id); 
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
                employee_by_advisor:state=>state.employee_by_advisor,
                employee_by_advisor_page:state=>state.employee_by_advisor_page,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_employee_advisor']),

            get_data_page(page){
                  
                var app =this;
                app.loading=true;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                var class_grade_id = $('#class_grade_id').val();
                axios.get('get_class_advisor?page='+page+'&class_grade_id='+class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = resp.data.data.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            }, 
            get_data_page_modal(page){
                if(typeof page == 'undefined'){
                    page = 1;
                }
                this.get_employee_advisor(page).then(()=>{   
                    this.list_employee = this.employee_by_advisor;                 
                    this.data_post_modal = this.employee_by_advisor_page;
                });                      
            },
            search_advisor(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                var class_grade_id = $('#class_grade_id').val();
                axios.get('get_class_advisor?q='+app.search+'&page='+page+'&class_grade_id='+class_grade_id)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = resp.data.data.data;
                    app.loading=false;  
                })
                .catch(function(error){
                    app.loading=false;
                })
            },
            search_modal_employee(page){
                var app = this;
                var class_grade_id = $('#class_grade_id').val();
                if(typeof page == 'undefined'){
                    page = 1;
                }

                axios.get('get_employee_advisor?q='+app.search_modal+'&page='+page+'&class_grade_id='+class_grade_id)
                .then(function(resp){
                    app.list_employee = resp.data.data.data.data;
                })
                .catch(function(error){
                })
            },
            
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            get_study_group_(page){
                $('#row_setting').show();
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                var class_grade_id = $('#class_grade_id').val();
                axios.get('get_class_advisor/?class_grade_id='+class_grade_id+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data.data.data;
                    app.data_post = resp.data.data.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
          
            add_employee(study_group_id){
                this.study_group_id = study_group_id;
                this.search_modal = '';
                var page = 1;
                this.get_employee_advisor(page).then(()=>{                    
                    this.list_employee = this.employee_by_advisor;
                    this.data_post_modal = this.employee_by_advisor_page;
                });          
                $('#modal').modal('show');
            },
            input_employee(id){
                var app = this;
                return new Promise((resolve,reject)=>{
                    axios.post(`/class_advisor`,{id:id,study_group_id:this.study_group_id})
                    .then(function(resp){
                        app.get_study_group_();    
                        $('#modal').modal('hide');
                    })
                    .catch(function(error){
                        swal('Error','Kelas ini sudah mempunyai wali kelas','error');
                    })
                })
            },
            delete_employee(id){
                swal({
                    title:"Apakah kamu yakin",
                    text:"Menghapus data ini",
                    icon:'warning',
                    buttons:true,
                    dangerMode : true,
                }).then((willdelete)=>{
                    if(willdelete){
                        var app = this;
                        axios.delete('class_advisor/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.get_study_group_();    
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