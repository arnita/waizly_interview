import store from '../../store.js';
export default {
    methods: {
        $can(permissionName) {
            // console.log(this.$store.state.application.user_list_menu);
            var Permission  = this.$store.state.application.user_list_menu.permission;
            // let Permission = store.state.list_user.permission
            // console.log('arief');
            // console.log('arief');
            // console.log('arief');
            // console.log('arief');
            // alert('tes');
            // console.log(Permission);
            if (typeof Permission != 'undefined') {
                return Permission.indexOf(permissionName) !== -1;
            }
        },
    },
};