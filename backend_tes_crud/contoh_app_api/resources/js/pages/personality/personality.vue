<template>
    <div>
        <div id="loading_show" class="loader-overlay-back" style="display:none">
            <div class="loader"><img src="assets/images/1.gif"></div> 
        </div>

        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4> Input  Kepribadian </h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item"> Input  Kepribadian 
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
                                        <label for="exampleInputEmail1" class="form-control-label">Pilih Unit</label>
                                        <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="personality.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Kelas</label>
                                        <select class="form-control" id="class_grade_id" @change="get_study_group_($event)" name="class_grade_id" v-model="personality.class_grade_id">
                                            <option value=""> - Pilih Kelas - </option>
                                            <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="form-control-label"> Pilih Rombel</label>
                                        <select class="form-control" id="study_group_id" name="study_group_id" @change="get_data_setting($event)" v-model="personality.study_group_id">
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


        <div class="row" style="display: none" id="row_setting">
            <div class="col-sm-12">
                <!-- Basic Table starts -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h5 class="card-header-text"> Input Personality</h5>
                            <div class="m-t-2">
                                <button class="btn btn-primary" @click="exportTableToExcel()"> <i class="fa fa-download"></i> Download Format  </button>
                                <button class="btn btn-success" @click="uploadExcel()"> <i class="fa fa-upload"></i> Upload Nilai  </button>
                            </div>
                        </div>

                    </div>
                    <div class="card-block" id="table_input">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <div v-html="result_view">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Basic Table ends -->
            </div>
        </div>

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
            data_show_modal:[],
            list_student:[],
            list_class_grade:[],
            list_study_group:[],
            personality:[],
            result_view:'',
            loading:true,
            search:'',
            showModal: false,
            personality:{
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
        }),
    },
    methods:{
        ...mapActions('application',['get_unit','get_class_grade','get_study_group','get_student_by_class']),

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
            var app = this;
            axios.get('get_study_group_setting?study_group_id='+app.personality.study_group_id)
            .then(function(resp){
                app.data_show = resp.data;
                app.data_post = resp.data;
                app.loading=false;  

                axios.get('get_total_personality')
                .then(function(resp){
                    app.data_personality = resp.data.data_personality; 
                    app.personality_type = resp.data.personality_type; 
                    axios.post('send_param_personality',{
                        params:{
                            'data_show' : app.data_show,
                            'data_personality' :app.data_personality,
                            'personality_type' : resp.data.personality_type,
                        }
                    })
                    .then(function(resp){
                        app.result_view = resp.data.data_all;
                        $('#loading_show').hide();
                    }).
                    catch(function(resp){
                    })
                    $('#loading_show').hide();
                }).
                catch(function(resp){
                    app.loading=false;
                    $('#loading_show').hide();
                })
            }).
            catch(function(resp){
                app.loading=false;
                $('#loading_show').hide();
            })


        },


        get_data_student(page){
            this.selected=[];
            this.search_modal = '';
            if(typeof page == 'undefined'){
                page = 1;
            }

            this.get_student_by_class({class_grade_id:$('#class_grade_id').val(),page:page}).then(()=>{
                this.list_student = this.student_by_class;
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

        insert_personality(e,student_id,personality_type){
            axios.post('personality',{
                'personality_value': e.target.value,
                'student_id':student_id,
                'personality_type':personality_type,
            })
            .then(function(resp){

            }).
            catch(function(resp){
                app.loading=false;
            })             
        },

        get_value(student_id,personality_type,personality){
            var app =this;
            let input_personality;
            const token = store.state.token
            $.ajax({
                url: '/api/get_value_personality',
                type:'GET',
                headers:{
                    'Content-Type': 'application/json',
                    'Authorization':`Bearer ${token}`,
                },
                async: false,
                data:{
                    'student_id' : student_id,
                    'personality_type': personality_type,
                    'personality' :personality,
                },
                beforeSend(){
                    $('#loading_show').show();
                },
                success:function(resp){
                  return input_personality = resp.data;
              }
          }).done(function(){
            $('#loading_show').hide();
        })

          return input_personality;
      },

      exportTableToExcel(table, name=''){
        var app = this;
        axios.get('validation_check?&study_group_id='+app.personality.study_group_id)
        .then(function(res){
            window.open('personality/export?study_group_id='+app.personality.study_group_id);            
        }).
        catch(function(resp){
            swal('Error',resp.response.data.message,'error');
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
        axios.post('/personality_upload',formData,
        {

            headers: {

                'Content-Type': 'multipart/form-data'
            }
        }
        )
        .then(function(resp){

         axios.get('get_study_group_setting?study_group_id='+app.personality.study_group_id)
         .then(function(resp){
            app.data_show = resp.data;
            app.data_post = resp.data;
            app.loading=false;  

            axios.get('get_total_personality')
            .then(function(resp){
                app.data_personality = resp.data.data_personality; 
                app.personality_type = resp.data.personality_type; 
                
                axios.post('send_param_personality',{
                    params:{
                        'data_show' : app.data_show,
                        'data_personality' :app.data_personality,
                        'personality_type' : resp.data.personality_type,
                    }
                })
                .then(function(resp){
                    app.result_view = resp.data.data_all;
                    $('#loading_show').hide();
                }).
                catch(function(resp){
                })
            }).
            catch(function(resp){
                app.loading=false;
            })


        }).
         catch(function(resp){
            app.loading=false;
        })

     }).catch(function(resp){
        $('#loading_show').hide();
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




}
}
</script>