<template>
    <div>
        <loading/>    
        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4>Kompetensi Dasar</h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item">Kompetensi Dasar
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
                            <h5 class="card-header-text"> Kompetensi Dasar </h5>
                        </div>
                        <div class="col-sm-3 m-t-2 pull-right">
                            <input type="text" class="form-control" name="q" placeholder="Cari...." v-model="search">
                        </div>
                        
                        <div class="col-sm-3 m-t-2 pull-right">
                            <select class="form-control" id="course_id"  name="class_grade_id" v-model="class_grade_id">
                                <option value=""> - Pilih Kelas - </option>
                                <option  v-for="(item, index) in list_grade" :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                            </select>  
                        </div>
                        <div class="col-sm-3 m-t-2 pull-right">
                         <select class="form-control" id="course_id"  name="course_id" v-model="course_id">
                            <option value=""> - Pilih Mata Pelajaran - </option>
                            <option  v-for="(item, index) in list_course_" :key="index" :value="item.course_id"> {{item.course_name}} </option>
                        </select>
                    </div>
                    
                    
                    
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12" style="margin-bottom:50px">
                            <router-link :to="{name:'kd.create'}" class="btn btn-primary pull-left txt-white m-t-2  m-r-1">  Tambah </router-link>
                            <router-link :to="{name:'kd.pemetaan'}" class="btn btn-success pull-left txt-white m-t-2  m-r-1"> Pemetaan KD </router-link>

                            <button class="btn btn-warning txt-white m-t-2" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                            <button class="btn btn-success  txt-white m-t-2" id="btn-upload"  @click="uploadExcel()"> Upload Excel <i class="fa fa-upload"></i> </button>
                        </div>
                        <div class="col-sm-12 table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th> Tahun Ajaran</th>
                                        <th> Kelas </th>
                                        <th> Mata Pelajaran </th>
                                        <th> Kode </th>
                                        <th> Kompetensi Dasar </th>
                                        <th> Type </th>
                                        <th> Action  </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="row,index in data_show">
                                        <td>{{index+1}}</td>
                                        <td>{{row.unit_year_name}}</td>
                                        <td>{{row.class_grade_name}}</td>
                                        <td>{{row.course_name}}</td>
                                        <td>{{row.kd_code}}</td>
                                        <td>{{row.kd_name}}</td>
                                        <td>{{row.kd_type}}</td>
                                        <td>
                                            <router-link class="btn btn-warning" :to="{name:'kd.edit',params:{id:row.kd_id}}" ><i class="fa fa-pencil"></i>
                                            </router-link>
                                            <button class="btn btn-danger" type="button" @click="delete_kd(row.kd_id)"><i class="fa fa-minus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                            <div class="pull-left">
                              <vue-pagination :data="data_post" :limit="2"  v-on:pagination-change-page="get_data">
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
                            <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="kd.unit_id">
                                <option value=""> - Pilih Unit - </option>
                                <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                            </select>
                            <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                        </div>
                    </div>                                

                    <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Tingkat Kelas  <span class="form-mandatory">*</span> </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="class_grade_id" name="class_grade_id" @change="get_course_($event)"  v-model="kd.class_grade_id">
                                <option value="" v-if="list_class_grade.data"> - Pilih Kelas - </option>
                                <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                            </select>
                            <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                        </div>
                    </div>


                    <div class="form-group row" :class="{'has-danger':errors.course_id}">
                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Mata Pelajaran  <span class="form-mandatory">*</span> </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="course_id"  name="course_id" v-model="kd.course_id">
                                <option value=""> - Pilih Mata Pelajaran - </option>
                                <option  v-for="(item, index) in list_course_ " :key="index" :value="item.course_setting_id"> {{item.course_name}} </option>
                            </select>
                            <div class="form-control-feedback" v-if="errors.course_id">{{errors.course_id[0]}}</div>
                        </div>
                    </div>           




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
import {mapActions,mapState,mapMutations} from 'vuex';
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
            list_course_ : [],
            data_show:[],
            list_course_:[],
            list_grade:[],
            loading:true,
            search:'',
            data_post:{},
            course_id:'',
            class_grade_id:'',
            kd:{
                unit_id:'',
                class_grade_id:'',
                course_id:'',
            },  
        }
    },
    watch:{
        search:function(q){
            if(q!=''){
                this.search_kd();
            }
            else
            {
                this.get_data();
            }
        },
        class_grade_id:function(q){
            if(q!=''){
                this.class_grade_id = q;
                this.search_kd();
            }
            else
            {
                this.class_grade_id = '';
                this.get_data(1);
            }  

        },
        course_id:function(q){
            if(q!=''){
                this.course_id =q;
                this.search_kd();
            }
            else
            {
                this.course_id ='';
                this.get_data(1);
            }  

        }
    },
    mounted(){
        this.get_data();
        this.get_unit();
        this.get_course();
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

    get_data(page){
        var app =this;
        if(typeof page == 'undefined'){
            page = 1;
        }
        axios.get('kd?page='+page+'&q='+app.search+'&class_grade_id='+app.class_grade_id+'&course_id='+app.course_id)
        .then(function(resp){
            app.data_show = resp.data.data;
            app.data_post = resp.data;
            app.loading=false;  
            
        }).
        catch(function(resp){
            app.loading=false;
        })
    },
    get_course(){
        var app = this;
        axios.get('/get_course').then(function(resp){
            app.list_course_ = resp.data.data.data;
        }); 
    }, 
    get_grade(){
        var app = this;
        axios.get('/get_class_grade_all').then(function(resp){
            app.list_grade = resp.data.data.data;
        }); 
    },
    search_kd(page){
        var app = this;
        if(typeof page == 'undefined'){
            page = 1;
        }
        axios.get('kd?q='+app.search+'&page='+page+'&class_grade_id='+app.class_grade_id+'&course_id='+app.course_id)
        .then(function(resp){
            app.data_show = resp.data.data;
            app.data_post = resp.data;
        })
        .catch(function(error){
        })
    },

    get_course_(e){      
        var app = this;
        axios.get('/get_course_by_id?class_grade_id='+e.target.value).then(function(resp){
            app.list_course_ = resp.data;
        });       
    },
    

    delete_kd(id){
        swal({
            title:"Apakah kamu yakin",
            text:"Menghapus data ini",
            icon:'warning',
            buttons:true,
            dangerMode : true,
        }).then((willdelete)=>{
            if(willdelete){
                var app = this;
                axios.delete('kd/'+id)
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
        $('#form-all')[0].reset();
        $('#modal').modal('show');
    },


    saveUpload(){
        $('#loading_show').show();
        $('#modal').modal('hide');
        $('#btn-upload').attr('disabled',true);
        var app = this;
        let formData = new FormData(); 
        formData.append('file_excel', app.file_excel);               
        formData.append('unit_id', app.kd.unit_id);               
        formData.append('class_grade_id',  app.kd.class_grade_id);               
        formData.append('course_id',  app.kd.course_id);               
        axios.post('/kd_upload',formData,{
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        }
        )
        .then(function(resp){
            app.close_modal();
            $('#loading_show').hide();
            $('#btn-upload').attr('disabled',false);
            app.get_data();
        }).catch(function(resp){
            $('#loading_show').hide();
            $('#btn-upload').attr('disabled',false);
            swal('Error','File Masih Kosong','error');
        })
    },


    exportTableToExcel(table, name=''){
        window.open('kd/export');
        
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