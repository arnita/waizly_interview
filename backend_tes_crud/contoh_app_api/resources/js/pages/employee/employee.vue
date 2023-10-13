<template>
<div>
        <loading/>    

    <!-- Header Starts -->
    <div id="loading_show" class="loader-overlay-back" style="display:none">
        <div class="loader"><img src="assets/images/1.gif"></div> 
    </div>
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Karyawan</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Karyawan
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
                    <div>
                        <h5 class="card-header-text"> Karyawan </h5>
                    </div>
                    <router-link :to="{name:'employee.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link> &nbsp;
                    <button class="btn btn-warning txt-white m-t-2" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                    <button class="btn btn-success  txt-white m-t-2"  @click="uploadExcel()"> Upload Excel <i class="fa fa-upload"></i> </button>
                    <div class="col-sm-3 m-t-2 pull-right">
                        <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                    </div>
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nama Karyawan </th>
                                        <th> Username </th>
                                        <th> NIK Karyawan </th>
                                        <th> Email </th>
                                        <th> HP  </th>
                                        <th> Alamat </th>
                                        <th> Status </th>
                                        <th> Action  </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.employee_name}}</td>
                                        <td>{{row.user.username}}</td>
                                        <td>{{row.employee_nik}}</td>
                                        <td>{{row.employee_email}}</td>
                                        <td>{{row.employee_hp}}</td>
                                        <td>{{row.employee_address}}</td>
                                        <td>{{row.employee_status}}</td>
                                        
                                        <td>
                                            <router-link class="btn btn-warning" :to="{name:'employee.edit',params:{id:row.employee_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                            <button class="btn btn-danger" type="button" @click="delete_employee(row.employee_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left">
                              <vue-pagination :data="data_post" :limit="2" v-on:pagination-change-page="get_data">
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
    <!-- Row end -->
    <!-- Row end -->
    <!-- Tables end -->

    <!-- Modal -->
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
  <!-- Modal -->

</div>

       
</template>

<script>
import axios  from '../../api.js';
import loading from '../../components/loading.vue';

import Vue from 'vue';
    export default{
        components: {
            'loading':loading,
        },
        data:function(){
            return {
                data_show:[],
                loading:true,
                search:'',
                data_post:{}
            }
        },
        watch:{
            search:function(q){
                if(q!=''){
                    this.search_employee();
                }
                else
                {
                    this.get_data();
                }
            }
        },
        mounted(){
            this.get_data();
        },

        methods:{
            get_data(page){
                var app =this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('employee?page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = resp.data;
                    app.loading=false;  
                    
                }).
                catch(function(resp){
                    app.loading=false;
                })
            },
            search_employee(page){
                var app = this;
                if(typeof page == 'undefined'){
                    page = 1;
                }
                axios.get('employee?q='+app.search+'&page='+page)
                .then(function(resp){
                    app.data_show = resp.data.data;
                    app.data_post = {};
                })
                .catch(function(error){
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
                        axios.delete('employee/'+id)
                        .then(function(resp){
                            if(resp.data.status.code == 1)
                            {
                                app.get_data();    
                            }
                        })
                        .catch(function(resp){

                        })
                    }
                })
            },

            uploadExcel(){
                $('#modal').modal('show');
            },


            saveUpload(){
                $('#loading_show').show();

                var app = this;
                app.close_modal();
                let formData = new FormData(); 
                formData.append('file_excel', app.file_excel);               
                axios.post('/employee_upload',formData,
                    {

                    headers: {

                        'Content-Type': 'multipart/form-data'
                    }
                  }
                )
                .then(function(resp){
                    $('#loading_show').hide();
                    app.get_data();
                }).catch(function(resp){
                    $('#loading_show').hide();
                    swal('Error','File Masih Kosong','error');
                })
            },


            exportTableToExcel(table, name=''){
                window.open('employee/export');
             
            },

            onChangeFileUpload(){
                this.file_excel = this.$refs.file.files[0];
            },
            close_modal(){
                $('#form-all')[0].reset();
                $('#modal').modal('hide');
            },


        }
    }
</script>