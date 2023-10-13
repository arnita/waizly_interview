<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Ruangan Kelas</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/class_room"> Kelas </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Ruangan Kelas
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
                    <h5 class="card-header-text">Ubah Ruangan Kelas</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                           <form id="form-class-grade" @submit="update_class_room">
                                <div class="form-group row" :class="{'has-danger':errors.class_room_name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Ruangan Kelas <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="class_room_id" type="hidden" value=""  v-model="class_room.class_room_id">
                                        <input class="form-control " name="class_room_name" type="text" value=""  v-model="class_room.class_room_name">
                                        <div class="form-control-feedback" v-if="errors.class_room_name">{{errors.class_room_name[0]}}</div>
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



                             
                                <div class="form-group row" :class="{'has-danger':errors.class_room_desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="class_room_desc" v-model="class_room.class_room_desc">
                                        <div class="form-control-feedback" v-if="errors.class_room_desc">{{errors.class_room_desc[0]}}</div>
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
                class_room_name:'',
                class_room_status:'',
                class_room_desc:'',
                class_room_id:'',
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
            $axios.get('/class_room/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.class_room.class_room_id = resp.data.class_room_id;
                app.class_room.class_room_name = resp.data.class_room_name;
                app.class_room.class_room_desc = resp.data.class_room_desc;
                app.class_room.unit_id = resp.data.unit_id;
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_class_grade_all']),
            clear_form(){
                this.class_room.class_room_name='';
                this.class_room.class_room_desc='';
                this.class_room.unit_id='';
                this.errors=[];
            },
            onCancel() {
            },
            update_class_room(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/class_room/'+this.class_room.class_room_id,this.class_room).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
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