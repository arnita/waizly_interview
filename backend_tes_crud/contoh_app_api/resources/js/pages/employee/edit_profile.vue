<template>
    <div>
        <!-- Header Starts -->
        <div class="row">
            <div class="col-sm-12 p-0">
                <div class="main-header">
                    <h4>Ubah Karyawan</h4>
                    <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">

                        <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                        </li>
                        <li class="breadcrumb-item"> <router-link to="/employee"> Karyawan  </router-link>
                        </li>
                        <li class="breadcrumb-item"> Ubah Karyawan
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
                    <loading :active.sync="isLoading" 
                    :can-cancel="true" 
                    :on-cancel="onCancel"
                    :is-full-page="fullPage"></loading>
                    <div class="card-block">    
                        <div class="row">
                            <div class="col-sm-12 table-responsive">


                                <div class="col-md-6">
                                    <div class="form-group row" :class="{'has-danger':errors.employee_name}">
                                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Ubah Password <span class="form-mandatory">*</span> </label>
                                        <button class="btn btn-success" @click="open_modal_password"> Ubah Password </button>
                                    </div>


                                    <div class="form-group row" :class="{'has-danger':errors.employee_name}">
                                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Nama Karyawan <span class="form-mandatory">*</span> </label>
                                        <div class="col-sm-8">
                                            <input class="form-control " name="employee_name" placeholder='Nama Karyawan' type="text" value=""  v-model="employee.employee_name">
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
                                                <option  v-for="(item, index) in gender.data " :key="index" :value="item.name"> {{item.name}} </option>
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
                                            <input class="form-control" type="text" value=""  placeholder='Keterangan' name="employee_desc" v-model="employee.employee_desc">
                                            <div class="form-control-feedback" v-if="errors.employee_desc">{{errors.employee_desc[0]}}</div>
                                        </div>
                                    </div>

                                    <div class="form-group row" :class="{'has-danger':errors.photo_assign}">
                                        <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Foto Tanda Tangan </label>
                                        <div class="col-sm-8">
                                            <div v-if="employee.photo_assign == null" class="row">
                                                <div class="col-sm-4"><input type="file" @change="avatarChangeEd" name=""></div>
                                            </div>
                                            <div v-else>
                                                <div class="row">
                                                    <div><input type="file" @change="avatarChangeEd" name=""></div>
                                                    <br>
                                                    <div><img :src="'/image_employee/'+employee.photo_assign" width="200"  v-if="imgOri"></div>
                                                    <div><img :src="employee.photo_assign" width="200"  v-if="tempImg"></div>
                                                </div>
                                            </div>
                                            <div class="form-control-feedback" v-if="errors.photo_assign">{{errors.photo_assign[0]}}</div>
                                        </div>
                                    </div>



                                </div>

                                <div class="col-md-6">

                                    <div class="form-group row" :class="{'has-danger':errors.employee_birth_date}">
                                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Tanggal Lahir <span class="form-mandatory">*</span> </label>
                                        <div class="col-sm-8">
                                            <datetime v-model="employee.employee_birth_date"   format="dd-MM-yyyy"  input-class="form-control" ></datetime>
                                            <div class="form-control-feedback" v-if="errors.employee_birth_date">{{errors.employee_birth_date[0]}}</div>
                                        </div>
                                    </div>

                                    <div class="form-group row" :class="{'has-danger':errors.employee_religion}">
                                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Agama <span class="form-mandatory">*</span>   </label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="employee_religion" name="employee_religion" v-model="employee.employee_religion">
                                                <option value=""> - Pilih Agama - </option>
                                                <option  v-for="(item, index) in religion.data " :key="index" :value="item.name"> {{item.name}} </option>
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
                                            <input class="form-control" type="text" value=""  placeholder='Email Karyawan' name="employee_address" v-model="employee.employee_email">
                                            <div class="form-control-feedback" v-if="errors.employee_email">{{errors.employee_email[0]}}</div>
                                        </div>
                                    </div>                                

                                    <div class="form-group row" :class="{'has-danger':errors.employee_telp}">
                                        <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> No Telepon   </label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="text" value=""  placeholder='No Telepon' name="employee_address" v-model="employee.employee_telp">
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
                                    <button type="submit" class="btn btn-primary m-r-30" @click="update_employee" :disabled='isDis'>Update</button>
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
                                                <input type="checkbox" class="form-check-input" @click="select_one(row.unit_id,employee.employee_id)" v-model="employee.employee_unit" :value="row.unit_name" name="unit_name">
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


<!-- Modal -->
<div class="modal fade" id="modal_ubah_password" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
       
            <div class="modal-body" style="padding: 0">
                <div class="col-sm-12 table-responsive">
                    <div class="card-block">
                        <div class="row">
                            <div class="form-group row" :class="{'has-danger':errors.password_baru}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">   Password Baru   </label>
                                <div class="col-sm-8">
                                    <input class="form-control " name="password_baru" placeholder='Ubah Password' type="password"   v-model="password_baru">
                                <div class="form-control-feedback" v-if="errors.password_baru">{{errors.password_baru[0]}}</div>
                            </div>
                        </div> 

                        <div class="form-group row" :class="{'has-danger':errors.confirm_password}">
                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Confirm Password   </label>
                            <div class="col-sm-8">
                                <input class="form-control " name="confirm_password" placeholder='Ubah Password' type="password"   v-model="confirm_password">
                                <div class="form-control-feedback" v-if="errors.confirm_password">{{errors.confirm_password[0]}}</div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" :disabled="isDis" id="btn-edit-pass" @click="simpan_ubah_password">Update</button>
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
                confirm_password :'',
                password_baru:'',
                errors : [],
                modal_password:false,
                list_class_grade : [],
                imgOri:true,
                tempImg:false,
                allSelected:false,
                selected:[],
                isDis:false,
                unit_id:[],
                employee:{
                    employee_name:'',
                    employee_gender:'',
                    employee_birth_place:'',
                    employee_religion:'',
                    employee_identity:'',
                    employee_last_education:'',
                    employee_marital_status:'',
                    employee_hp:'',
                    photo_assign:'',
                    employee_desc:'',
                    employee_email:'',
                    employee_nik:'',
                    employee_telp:'',
                    employee_address:'',
                },     
                isLoading: true,
                fullPage: true,
                time:'',
            }
        },
        created(){
            this.get_unit();
            this.get_class_grade_all().then(()=>{
                this.list_class_grade = this.class_grade;
            });     

            this.get_gender();
            this.get_role();
            this.get_religion(); 

        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                class_grade_all:state=>state.class_grade_all,
                gender:state=>state.gender,
                religion:state=>state.religion,
                role:state=>state.role,
                employee_unit:state=>state.employee_unit

            }),
        },
        mounted(){
            var app = this;
            $axios.get('/edit_profile').then(function(resp){
                console.log(resp);


                app.employee.employee_name=resp.data.data.employee_name;
                app.employee.employee_gender=resp.data.data.employee_gender;
                app.employee.employee_birth_place=resp.data.data.employee_birth_place;
                app.employee.employee_religion=resp.data.data.employee_religion;
                app.employee.employee_identity=resp.data.data.employee_identity;
                app.employee.employee_last_education=resp.data.data.employee_last_education;
                app.employee.employee_marital_status=resp.data.data.employee_marital_status;
                app.employee.employee_hp=resp.data.data.employee_hp;
                app.employee.photo_assign=resp.data.data.photo_assign;
                app.employee.employee_desc=resp.data.data.employee_desc;
                app.employee.employee_email=resp.data.data.employee_email;
                app.employee.employee_nik=resp.data.data.employee_nik;
                app.employee.employee_telp=resp.data.data.employee_telp;
                app.employee.employee_address=resp.data.data.employee_address;
                app.employee.employee_birth_date=resp.data.data.employee_birth_date;


                app.isLoading = false;

            });
            
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_class_grade_all','get_gender','get_religion','get_role','get_employee_unit']),
            /* =============== For Function Image Handler =========================== */
            selectAll_(){
                this.employee.employee_unit =[];
                this.selectedName =[];
                if(!this.allSelected){
                    for(var unit in this.unit_id){
                        this.employee.employee_unit.push(this.unit_id[unit]);
                    }
                }
                else
                {
                    this.employee.employee_unit=[];
                }
                $('#modal').modal('hide');
            },
            open_modal_password(){
               $('#modal_ubah_password').modal('show');

           },
         
            /* =============== For Function Image Handler =========================== */
            avatarChange(e){
                var files = e.target.files || e.dataTransfer.files;
                if(!files.length)
                    return
                this.createImage(files[0]);

            },
            setting_unit(){
                $('#modal').modal('show');
                this.get_unit().then(()=>{                    
                    this.unit_id = this.unit.data;
                });
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
                this.employee.photo_assign='';
                this.employee.employee_desc='';
                this.employee.employee_birth_date='';
                this.errors=[];
            },
            get_class_(e){
                this.get_class_grade(event.target.value).then(()=>{
                    this.list_class_grade = this.class_grade;
                });                
            },

            onCancel() {
            },
            update_employee(e){
                e.preventDefault();
                var app = this;
                app.isDis=true;
                return new Promise((resolve,reject)=>{
                    $axios.post('/update_profile',app.employee).then(function(resp){
                        swal('Success','Ubah data berhasil','success');
                        location.reload(true);
                        app.isDis=false;
                    }).catch(function(resp){
                        app.isDis=false;
                        app.errors = resp.response.data.errors;

                    })
                })
                app.isDis=false;
            },
            ubah_password(){
                $('#modal_ubah_password').modal('show');
            },
            simpan_ubah_password(e){
               e.preventDefault();
               swal({
                title:"Apakah kamu yakin",
                text:"Menyimpan data ini",
                icon:'warning',
                buttons:true,
                dangerMode : true,
            }).then((willdelete)=>{
                if(willdelete){
                    var app = this;
                    $('#btn-edit-pass').attr('disabled',true);
                    $('#btn-edit-pass').text('Loading ....');
                    return new Promise((resolve,reject)=>{
                        $axios.post('/change_pass_emp',{confirm_password : app.confirm_password,user_id:app.employee.user_id,password_baru:app.password_baru}).then(function(resp){
                            swal({title: "Success", text: "Simpan data berhasil!", type: "success"},
                                ).then((response) => {
                                    location.reload(true);
                                });
                                $('#btn-edit-pass').attr('disabled',false);
                                $('#btn-edit-pass').text('Simpan');
                                app.data_ubah_password = "";
                            }).catch(function(resp){
                                $('#btn-edit-pass').attr('disabled',false);
                                $('#btn-edit-pass').text('Simpan');
                                app.errors = resp.response.data.errors;
                            })
                        })
                }
            })
        },
        delete_employee_unit(employee_unit_id){
            swal({
                title:"Apakah kamu yakin",
                text:"Menghapus data ini",
                icon:'warning',
                buttons:true,
                dangerMode : true,
            }).then((willdelete)=>{
                if(willdelete){
                    var app = this;
                    $axios.delete('delete_employee_unit/'+employee_unit_id)
                    .then(function(resp){
                        if(resp.data.status.code == 1)
                        {
                         location.reload(true);  
                     }
                 })
                    .catch(function(resp){

                    })
                }
            })
        }


    },
}
</script>