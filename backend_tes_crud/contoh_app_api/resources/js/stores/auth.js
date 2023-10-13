import $axios from '../api.js'

const state = ()=>({

})

const mutations ={

}

const actions={
    submit({commit},payload){
        localStorage.setItem('token',null)
        commit('SET_TOKEN',null,{root:true})
        return new Promise((resolve,reject)=>{
            $axios.post('/auth/login',payload)
            .then((response)=>{

                if(response.data.access_token !=''){

              

                    localStorage.setItem('token',response.data.access_token)
                    localStorage.setItem('unit_id',response.data.unit_id)
                    localStorage.setItem('class_grade_id',response.data.class_grade_id)
                    localStorage.setItem('study_group_id',response.data.study_group_id)
                    localStorage.setItem('course_id',response.data.course_id)
                    localStorage.setItem('role_name',response.data.role_name)
                    localStorage.setItem('username',response.data.username)
                    commit('SET_TOKEN',response.data.access_token,{root:true})
                    
                }
                else{   
                    commit('SET_ERRORS',{invalid:'Username/Password Salah'},{root:true})
                }
                resolve(response.data)
            })
            .catch((error)=>{
                console.log(error);
                if(error.response.status == 401){
                    swal('Error','Username/Password Salah','error');
                }
                else
                {
                    swal('Error','Username/Password Salah','error');
                }
            })
        })
    }
}

export default{
    namespaced:true,
    state,
    actions,
    mutations
}
