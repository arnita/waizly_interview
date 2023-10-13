<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4> Buat Soal PTS TEMATIK </h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/structure_tematic">   Struktur Tematik </router-link>
                    </li>    
                    <li class="breadcrumb-item">  Buat Soal Tematic
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
                    <h5 class="card-header-text"> Buat Soal PTS TEMATIK </h5>
                </div>

                <div class="alert alert-success" style="font-weight:bold;font-size:15px">
                    No soal yang sudah dipakai : {{no_exist}}
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th align="center"> No </th>
                                        <th align="center"> Soal No </th>
                                        <th align="center"> Bobot </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for=" (n,index) in total_question">
                                        <td>{{index+1}}</td>
                                        <td><input type="text"  class="form-control" style="width:100px" :value="n.number_question" @change="insert_number($event,n.list_question_per_tema_id,n.kd_id)"></td>
                                        <td><input type="text"  class="form-control" style="width:100px" :value="n.quality_question"   @change="insert_quality($event,n.list_question_per_tema_id,n.kd_id)"></td>
                                    </tr>
                                </tbody>
                                
                            </table>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <a @click="$router.go(-1)" class="btn btn-default m-r-30">back</a>
                                        </center>
                                    </div>
                                </div>


                            </form>
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
    import $axios from '../../api.js'
    export default{
        name:'create',
        data(){
        return {
            id:this.$route.params.id,
            structure_tematic_id:this.$route.params.st_id,
            errors : [],
            no_exist: '',
            total_question : [],
            list_question_per_tema:{
                kd_id:'',
                quality_question:'',
                number_question:'',
                },   
            }
        },
     
        created(){
            this.get_uts_tema(this.id).then((resp)=>{
                this.total_question = resp;
            });
            this.cek_number();
        },
        computed:{
            ...mapState('application', {
                uts_tema:state=>state.uts_tema,
            }),
        },
       
        methods:{
            ...mapActions('application',['get_uts_tema']),
            insert_number(e,id,kd_id){
                $axios.post(`/insert_number_uts`,{'number_question':e.target.value,'id':id,'kd_id':kd_id,'structure_tematic_id':this.structure_tematic_id})
                    .then(function(resp){
                        // swal('Success','Simpan data berhasil','success');
                }).catch(function(resp){
                        swal('Error','No soal ini sudah dipakai','error');
                })
                
            },
            insert_quality(e,id,kd_id){
                $axios.post(`/insert_quality_uts`,{'quality_question':e.target.value,'id':id,'kd_id':kd_id})
                    .then(function(resp){
                        // swal('Success','Simpan data berhasil','success');
                })   
            },
            async cek_number(){
                var app = this;                
                await $axios.get('/cek_number?type_question=uts&id='+app.id+'&structure_tematic_id='+app.structure_tematic_id)
                .then(function(resp){
                    console.log(resp.data.data);
                    // swal('Success','Simpan data berhasil','success');
                    app.no_exist = resp.data.data;
                }).catch(function(resp){
                        // swal('Error','No soal ini sudah dipakai','error');
                })
            }
        },
    }
</script>