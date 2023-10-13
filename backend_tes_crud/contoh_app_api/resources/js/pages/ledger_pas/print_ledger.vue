<template>
<div>
    <div id="loading_show" class="loader-overlay-back" style="">
        <div class="loader"> Loading .....</div> 
    </div>   
     <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ledger PAS Siswa</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/ledger_pas"> Ledger  </router-link> 
                    </li>
                    <li class="breadcrumb-item">Lihat Ledger PAS
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
                            <button class="btn btn-primary" @click="downloadWithCSS($route.params.id,$route.params.class_grade_id)"> Cetak Ledger </button>
                            <router-link to="/ledger_pas" class="btn btn-warning"> Kembali </router-link>
                        </div>
                        <h5 class="card-header-text"> Ledger PAS Siswa </h5>
                        
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
                class_grade_id_ : this.$route.params.class_grade_id,
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
                async get_data(){
                    $('#loading_show').show();
                    var app = this;
                    var id  = app.$route.params.id;
                    await axios.get('insert_raport?study_group_id='+id+'&class_grade_id='+app.class_grade_id_,
                    // await axios('/get_view_ledger?study_group_id='+id+'&class_grade_id='+app.class_grade_id_, 
                    {
                        method: 'GET',
                    })
                    .then(response => {
                        axios('/get_view_ledger?study_group_id='+id+'&class_grade_id='+app.class_grade_id_, {method: 'GET',})
                        .then(resp=>{
                            $('#loading_show').hide();
                            app.result_view = resp.data.data_all;
                        })
                    })
                    .catch(error => {
                    });
                },

                async downloadWithCSS(id,class_grade_id){
                    $('#loading_show').show();
                    var app =this;
                    await axios.get('insert_raport?study_group_id='+id+'&class_grade_id='+class_grade_id)
                    .then(function(resp){
                        $('#loading_show').hide();
                        window.location = '/download_ledger/export?study_group_id='+id+'&class_grade_id='+class_grade_id;
                                           
                    }).catch(function(resp){    
                        $('#loading_show').hide();
                        swal('Error',resp.response.data.message,'error');
                    })
                },
        }

    }
</script>