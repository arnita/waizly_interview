<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Ubah Fisik</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/m_fisik"> Fisik </router-link>
                    </li>
                    <li class="breadcrumb-item"> Ubah Fisik
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
                    <h5 class="card-header-text">Ubah Fisik</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                               <loading :active.sync="isLoading" 
                                :can-cancel="true" 
                                :on-cancel="onCancel"
                                :is-full-page="fullPage"></loading>
                            <form id="form-class-grade" @submit="update_parlookup_fisik">
                                <div class="form-group row" :class="{'has-danger':errors.name}">
                                    <label for="example-text-input" class="col-xs-2 col-form-label form-control-label">Nama Fisik <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                        <input class="form-control " name="name" type="text" value=""  v-model="parlookup_fisik.name">
                                        <input class="form-control " name="parlookup_id" type="hidden" value=""  v-model="parlookup_fisik.parlookup_id">
                                        <div class="form-control-feedback" v-if="errors.name">{{errors.name[0]}}</div>
                                    </div>
                                </div>

                             
                          

                                <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                    <label for="example-url-input" class="col-xs-2 col-form-label form-control-label"> Unit  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-10">
                                       <select class="form-control" id="unit_id" name="unit_id" v-model="parlookup_fisik.unit_id">
                                            <option value=""> - Pilih Unit - </option>
                                            <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.desc}">
                                    <label for="example-email-input" class="col-xs-2 col-form-label form-control-label">Keterangan </label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value=""  name="desc" v-model="parlookup_fisik.desc">
                                        <div class="form-control-feedback" v-if="errors.desc">{{errors.desc[0]}}</div>
                                    </div>
                                </div>
                                 
                                <div class="row">
                                    <div class="col-md-12">
                                        <center>
                                            <button type="submit" class="btn btn-primary m-r-30">Simpan</button>
                                            <router-link to="/class_grade" class="btn btn-default m-r-30">Batal</router-link>
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
    import $axios from '../../../api.js'
    export default{
        name:'create',
        data(){
        return {
            errors : [],
            parlookup_fisik:{
                name:'',
                desc:'',
                parlookup_fisik_status:'',
                parlookup_id:'',
                unit_id:'',
                category:'Fisik',
                },  
                isLoading: false,
                fullPage: true,
            }
        },
        created(){
            this.get_unit();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit
            }),
        },
        mounted(){
            var id = this.$route.params.id;
            var app = this;
            app.isLoading = true;
            $axios.get('/edit_parlookup/'+id+'/edit')
            .then(function(resp){
                app.isLoading = false;
                app.parlookup_fisik.name = resp.data.name;
                app.parlookup_fisik.desc = resp.data.desc;
                app.parlookup_fisik.parlookup_fisik_status = resp.data.parlookup_fisik_status;
                app.parlookup_fisik.parlookup_id = resp.data.parlookup_id;
                app.parlookup_fisik.unit_id = resp.data.unit_id;
                
            })
            .catch(function(resp){

            })
        },
        methods:{
            ...mapActions('application',['get_unit']),
            clear_form(){
                this.parlookup_fisik.name='';
                this.parlookup_fisik.desc='';
                this.parlookup_fisik.parlookup_fisik_status='';
                this.parlookup_fisik.unit_id='';
                this.errors=[];
            },
            onCancel() {
            },
            update_parlookup_fisik(e){
                e.preventDefault();
                var app = this;
                return new Promise((resolve,reject)=>{
                    $axios.put('/update_parlookup/'+this.parlookup_fisik.parlookup_id,this.parlookup_fisik).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        app.clear_form();
                        app.$router.push('/m_fisik');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                    })
                })
                
            },
            

        },
    }
</script>