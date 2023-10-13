<template>
<div>
    <div id="loading_show" class="loader-overlay-back" style="">
        <div class="loader"> Loading .....</div> 
    </div>    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Lihat Rekap</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item">
                        <router-link to="/summary_value" >  Rekap </router-link> 
                    </li>        
                    <li class="breadcrumb-item">
                        Lihat Rekap
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
                            <button class="btn btn-primary" @click="download_rekap($route.params.id)"> Cetak Rekap </button>
                            <router-link to="/summary_value" class="btn btn-warning"> Kembali </router-link>
                        </div>
                        <h5 class="card-header-text"> Lihat Rekap </h5>
                        
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
                    var id  = app.$route.params.id;
                    var class_grade_id  = app.$route.params.class_grade_id;
                    var study_group_id  = app.$route.params.study_group_id;
                    axios('/view_summary?course_id='+id+'&class_grade_id='+class_grade_id+'&study_group_id='+study_group_id, {
                        method: 'GET',
                    })
                    .then(response => {

                        app.result_view = response.data.data_all;
                        $('#loading_show').hide();
                    })
                    .catch(error => {
                        // console.log('asetm');
                        // console.log(error.response.data.message);
                        if(error.response.status == 500){
                            swal('Error',error.response.data.message,'error');
                        }

                        $('#loading_show').hide();
                    });
                },
                download_rekap(id){
                	$('#loading_show').show();
                	var app =this;
                    $('#loading_show').hide();
                    var id  = app.$route.params.id;
                    var class_grade_id  = app.$route.params.class_grade_id;
                    var study_group_id  = app.$route.params.study_group_id;
                    window.open('/download_summary_value/export?course_id='+id+'&class_grade_id='+class_grade_id+'&study_group_id='+study_group_id);    
            	}       
        }

    }
</script>