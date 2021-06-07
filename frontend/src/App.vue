<template>
  <div
    id="app"
    class="container-xxl my-container p-0"
  >

    <Head></Head>
    <Menu
      :userName="userName"
      @changeUser="getUserName"
    ></Menu>

    <router-view @changeUser="getUserName"></router-view>

    <Footer></Footer>
  </div>
</template>

<script>
const axios = require("axios").default;
axios.defaults.withCredentials = true;
// import HelloWorld from './components/HelloWorld.vue'
import Head from "./components/Head.vue";
import Menu from "./components/Menu.vue";
import Footer from "./components/Footer.vue";

export default {
  name: "App",
  components: {
    Head,
    Menu,
    Footer,
  },
  data() {
    return {
      userName: null,
    };
  },
  created() {
    this.getUserName();
  },
  methods: {
    getUserName() {
      axios
        .get(this.url, {
          params: {
            query: "getUser",
          },
        })
        .then((res) => {
          this.userName = res.data.loginUserName;
          console.log("App.vue", res.data);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
  },
};
</script>

<style>
.container-xxl {
  max-width: 1200px !important;
}

/* .w3-theme-l5 {color:#000 !important; background-color:#fafff4 !important}
.w3-theme-l4 {color:#000 !important; background-color:#eefedb !important}
.w3-theme-l3 {color:#000 !important; background-color:#ddfcb6 !important}
.w3-theme-l2 {color:#000 !important; background-color:#ccfb92 !important}
.w3-theme-l1 {color:#000 !important; background-color:#bbfa6d !important}
.w3-theme-d1 {color:#000 !important; background-color:#9bf72a !important}
.w3-theme-d2 {color:#000 !important; background-color:#8cf60b !important}
.w3-theme-d3 {color:#000 !important; background-color:#7bd908 !important}
.w3-theme-d4 {color:#fff !important; background-color:#69ba07 !important}
.w3-theme-d5 {color:#fff !important; background-color:#589b06 !important}

.w3-theme-light {color:#000 !important; background-color:#fafff4 !important}
.w3-theme-dark {color:#fff !important; background-color:#589b06 !important}
.w3-theme-action {color:#fff !important; background-color:#589b06 !important}

.w3-theme {color:#000 !important; background-color:#a9f849 !important}
.w3-text-theme {color:#a9f849 !important}
.w3-theme-border {border-color:#a9f849 !important}
.w3-hover-theme:hover {color:#000 !important; background-color:#a9f849 !important} */


.w3-theme-l5 {color:#000 !important; background-color:#f9fef5 !important}
.w3-theme-l4 {color:#000 !important; background-color:#ebfcdc !important}
.w3-theme-l3 {color:#000 !important; background-color:#d7f9b9 !important}
.w3-theme-l2 {color:#000 !important; background-color:#c3f796 !important}
.w3-theme-l1 {color:#000 !important; background-color:#aff473 !important}
.w3-theme-d1 {color:#000 !important; background-color:#8aee33 !important}
.w3-theme-d2 {color:#000 !important; background-color:#79ec15 !important}
.w3-theme-d3 {color:#fff !important; background-color:#6ad011 !important}
.w3-theme-d4 {color:#fff !important; background-color:#5bb20e !important}
.w3-theme-d5 {color:#fff !important; background-color:#4c950c !important}

.w3-theme-light {color:#000 !important; background-color:#f9fef5 !important}
.w3-theme-dark {color:#fff !important; background-color:#4c950c !important}
.w3-theme-action {color:#fff !important; background-color:#4c950c !important}

.w3-theme {color:#000 !important; background-color:#9bf150 !important}
.w3-text-theme {color:#9bf150 !important}
.w3-theme-border {border-color:#9bf150 !important}
.w3-hover-theme:hover {color:#000 !important; background-color:#9bf150 !important}

</style>
