<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Building</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/building"> Kelas </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Building
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
                    <h5 class="card-header-text">Ubah Building</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                           <form id="form-class-grade" @submit="update_building">
                                <div class="form-group row" :class="{'has-danger':errors.building_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Ruangan Kelas <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="building_id" type="hidden" value=""  v-model="building.building_id">
                                        <input class="form-control " name="building_name" type="text" value=""  v-model="building.building_name">
                                        <div class="form-control-feedback" v-if="errors.building_name">{{errors.building_name[0]}}</div>
                                    </div>
                                </div>



                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id"  name="unit_id" v-model="building.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>                                



                             
                                <div class="form-group row" :class="{'has-danger':errors.building_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="building_desc" v-model="building.building_desc">
                                        <div class="form-control-feedback" v-if="errors.building_desc">{{errors.building_desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/building" class="btn btn-default m-r-30">Batal</router-link>
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
            errors : [],
            list_class_grade : [],
            building:{
                building_name:'',
                building_status:'',
                building_desc:'',
                building_id:'',
                unit_id:'',
                },   
                isLoading: false,
                fullPage: true,
                time:'',
            }
        },
        created(){
            this.get_unit(); 
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
            }),
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/building/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.building.building_id = resp.data.building_id;
                app.building.building_name = resp.data.building_name;
                app.building.building_desc = resp.data.building_desc;
                app.building.unit_id = resp.data.unit_id;
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_class_grade_all']),
            clear_form(){
                this.building.building_name='';
                this.building.building_desc='';
                this.building.unit_id='';
                this.errors=[];
            },
            onCancel() {
            },
            update_building(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/building/'+this.building.building_id,this.building).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/building');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>