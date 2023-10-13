
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');


import router from './routes.js';
import VueRouter from 'vue-router';
import VueMoment from 'vue-moment';
import VueSwal from 'vue-swal';
import store from './store.js'
import Vue from 'vue';
import App from './App.vue'
import Spinner from 'vue-simple-spinner';

import Loading from 'vue-loading-overlay';
    // Import stylesheet
import 'vue-loading-overlay/dist/vue-loading.css';

import Datetime from 'vue-datetime';
// You need a specific loader for CSS files
import 'vue-datetime/dist/vue-datetime.css';
import {mapActions,mapGetters,mapState} from 'vuex';
import Permission from './pages/permission/get_list_user.js';

window.Vue = require('vue');
window.Vue.use(VueRouter);
window.Vue.use(VueMoment);
window.Vue.use(VueSwal);
window.Vue.use(Spinner);
window.Vue.use(Loading);
window.Vue.use(Datetime)


Vue.mixin(Permission);
Vue.component('vue-simple-spinner', require('vue-simple-spinner'));
Vue.component('vue-pagination', require('laravel-vue-pagination'));
Vue.component('loading', require('vue-loading-overlay'));
Vue.component('loading_overlay', require('vue-loading-overlay'));




new Vue({
    el: '#amp',
    router,
    store,
    components:{
        App,
    },
    computed:{
    	...mapGetters(['isAuth']),
    	...mapState(['token']),
    	...mapState('get_list_user',{
    		get_list_user : state=>state.get_list_user
    	}),
    },
    methods:{
    	...mapActions('application',['get_list_user'])
    },
    // watch:{
    // 	token() {
    //         this.initialLister()
    //     },
    //     user_authenticated() {
    //         this.initialLister()
    //     }
    // },
    created(){
    	if(this.isAuth){
    		this.get_list_user();
    	}
    }

});

