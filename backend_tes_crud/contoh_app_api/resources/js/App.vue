<template>
    <div>
        <div v-if="isAuth">
            <div class="wrapper">
                <app-header/>
                <app-sidebar />    
                <div class="content-wrapper">
                    <div class="container-fluid">
                            <!-- Breadcrumb -->
                        <router-view></router-view>
                    </div>
                        <!-- Footer -->
                        <app-footer />
                </div>
            </div>
        </div>
        <div v-else>
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
    import { mapState, mapGetters } from 'vuex'
    import header from './components/header.vue'
    import footer from './components/footer.vue'
    import sidebar from './components/sidebar.vue'

    export default{
        computed: {
            ...mapState(['token']),
            ...mapGetters(['isAuth'])
        },
        components:{
            'app-header':header,
            'app-footer':footer,
            'app-sidebar':sidebar,
        }
    }
</script>

