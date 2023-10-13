<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Gedung</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/class_room">  Gedung </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Gedung
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
                    <h5 class="card-header-text">Tambah Gedung</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <form id="form-class-grade" @submit="submit">


                                <div class="form-group row" :class="{'has-danger':errors.building_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Gedung <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="building_name" type="text" value=""  v-model="class_room.building_name">
                                        <div class="form-control-feedback" v-if="errors.building_name">{{errors.building_name[0]}}</div>
                                    </div>
                                </div>



                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="unit_id"  name="unit_id" v-model="class_room.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>                                



                             
                                <div class="form-group row" :class="{'has-danger':errors.building_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="building_desc" v-model="class_room.building_desc">
                                        <div class="form-control-feedback" v-if="errors.building_desc">{{errors.building_desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/class_room" class="btn btn-default m-r-30">Batal</router-link>
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
            class_room:{
                building_name:'',
                building_status:'',
                building_desc:'',
                unit_id:'',
                },   
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
        methods:{

            ...mapActions('application',['get_unit']),
            clear_form(){
                this.class_room.building_name='';
                this.class_room.building_status='';
                this.class_room.building_desc='';
                this.class_room.unit_id='';
                this.errors=[];
            },
           
            submit(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/class_room`,this.class_room).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/class_room');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>