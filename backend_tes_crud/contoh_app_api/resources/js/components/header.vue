<!-- Navbar-->
<template>
    <header class="main-header-top hidden-print">
        <a href="index.html" class="logo"><img class="img-fluid able-logo" > Embun Pagi </a>
        <nav class="navbar navbar-static-top">
        <a href="#!" data-toggle="offcanvas" class="sidebar-toggle"></a>
            <!-- Navbar Right Menu-->
            <div class="navbar-custom-menu f-right">
                <ul class="top-nav">
                    <!--Notification Menu-->       
                            <!-- window screen -->
                    <li class="pc-rheader-submenu">
                        <a href="#!" class="drop icon-circle">
<!--                             <i class="icon-size-fullscreen"></i>
 -->                            
                          Tahun {{year}} {{step}}
                        </a>
                    </li>
                          
                      <!-- User Menu-->
                    <li class="dropdown">
                       <!--  <a href="#!" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle drop icon-circle drop-image">
                           Profil
                        </a> -->

                        <a href="javascript:void(0)" @click="logout"><i class="icon-logout"></i> Logout</a>
                        <!-- <ul class="dropdown-menu settings-menu">
                          <li><a href="#!"><i class="icon-settings"></i> Settings</a></li>
                          <li><a href="profile.html"><i class="icon-user"></i> Profile</a></li>
                          <li><a href="message.html"><i class="icon-envelope-open"></i> My Messages</a></li>
                          <li class="p-0">
                              <div class="dropdown-divider m-0"></div>
                          </li>
                          <li><a href="lock-screen.html"><i class="icon-lock"></i> Lock Screen</a></li>
                          <li><a href="javascript:void(0)" @click="logout"><i class="icon-logout"></i> Logout</a></li>
                        </ul> -->
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</template>
<script>
import axios  from './../api.js';

    export default {
      data:function(){
          return{
            year : '',
            step : '',
          }
      },
      created(){
            var app = this;
             axios.get('get_year_step_active')   
                .then(function(resp){
                    app.year = resp.data.year.unit_year_name;
                    app.step = resp.data.data.step_study_name;
                })
                .catch(function(error){
                    
                })      
      },
      methods: {
        logout() {
            return new Promise((resolve, reject) => {
                localStorage.removeItem('token')
                resolve()
            }).then(() => {
                this.$store.state.token = localStorage.getItem('token')
                this.$router.push('/login')
            })
        }
      }
    }
</script>
