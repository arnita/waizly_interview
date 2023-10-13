<template>
<div>
    <!-- Header Starts -->
    <div class="row">
        <div class="col-sm-12 p-0">
            <div class="main-header">
                <h4>Tambah Siswa</h4>
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                    
                    <li class="breadcrumb-item"> <router-link :to="{name:'home'}"><i class="icofont icofont-home"></i> Home  </router-link> 
                    </li>
                    <li class="breadcrumb-item"> <router-link to="/student">  Siswa </router-link>
                    </li>
                    <li class="breadcrumb-item"> Tambah Siswa
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
                    <h5 class="card-header-text">Data Siswa</h5>
                </div>
                 
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">


                        <div class="card-block">
                            <div class="row">
                                <div class="sub-title"> 
                                    <h4 class="card-header-text"> Akses Siswa </h4>
                                </div>               
                                <div class="col-sm-12 table-responsive">
                                    <div class="col-md-6">

                                        <div class="form-group row" :class="{'has-danger':errors.username}">
                                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Username  </label>
                                            <div class="col-sm-8">
                                                <input class="form-control " name="username" placeholder='Terisi Otomatis Disaat di buat' readonly type="text" value=""  v-model="student.username">
                                                <div class="form-control-feedback" v-if="errors.username">{{errors.username[0]}}</div>
                                            </div>
                                        </div>



                                        <div class="form-group row" :class="{'has-danger':errors.password}">
                                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Password   </label>
                                            <div class="col-sm-8">
                                                <input class="form-control " name="password" placeholder='Terisi otomatis disaat dibuat' type="text" readonly  v-model="student.password">
                                                <div class="form-control-feedback" v-if="errors.password">{{errors.password[0]}}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">

                                        <div class="form-group row" :class="{'has-danger':errors.student_status}">
                                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Status <span class="form-mandatory">*</span> </label>
                                            <div class="col-sm-8">
                                                <select name="student_status" ref="student_status" id="student_status" class="form-control" v-model="student.student_status">
                                                    <option value=""> - Pilih Status  - </option>
                                                    <option value="active"> Aktif </option>
                                                    <option value="deactive"> Tidak Aktif </option>
                                                </select>
                                                <!-- <input class="form-control " name="student_status" type="text"    v-model="student.student_status"> -->
                                                <div class="form-control-feedback" v-if="errors.student_status">{{errors.student_status[0]}}</div>
                                            </div>
                                        </div>

                                        <div class="form-group row" :class="{'has-danger':errors.student_id_card}">
                                            <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  ID Siswa </label>
                                            <div class="col-sm-8">
                                                <input class="form-control"  name="student_id_card" type="text" placeholder='Terisi otomatis disaat di buat' readonly   v-model="student.student_id_card">
                                                <div class="form-control-feedback" v-if="errors.student_id_card">{{errors.student_id_card[0]}}</div>
                                            </div>
                                        </div>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sub-title"> 
                            <h4 class="card-header-text"> Data Siswa  </h4>
                        </div> 
                    
                        <div class="col-md-6">
                            <div class="form-group row" :class="{'has-danger':errors.student_name}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Nama Siswa <span class="form-mandatory">*</span> </label>
                                <div class="col-sm-8">
                                    <input class="form-control " name="student_name" placeholder='Nama Siswa' type="text" value=""  v-model="student.student_name">
                                    <div class="form-control-feedback" v-if="errors.student_name">{{errors.student_name[0]}}</div>
                                </div>
                            </div>



                            <div class="form-group row" :class="{'has-danger':errors.student_nisn}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Nisn Siswa <span class="form-mandatory">*</span>   </label>
                                <div class="col-sm-8">
                                    <input class="form-control " name="student_nisn" placeholder='Nisn Siswa' type="text"  v-model="student.student_nisn">
                                    <div class="form-control-feedback" v-if="errors.student_nisn">{{errors.student_nisn[0]}}</div>
                                </div>
                            </div>


                            <div class="form-group row" :class="{'has-danger':errors.student_gender}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Jenis Kelamin <span class="form-mandatory">*</span>  </label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="gender" name="gender" v-model="student.student_gender">
                                        <option value=""> - Pilih Jenis Kelamin - </option>
                                        <option  v-for="(item, index) in gender.data " :key="index" :value="item.value"> {{item.name}} </option>
                                    </select>
                                    <div class="form-control-feedback" v-if="errors.student_gender">{{errors.student_gender[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.unit_id}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Unit  <span class="form-mandatory">*</span> </label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="unit_id" @change="get_class_($event)" name="unit_id" v-model="student.unit_id">
                                        <option value=""> - Pilih Unit - </option>
                                        <option  v-for="(item, index) in unit.data " :key="index" :value="item.unit_id"> {{item.unit_name}} </option>
                                    </select>
                                    <div class="form-control-feedback" v-if="errors.unit_id">{{errors.unit_id[0]}}</div>
                                </div>
                            </div>                                

                            <div class="form-group row" :class="{'has-danger':errors.class_grade_id}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Tingkat Kelas  <span class="form-mandatory">*</span> </label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="class_grade_id" name="class_grade_id" v-model="student.class_grade_id">
                                        <option value="" v-if="list_class_grade.data"> - Pilih Kelas - </option>
                                        <option  v-for="(item, index) in list_class_grade.data " :key="index" :value="item.class_grade_id"> {{item.class_grade_name}} </option>
                                    </select>
                                    <div class="form-control-feedback" v-if="errors.class_grade_id">{{errors.class_grade_id[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.student_birth_place}">
                                <label for="example-email-input" class="col-xs-4 col-form-label form-control-label">Tempat Lahir  </label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" placeholder='Tempat Lahir'  name="student_birth_place" v-model="student.student_birth_place">
                                    <div class="form-control-feedback" v-if="errors.student_birth_place">{{errors.student_birth_place[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.student_desc}">
                                <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Keterangan </label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value=""  placeholder='Keterangan' name="student_desc" v-model="student.student_desc">
                                    <div class="form-control-feedback" v-if="errors.student_desc">{{errors.student_desc[0]}}</div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">

                            <div class="form-group row" :class="{'has-danger':errors.student_birth_date}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Tanggal Lahir</label>
                                <div class="col-sm-8">
                                    <datetime v-model="student.student_birth_date"   format="dd-MM-yyyy"  input-class="form-control"></datetime>
                                    <div class="form-control-feedback" v-if="errors.student_birth_date">{{errors.student_birth_date[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.student_religion}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Agama <span class="form-mandatory">*</span>   </label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="student_religion" name="student_religion" v-model="student.student_religion">
                                        <option value=""> - Pilih Agama - </option>
                                        <option  v-for="(item, index) in religion.data " :key="index" :value="item.value"> {{item.name}} </option>
                                    </select>
                                    <div class="form-control-feedback" v-if="errors.student_religion">{{errors.student_religion[0]}}</div>
                                </div>
                            </div>


                            <div class="form-group row" :class="{'has-danger':errors.student_hp}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  No Hp </label>
                                <div class="col-sm-8">
                                    <input class="form-control " name="student_hp" type="text" placeholder='No Hp'  v-model="student.student_hp">
                                    <div class="form-control-feedback" v-if="errors.student_hp">{{errors.student_hp[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.student_email}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">Email Siswa   </label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value=""  placeholder='Email Siswa' name="student_address" v-model="student.student_email">
                                    <div class="form-control-feedback" v-if="errors.student_email">{{errors.student_email[0]}}</div>
                                </div>
                            </div>                                
                        
                            <div class="form-group row" :class="{'has-danger':errors.student_telp}">
                                <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> No Telepon   </label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value=""  placeholder='No Telepon' name="student_address" v-model="student.student_telp">
                                    <div class="form-control-feedback" v-if="errors.student_telp">{{errors.student_telp[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.student_address}">
                                <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Alamat </label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value=""  placeholder='Alamat' name="student_address" v-model="student.student_address">
                                    <div class="form-control-feedback" v-if="errors.student_address">{{errors.student_address[0]}}</div>
                                </div>
                            </div>

                            <div class="form-group row" :class="{'has-danger':errors.student_photo}">
                                <label for="example-email-input" class="col-xs-4 col-form-label form-control-label"> Foto Siswa </label>
                                <div class="col-sm-8">
                                    <div v-if="!student.student_photo">
                                        <input type="file" @change="avatarChange" name="">
                                    </div>
                                    <div v-else>
                                            <img :src="student.student_photo" width="100" height="100">
                                            <button @click="removeImage" type="button" class="btn btn-warning"> <i class="fa fa-trash"></i> </button>
                                        
                                    </div>
                                    <div class="form-control-feedback" v-if="errors.student_photo">{{errors.student_photo[0]}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="card-block">
                    <div class="row">
                        <div class="sub-title"> 
                            <h4 class="card-header-text"> Data Pribadi Siswa </h4>
                        </div>               
                        <div class="col-sm-12 table-responsive">
                            <div class="col-md-6">

                                <div class="form-group row" :class="{'has-danger':errors.child_to}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Siswa Anak Anak Ke-  </label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="child_to" placeholder='Siswa Anak Ke -' type="text" value=""  v-model="student.child_to">
                                        <div class="form-control-feedback" v-if="errors.child_to">{{errors.child_to[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.studen_tall}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Tinggi Badan Siswa   </label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="studen_tall" placeholder='Tinggi Badan' type="text"  v-model="student.studen_tall">
                                        <div class="form-control-feedback" v-if="errors.studen_tall">{{errors.studen_tall[0]}}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">

                                <div class="form-group row" :class="{'has-danger':errors.student_hobby}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label"> Hobi Siswa</label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="student_hobby" type="text" placeholder='Hobi Siswa'  v-model="student.student_hobby">
                                        <div class="form-control-feedback" v-if="errors.student_hobby">{{errors.student_hobby[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.student_weight}">
                                    <label for="example-text-input" class="col-xs-4 col-form-label form-control-label">  Berat Badan Siswa </label>
                                    <div class="col-sm-8">
                                        <input class="form-control " name="student_weight" type="text" placeholder='Berat Badan Siswa'   v-model="student.student_weight">
                                        <div class="form-control-feedback" v-if="errors.student_weight">{{errors.student_weight[0]}}</div>
                                    </div>
                                </div>

                                <div class="form-group row" :class="{'has-danger':errors.student_blood_type}">
                                    <label for="example-email-input" class="col-xs-4 col-form-label form-control-label">Golongan Darah  </label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type="text" placeholder='Golongan Darah'  name="student_blood_type" v-model="student.student_blood_type">
                                        <div class="form-control-feedback" v-if="errors.student_blood_type">{{errors.student_blood_type[0]}}</div>
                                    </div>
                                </div>
                            
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <center>
                            <button type="submit" class="btn btn-primary m-r-30" @click="submit" >Simpan</button>
                            <router-link to="/student" class="btn btn-default m-r-30">  Batal </router-link>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        
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
            list_gender : [],
            student:{
                unit_id:'',
                password:'',
                username:'',
                class_grade_id:'',
                student_id_card:'',
                student_name:'',
                student_status:'',
                student_nickname:'',
                student_gender:'',
                student_birth_place:'',
                student_birth_date:'',
                student_address:'',
                student_hp:'',
                student_telp:'',
                student_email:'',
                student_father_hp:'',
                student_mother_hp:'',
                student_child_to:'',
                student_brother:'',
                student_child_status:'',
                student_photo:'',
                student_hobby:'',
                student_orphan_status:'',
                student_school_origin:'',
                student_school_origin_address:'',
                student_nisn:'',
                student_test_number:'',
                student_achievement:'',
                student_tall:'',
                student_weight:'',
                student_blood_type:'',
                student_religion:'',
                student_kk:'',
                student_ktp:'',
                student_ijazah:'',
                student_mother_name:'',
                student_father_name:'',
                student_mother_job:'',
                student_father_job:'',
                student_father_income:'',
                student_mother_income:'',
                },   
            }
        },
     
        created(){
            this.get_unit();
            this.get_gender();
            this.get_religion();
        },
        computed:{
            ...mapState('application', {
                unit:state=>state.unit,
                class_grade:state=>state.class_grade,
                gender:state=>state.gender,
                religion:state=>state.religion,
            }),
        },
        methods:{
            ...mapActions('application',['get_unit','get_class_grade','get_gender','get_religion']),
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
					app.student.student_photo = e.target.result;
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
					app.student.student_photo = e.target.result;
				}
				reader.readAsDataURL(file);
			},
			removeImage(){
				this.student.student_photo = '';
			},

            /** =============== */


            clear_form(){
                this.student.unit_id='';
                this.student.password='';
                this.student.username='';
                this.student.student_id_card='';
                this.student.class_grade_id='';
                this.student.student_name='';
                this.student.student_status='';
                this.student.student_nickname='';
                this.student.student_gender='';
                this.student.student_birth_place='';
                this.student.student_birth_date='';
                this.student.student_address='';
                this.student.student_hp='';
                this.student.student_telp='';
                this.student.student_email='';
                this.student.student_father_hp='';
                this.student.student_mother_hp='';
                this.student.student_child_to='';
                this.student.student_brother='';
                this.student.student_child_status='';
                this.student.student_photo='';
                this.student.student_hobby='';
                this.student.student_orphan_status='';
                this.student.student_school_origin='';
                this.student.student_school_origin_address='';
                this.student.student_nisn='';
                this.student.student_test_number='';
                this.student.student_achievement='';
                this.student.student_tall='';
                this.student.student_weight='';
                this.student.student_blood_type='';
                this.student.student_religion='';
                this.student.student_kk='';
                this.student.student_ktp='';
                this.student.student_ijazah='';
                this.student.student_mother_name='';
                this.student.student_father_name='';
                this.student.student_mother_job='';
                this.student.student_father_job='';
                this.student.student_father_income='';
                this.student.student_mother_income='';
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
                return new Promise((resolve,reject)=>{
                    $axios.post(`/student`,this.student).then(function(resp){
                        swal('Success','Simpan data berhasil','success');
                        app.clear_form();
                        app.$router.push('/student');
                    }).catch(function(resp){
                        app.errors = resp.response.data.errors;
                        // var input = '[name=' + value.param + ']';
                        // $('#student_status').focus();
                    })
                })
                
            },
            

        },
    }
</script>