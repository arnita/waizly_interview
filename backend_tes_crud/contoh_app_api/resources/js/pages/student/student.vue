<template>

    <div>
        <loading/>    
        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4>Siswa</h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item">Siswa
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
                            <h5 class="card-header-text"> Siswa </h5>
                        </div>
                        <router-link :to="{name:'student.create'}" class="btn btn-primary pull-left txt-white m-t-2"> Tambah </router-link>  &nbsp;
                        <button class="btn btn-warning txt-white m-t-2" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                        <button class="btn btn-success  txt-white m-t-2"  @click="uploadExcel()"> Upload Excel <i class="fa fa-upload"></i> </button>
                        <div class="col-sm-3 m-t-2 pull-right">
                            <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                        </div>
                        <div class="col-sm-3 m-t-2 pull-right">
                            <select class="form-control" id="course_id"  name="class_grade_id" v-model="class_grade_id">
                                <option value=""> - Pilih Kelas - </option>
                                <option  v-for="(item, index) in list_grade" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                            </select>  
                        </div>

                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nama Siswa </th>
                                            <th> NIS Siswa </th>
                                            <th> Unit </th>
                                            <th> Tingkat Kelas </th>
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
                                            <td>{{row.student_name}}</td>
                                            <td>{{row.student_nis}}</td>
                                            <td v-if="row.unit  == null ">
                                            </td>
                                            <td v-else>
                                                {{row.unit.unit_name}}
                                            </td>

                                            <td v-if="row.class_grade  == null ">
                                            </td>
                                            <td v-else>
                                                {{row.class_grade.class_grade_name}}
                                            </td>

                                            <td>{{row.student_email}}</td>
                                            <td>{{row.student_hp}}</td>
                                            <td>{{row.student_address}}</td>
                                            <td>{{row.student_status}}</td>

                                            <td>
                                                <router-link class="btn btn-warning" :to="{name:'student.edit',params:{id:row.student_id}}" ><i class="fa fa-pencil"></i>
                                                </router-link>
                                                <button class="btn btn-danger" type="button" @click="delete_student(row.student_id)"><i class="fa fa-minus"></i>
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
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle"> Upload File </h5>
          </div>
          <div class="modal-body">
              <form id="form-all">
                  <div class="form-group row">
                      <div class="col-sm-12">

                        <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> File  <span class="form-mandatory">*</span> </label>
                            <div class="col-sm-8">
                                <input type="file" id="file" ref="file" v-on:change="onChangeFileUpload()" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="student.unit_id">
                                    <option value=""> - Pilih Unit - </option>
                                    <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                </select>
                                <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                            </div>
                        </div>                                

                        <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Tingkat Kelas  <span class="form-mandatory">*</span> </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="class_grade_id" name="class_grade_id" v-model="student.class_grade_id">
                                    <option value="" v-if="list_class_grade.data"> - Pilih Kelas - </option>
                                    <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                </select>
                                <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" @click="close_modal()">Close</button>
          <button type="button" class="btn btn-primary" @click="saveUpload()" id="btn-upload"> <i class="fa fa-upload"></i> Upload</button>
      </div>
  </div>
</div>
</div>
<!-- Modal -->
</div>

</template>

<script>
import axios  from '../../api.js';
import {mapActions,mapState,mapMutations} from 'vuex'
import loading from '../../components/loading.vue';
import Vue from 'vue';
export default{
    components: {
        'loading':loading,
    },
    data:function(){
        return {
            errors : [],
            list_class_grade : [],
            data_show:[],
            loading:true,
            search:'',
            list_grade:[],
            data_post:{},
            student:{
                unit_id:'',
                class_grade_id:'',
            },  
            class_grade_id:'',
        }
    },
    watch:{
        search:function(q){
            if(q!=''){
                this.search_student();
            }
            else
            {
                this.get_data();
            }
        },
        class_grade_id:function(q){
            if(q!=''){
                this.class_grade_id = q;
                this.search_student();
            }
            else
            {
                this.class_grade_id = '';
                this.get_data();
            }  
        },
    },
    mounted(){
        this.get_data();
        this.get_unit();
        this.get_grade();
    },
    computed:{
        ...mapState('application', {
            unit:state=>state.unit,
            class_grade:state=>state.class_grade,
        }),
    },
    methods:{
        ...mapActions('application',['get_unit','get_class_grade']),
        get_grade(){
            var app = this;
            axios.get('/get_class_grade_all').then(function(resp){
                app.list_grade = resp.data.data.data;
            }); 
        },
        get_data(page){
            var app =this;
            if(typeof page == 'undefined'){
                page = 1;
            }
            axios.get('student?page='+page+'&q='+app.search+'&class_grade_id='+app.class_grade_id)
            .then(function(resp){
                app.data_show = resp.data.data;
                app.data_post = resp.data;
                app.loading=false;  

            }).
            catch(function(resp){
                app.loading=false;
            })
        },
        search_student(page){
            var app = this;
            if(typeof page == 'undefined'){
                page = 1;
            }
            axios.get('student?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id)
            .then(function(resp){
                app.data_show = resp.data.data;
                app.data_post = resp.data;
            })
            .catch(function(error){
            })
        },
        delete_student(id){
            swal({
                title:"Apakah kamu yakin",
                text:"Menghapus data ini",
                icon:'warning',
                buttons:true,
                dangerMode : true,
            }).then((willdelete)=>{
                if(willdelete){
                    var app = this;
                    axios.delete('student/'+id)
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

        get_class_(e){
            this.get_class_grade(event.target.value).then(()=>{                    
                this.list_class_grade = this.class_grade;
            });                
        },


        uploadExcel(){
            $('#modal').modal('show');
            $('#form-all')[0].reset();
        },


        async saveUpload(){
            $('#loading_show').show();
            $('#btn-upload').attr('disabled',true);
            var app = this;

            app.close_modal();
            let formData = new FormData(); 
            formData.append('file_excel', app.file_excel);               
            formData.append('unit_id', app.student.unit_id);               
            formData.append('class_grade_id',  app.student.class_grade_id);               
            await axios.post('/student_upload',formData,
            {

                headers: {

                    'Content-Type': 'multipart/form-data'
                }
            }
            )
            .then(function(resp){
                $('#btn-upload').attr('disabled',false);
                $('#loading_show').hide();
                swal('Success','Upload File Berhasil','success');
                app.get_data();
            }).catch(function(resp){
                $('#loading_show').hide();
                swal('Error','File Masih Ada Kesalahan','error');
                $('#btn-upload').attr('disabled',false);
            })
        },


        exportTableToExcel(table, name=''){
            window.open('student/export');

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