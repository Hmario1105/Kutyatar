import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'

import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import "bootstrap-icons/font/bootstrap-icons.css"

const axios = require("axios").default;
axios.defaults.withCredentials = true;

//route konfiguráció importálása
import RouteConfig from './config/routes.js'

//route indítása
const router = new VueRouter({
    routes: RouteConfig
});

router.beforeEach((to, from, next)=>{
    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (router.app.$root.loginAccessLevel == 0) {
            // console.log("If ág");
            next({
                name: 'Login'
            });
        } else {
            // console.log("Else ág");
            next();
        }
    } else next();
});

//A VueResource, VueRouter használatba vétele
Vue.use(VueRouter);


Vue.config.productionTip = false

Vue.mixin({
    data(){
        return{
            url: "http://localhost/Kutyatár/backend/index.php"
        }
    }
});

new Vue({
    router: router,
    render: h => h(App),
    data: {
        loginAccessLevel: 0,
        loginId: 0,
        loginEmail: null,
        // loginUserName: null,
    },
    created() {
        this.getUser();
    },
    methods: {
        getUser() {
            axios
                .get(this.url, {
                    params: {
                        query: "getUser",
                    },
                })
                .then((res) => {
                    this.loginAccessLevel = res.data.loginAccessLevel;
                    // this.loginUserName = res.data.loginUserName;
                    this.loginId = res.data.loginId;
                    this.loginEmail = res.data.loginEmail;
                }).catch(function (error) {
                    // handle error
                    console.log(error);
                });
        }
    }
}).$mount('#app')