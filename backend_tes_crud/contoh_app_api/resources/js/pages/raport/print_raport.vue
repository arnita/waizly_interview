<template>
<div>
    <div id="loading_show" class="loader-overlay-back" style="">
        <div class="loader"> Loading .....</div> 
    </div>    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Raport PAS Siswa</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">
                        <router-link to="/raport_pas" >  Raport PAS </router-link> 
                    </li>   
                    <li class="breadcrumb-item"> Lihar Raport PAS
                    </li> 
                </ol>
            </div>
        </div>
    </div>
    <!-- Header end -->



    
    <div class="row" id="content">
        <div class="col-sm-12">
            <!-- Basic Table starts -->
            <div class="card">
                
                <div class="card-header">
                    <div>
                        <div class="m-b-2">
                            <button class="btn btn-primary" @click="downloadWithCSS($route.query.id)"> Cetak Raport </button>
                            <router-link to="/raport_pas" class="btn btn-warning"> Kembali </router-link>
                        </div>
                        <h5 class="card-header-text"> Raport PAS Siswa </h5>
                        
                    </div>
                   
                    
                </div>
                <div class="card-block">
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

    <!-- Row end -->
    <!-- Tables end -->
</div>

       
</template>


<script>
import {mapActions,mapState,mapMutations} from 'vuex'
import axios  from '../../api.js';
import Vue from 'vue';
import store from '../../store.js';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import loading from '../../components/loading.vue';

    export default{
        data:function(){
            return {
                data_show:[],
                data_post:{},
                result_view:'',
                class_grade_id:this.$route.query.class_grade_id,
                study_group_id:this.$route.query.study_group_id,
            }
        },
        components:{
            'loading':loading,
        },
        created(){

            this.get_data();
        },
        methods:{
                get_data(){
                    $('#loading_show').show();
                    var app = this;
                    var id  = app.$route.query.id;
                    
                    axios('/get_view_raport?id='+id, {
                        method: 'GET',
                    })
                    .then(response => {

                        app.result_view = response.data.data_all;
                        $('#loading_show').hide();
                    })
                    .catch(error => {
                        // console.log(error.response.data.message);
                        $('#loading_show').hide();  
                        swal('Error',error.response.data.message,'error');
                    });
                },
                downloadWithCSS(id) {
                    $('#loading_show').show();
                    axios('/print_raport?id='+id+'&study_group_id='+this.study_group_id+'&class_grade_id='+this.class_grade_id, {
                        method: 'GET',
                        responseType: 'blob'
                    })
                    .then(response => {
                        var name = this.$route.query.name;
                         var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                         var fileLink = document.createElement('a');
                         fileLink.href = fileURL;
                         fileLink.setAttribute('download', 'raport_'+name+'.pdf');
                         document.body.appendChild(fileLink);
                         fileLink.click();
                         $('#loading_show').hide();

                    })
                    .catch(error => {
                    });
              }
        }

    }
</script>