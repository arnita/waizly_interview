<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Karyawan</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/employee">  Karyawan </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Karyawan
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
                    <h5 class="card-header-text">Data Karyawan</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <div class="card-block">
                                <div class="row">
                                    <div class="sub-title"> 
                                        <h4 class="card-header-text"> Akses Karyawan </h4>
                                    </div>               
                                    <div class="col-sm-12 table-responsive">
                                        <div class="col-md-6">

                                            <div class="form-group row" :class="{'has-danger':errors.username}">
                                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Username  </label>
                                                <div class="col-sm-8">
                                                    <input class="form-control " name="username" placeholder='Terisi Otomatis Disaat di buat' readonly type="text"  v-model="employee.username">
                                                    <div class="form-control-feedback" v-if="errors.username">{{errors.username[0]}}</div>
                                                </div>
                                            </div>



                                            <div class="form-group row" :class="{'has-danger':errors.password}">
                                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Password   </label>
                                                <div class="col-sm-8">
                                                    <input class="form-control " name="password" placeholder='Terisi otomatis disaat dibuat' type="text" readonly  v-model="employee.password">
                                                    <div class="form-control-feedback" v-if="errors.password">{{errors.password[0]}}</div>
                                                </div>
                                            </div>


                                            <div class="form-group row" :class="{'has-danger':errors.employee_id_card}">
                                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Pilih Unit </label>
                                                <div class="col-sm-8">
                                                    <button class="btn btn-success m-b-10" @click="setting_unit"> <i class="fa fa-plus"></i> Tambah Unit </button>
                                                    <table class="table table-bordered table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Nama Unit</th>                                          
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr v-for="row,index in employee.selected">
                                                                <td>
                                                                    {{employee.selected[index]}}
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-md-6">

                                            <div class="form-group row" :class="{'has-danger':errors.employee_status}">
                                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Status <span class="form-mandatory">*</span> </label>
                                                <div class="col-sm-8">
                                                    <select name="employee_status" id="employee_status" class="form-control" v-model="employee.employee_status">
                                                        <option value=""> - Pilih Status  - </option>
                                                        <option value="active"> Aktif </option>
                                                        <option value="deactive"> Tidak Aktif </option>
                                                    </select>
                                                    <!-- <input class="form-control " name="employee_status" type="text"    v-model="employee.employee_status"> -->
                                                    <div class="form-control-feedback" v-if="errors.employee_status">{{errors.employee_status[0]}}</div>
                                                </div>
                                            </div>

                                            <div class="form-group row" :class="{'has-danger':errors.employee_id_card}">
                                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  ID Karyawan </label>
                                                <div class="col-sm-8">
                                                    <input class="form-control " name="employee_id_card" type="text" placeholder='Terisi otomatis disaat di buat' readonly   v-model="employee.employee_id_card">
                                                    <div class="form-control-feedback" v-if="errors.employee_id_card">{{errors.employee_id_card[0]}}</div>
                                                </div>
                                            </div>



                                            <div class="form-group row" :class="{'has-danger':errors.employee_role}">
                                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Role  <span class="form-mandatory">*</span>  </label>
                                                <div class="col-sm-8">
                                                    <select class="form-control" id="role" name="role" v-model="employee.employee_role">
                                                        <option value=""> - Pilih Role - </option>
                                                        <option  v-for="(item, index) in role.data " :key="index" :value="item.id"> {{item.name}} </option>
                                                    </select>
                                                    <div class="form-control-feedback" v-if="errors.employee_role">{{errors.employee_role[0]}}</div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sub-title"> 
                                <h4 class="card-header-text"> Data Karyawan  </h4>
                            </div> 
                    
                            <div class="col-md-6">
                                <div class="form-group row" :class="{'has-danger':errors.employee_name}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Nama Karyawan <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="employee_name" placeholder='Nama Karyawan' type="text"  v-model="employee.employee_name">
                                        <div class="form-control-feedback" v-if="errors.employee_name">{{errors.employee_name[0]}}</div>
                                    </div>
                                </div>



                                <div class="form-group row" :class="{'has-danger':errors.employee_nik}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  nik Karyawan <span class="form-mandatory">*</span>   </label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="employee_nik" placeholder='nik Karyawan' type="text"  v-model="employee.employee_nik">
                                        <div class="form-control-feedback" v-if="errors.employee_nik">{{errors.employee_nik[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.employee_gender}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Jenis Kelamin <span class="form-mandatory">*</span>  </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="gender" name="gender" v-model="employee.employee_gender">
                                            <option value=""> - Pilih Jenis Kelamin - </option>
                                            <option  v-for="(item, index) in gender.data " :key="index" :value="item.value"> {{item.name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.employee_gender">{{errors.employee_gender[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.employee_birth_place}">
                                    <label for="example-email-input" class="col-xs-4 col-form-label form-control-label">Tempat Lahir  <span class="form-mandatory">*</span></label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type="text" placeholder='Tempat Lahir'  name="employee_birth_place" v-model="employee.employee_birth_place">
                                        <div class="form-control-feedback" v-if="errors.employee_birth_place">{{errors.employee_birth_place[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.employee_desc}">
                                    <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Keterangan </label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type="text"  placeholder='Keterangan' name="employee_desc" v-model="employee.employee_desc">
                                        <div class="form-control-feedback" v-if="errors.employee_desc">{{errors.employee_desc[0]}}</div>
                                    </div>
                                </div>
                                <div class="form-group row" :class="{'has-danger':errors.photo_assign}">
                                    <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Foto Tanda Tangan </label>
                                    <div class="col-sm-8">
                                        <div v-if="!employee.photo_assign">
                                            <input type="file" @change="avatarChange" name="">
                                        </div>
                                        <div v-else>
                                                <img :src="employee.photo_assign" width="100" height="100">
                                                <button @click="removeImage" type="button" class="btn btn-warning"> <i class="fa fa-trash"></i> </button>
                                            
                                        </div>
                                        <div class="form-control-feedback" v-if="errors.photo_assign">{{errors.photo_assign[0]}}</div>
                                    </div>
                                </div>


                          

                            </div>

                            <div class="col-md-6">

                                <div class="form-group row" :class="{'has-danger':errors.employee_birth_date}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Tanggal Lahir <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-8">
                                        <datetime v-model="employee.employee_birth_date"   format="dd-MM-yyyy"  input-class="form-control"></datetime>
                                        <div class="form-control-feedback" v-if="errors.employee_birth_date">{{errors.employee_birth_date[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.employee_religion}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Agama <span class="form-mandatory">*</span>   </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="employee_religion" name="employee_religion" v-model="employee.employee_religion">
                                            <option value=""> - Pilih Agama - </option>
                                            <option  v-for="(item, index) in religion.data " :key="index" :value="item.value"> {{item.name}} </option>
                                        </select>
                                        <div class="form-control-feedback" v-if="errors.employee_religion">{{errors.employee_religion[0]}}</div>
                                    </div>
                                </div>


                                <div class="form-group row" :class="{'has-danger':errors.employee_hp}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  No Hp </label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="employee_hp" type="text" placeholder='No Hp'  v-model="employee.employee_hp">
                                        <div class="form-control-feedback" v-if="errors.employee_hp">{{errors.employee_hp[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.employee_email}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Email Karyawan  <span class="form-mandatory">*</span> </label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type="text"  placeholder='Email Karyawan' name="employee_address" v-model="employee.employee_email">
                                        <div class="form-control-feedback" v-if="errors.employee_email">{{errors.employee_email[0]}}</div>
                                    </div>
                                </div>                                
                            
                                <div class="form-group row" :class="{'has-danger':errors.employee_telp}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> No Telepon   </label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type="text"   placeholder='No Telepon' name="employee_address" v-model="employee.employee_telp">
                                        <div class="form-control-feedback" v-if="errors.employee_telp">{{errors.employee_telp[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.employee_address}">
                                    <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Alamat </label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" type="text"  placeholder='Alamat' name="employee_address" v-model="employee.employee_address"></textarea>
                                        <div class="form-control-feedback" v-if="errors.employee_address">{{errors.employee_address[0]}}</div>
                                    </div>
                                </div>

                              
                            </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <center>
                            <button type="submit" class="btn btn-primary m-r-30" :disabled="isDis" @click="submit" >Simpan</button>
                            <router-link to="/employee" class="btn btn-default m-r-30">  Batal </router-link>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        
        </div>
    </div>
    <!-- Row end -->
    <!-- Tables end -->



<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
       
            <div class="modal-body" style="padding: 0">
                <div class="col-sm-3 m-t-2 pull-right">
                    <input type="text" class="form-control" autocomplete="off" name="q" placeholder="Cari....">
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                <div class="form-check">
                                    <label for="chkme" class="form-check-label">
                                        <input type="checkbox" class="form-check-input" @click="selectAll_" name="unit_name" v-model="allSelected">
                                    </label>
                                </div>
                            </th>
                            <th> Nama Unit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="row,index in unit_id">
                            <td>
                                <div class="form-check">
                                    <label for="chkme" class="form-check-label">
                                        <input type="checkbox" class="form-check-input" @click="select_one" v-model="employee.selected" :value="row.unit_name" name="unit_name">
                                    </label>
                                </div>
                            </td>
                            <td>{{row.unit_name}}</td>
                        </tr>
                    </tbody>
                    
                </table>
                
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>
            </div>
        </div>
    </div>
</div>
       

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
            isDis:false,
            list_class_grade : [],
            list_gender : [],
            unit_id:[],
            // selected:[],
            selectedName:[],
            allSelected:false,
            employee:{
                username:'',
                password:'',
                employee_status:'',
                employee_id_card:'',
                position_id:'',
                employee_type:'',
                employee_name:'',
                employee_working_status:'',
                employee_nik:'',
                employee_gender:'',
                employee_birth_place:'',
                employee_religion:'',
                employee_identity:'',
                employee_last_education:'',
                employee_marital_status:'',
                employee_hp:'',
                employee_website:'',
                employee_telp:'',
                employee_address:'',
                employee_photo:'',
                employee_desc:'',
                employee_role:'',
                photo_assign:'',
                selected:[],
                },   
            }
        },
     
        created(){
            this.get_gender();
            this.get_religion();
            this.get_role();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                gender:state=>state.gender,
                religion:state=>state.religion,
                role:state=>state.role
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_gender','get_religion','get_role']),
            selectAll_(){
                this.employee.selected =[];
                this.selectedName =[];
                if(!this.allSelected){
                    for(var unit in this.unit_id){
                        this.employee.selected.push(this.unit_id[unit].unit_name);
                    }
                }
                else
                {
                    this.employee.selected=[];
                }
                $('#modal').modal('hide');
            },
            select_one()
            {
                $('#modal').modal('hide');
            },
            /* =============== For Function Image Handler =========================== */
            avatarChange(e){
                var files = e.target.files || e.dataTransfer.files;
                if(!files.length)
                    return
                this.createImage(files[0]);

            },
            createImage(file){
                var image = new Image();
                var reader  = new FileReader();
                var app = this;

                reader.onload = (e)=>{
                    app.employee.photo_assign = e.target.result;
                }
                reader.readAsDataURL(file);
            },
            setting_unit(){
                $('#modal').modal('show');
                this.get_unit().then(()=>{                    
                    this.unit_id = this.unit.data;
                });
            },
            avatarChangeEd(e){
                var files = e.target.files || e.dataTransfer.files;
                if(!files.length)
                    return
                this.createImageEd(files[0]);

                this.tempImg=true
                this.imgOri=false

            },
            createImageEd(file){
                var image = new Image();
                var reader  = new FileReader();
                var app = this;

                reader.onload = (e)=>{
                    app.employee.photo_assign = e.target.result;
                }
                reader.readAsDataURL(file);
            },
            removeImage(){
                this.employee.photo_assign = '';
            },

            /** =============== */


            clear_form(){
                this.employee.username='';
                this.employee.password='';
                this.employee.employee_status='';
                this.employee.employee_id_card='';
                this.employee.position_id='';
                this.employee.employee_type='';
                this.employee.employee_name='';
                this.employee.employee_working_status='';
                this.employee.employee_nik='';
                this.employee.employee_gender='';
                this.employee.employee_birth_place='';
                this.employee.employee_religion='';
                this.employee.employee_identity='';
                this.employee.employee_last_education='';
                this.employee.employee_marital_status='';
                this.employee.employee_hp='';
                this.employee.employee_website='';
                this.employee.employee_telp='';
                this.employee.employee_address='';
                this.employee.employee_photo='';
                this.employee.employee_desc='';
                this.employee.employee_role='';
                this.errors=[];
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{                    
                    this.list_class_grade = this.class_grade;
                });                
            },
            submit(e){
                e.preventDefault();
                var app = this;
                app.isDis=true;
                return new Promise((resolve,reject)=>{
                    $axios.post(`/employee`,this.employee).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/employee');
                        app.isDis=false;
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        app.isDis=false;

                    })
                })
                
            },
        },
    }
</script>