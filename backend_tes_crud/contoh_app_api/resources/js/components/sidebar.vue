<template>
<!-- Side-Nav-->
<div class="main-sidebar hidden-print">
    <section class="sidebar" id="sidebar-scroll">
        
        <div class="user-panel">
            <!-- <div class="f-left image"><img src="/assets/images/avatar-1.png" alt="User Image" class="img-circle"></div> -->
            <div class="f-left info">
                <p>{{username}}</p>
                <p class="designation"> {{role_name}} <i class="icofont icofont-caret-down m-l-5"></i></p>
            </div>
        </div>
        <!-- sidebar profile Menu-->
        <ul class="nav sidebar-menu extra-profile-list">
            <li>
                <router-link :to="{name:'employee.edit_profile'}" class="waves-effect waves-dark" >
                     <i class="icon-user"></i>
                        <span class="menu-text">View Profile</span>
                        <span class="selected"></span>
                </router-link>
            </li>
        
            <li>
                <a href="javascript:void(0)" @click="logout"><i class="icon-logout"></i> Logout</a>
<!-- 
                <a class="waves-effect waves-dark" href="javascript:void(0)">
                    <i class="icon-logout"></i>
                    <span class="menu-text">Logout</span>
                    <span class="selected"></span>
                </a> -->
            </li>
        </ul>
        <!-- Sidebar Menu-->
        <ul class="sidebar-menu">
                <template v-for=" value,i in menu_parent" >
                    <li class="treeview" @click="activate(value.menu_url)" :class="{ active : active_el == value.menu_url }">
                        <router-link :to="`/${value.menu_url}`" exact-active-class="waves-effect waves-dark" > <i class="icon-book-open"> </i>  {{value.menu_name}}</router-link>
                    </li>
                </template>

            
            <li v-for=" val,index in menu" class="treeview ">
                <a class="waves-effect waves-dark" href="#!">
                    <i class="icon-book-open"></i><span> {{index}}  </span><i class="icon-arrow-down"></i>
                </a>
                <ul class="treeview-menu"  style="display: none;">
                    <li v-for=" sub,i in val" @click="activate(i)" :class="{ active : active_el == i }" >
                     <router-link :to="`/${i}`" exact-active-class="waves-effect waves-dark" > {{sub}} </router-link>
                    </li>    
                </ul>
            </li>
        </ul>
    </section>
</div>
</template>
<script>

import axios  from './../api.js';


export default {
        data:function(){
            return {
                data_menu_parent:[],
                data_menu_sub:[],
                menu:[],
                username:localStorage.getItem('username'),
                role_name:localStorage.getItem('role_name'),
                active_el:'',
                menu_parent:[],
                questions: [
                  ['test1.1', 'test1.2'],
                  ['test2.1', 'test2.2']
                ]
            }
        },
        created(){
            var app = this;
             axios.get('get_menu_parent')   
                .then(function(resp){
                    app.menu = resp.data.data;

                })
            axios.get('get_menu')   
            .then(function(response){
                // console.log(response)
                app.menu_parent = response.data.data;
            })  
        },
        methods:{
            logout() {
                return new Promise((resolve, reject) => {
                    localStorage.removeItem('token')
                    resolve()
                }).then(() => {
                    this.$store.state.token = localStorage.getItem('token')
                    this.$router.push('/login')
                })
            },
            get_url(p){
                return p.split('-');
            },
            activate:function(el){
                    this.active_el = el;
            }
        }
    }
</script>
