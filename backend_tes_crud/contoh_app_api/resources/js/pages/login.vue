<template>
<section class="login p-fixed d-flex text-center bg-primary common-img-bg">
    <!-- Container-fluid starts -->

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="login-card card-block">
                    <div class="text-center">
                        <img src="assets/images/logo_.png" alt="logo" width="300px"> 
                    </div>
                    
                    <form @submit="postLogin">
                        <div class="md-input-wrapper">
                            <input type="text" class="md-form-control" v-model="data.username" />
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                            <label>Username</label>
                            <p class="text-danger" v-if="errors.username">{{ errors.username[0] }}</p>
                        </div>
                        <div class="md-input-wrapper">
                            <input type="password" class="md-form-control" v-model="data.password" />
                            <label>Password</label>
                            <p class="text-danger" v-if="errors.password">{{ errors.username[0] }}</p>
                        </div>
                        <div class="alert alert-danger" v-if="errors.invalid">{{ errors.invalid }}</div>
                        <div class="row">
                            <div class="col-xs-10 offset-xs-1">
                                <button type="submit"  class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
                            </div>
                        </div>
                    </form>
                    <!-- <div class="card-footer"> -->
                    <div class="col-sm-12 col-xs-12 text-center">
                        <span class="text-muted">Forget Password?</span>
                        <a href="" class="text-right f-w-600"> Click Here</a>
                    </div>

                            <!-- </div> -->
                    <!-- end of form -->
                </div>
                <!-- end of login-card -->
            </div>
            <!-- end of col-sm-12 -->
        </div>
        <!-- end of row -->
    </div>
    <!-- end of container-fluid -->
</section>
</template>
<script type="text/javascript">
import { mapActions, mapMutations, mapGetters, mapState } from 'vuex';
export default {
    data() {
        return {
            data: {
                username: '',
                password: '',
            }
        }
    },
    created() {
        if (this.isAuth) 
        {
            document.location.href = "/";
        }
        else
        {
            this.$router.push({name:'login'});
        }
    },
    computed: {
        ...mapGetters(['isAuth']),
        ...mapState(['errors']),
    },
    methods: {
        ...mapActions('auth', ['submit']),
        ...mapActions('application', ['get_list_user']),
        ...mapMutations(['CLEAR_ERRORS']),
        postLogin(e) {
            e.preventDefault();
            this.submit(this.data).then(() => {
                if (this.isAuth) {
                    this.CLEAR_ERRORS()
                    this.$router.push({ name: 'home' })
                }
            })
        }
    },
    // destroyed(){
    //     var app = this;
    //     alert('tes');
    //     app.get_list_user();
    // }
}
</script>

