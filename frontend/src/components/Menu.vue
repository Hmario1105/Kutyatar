<template>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
      <router-link
        class="navbar-brand"
        to="/"
      >Főoldal</router-link>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div
        class="collapse navbar-collapse"
        id="navbarNavDropdown"
      >
        <ul class="navbar-nav">

          <!-- Kutyák Eseményei -->
          <li class="nav-item dropdown" v-if="loginAccessLevel == 2">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdownMenuLink"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Adatok feltöltése
            </a>
            <ul
              class="dropdown-menu"
              aria-labelledby="navbarDropdownMenuLink"
            >
              <li><router-link
                   :class="{'dropdown-item': true}"
                  to="/Kutyanaplo/Kutyanaplo/"
                >Kutyanapló hozzáadása</router-link></li>
              <li><router-link
                   :class="{'dropdown-item': true}"
                  to="/Kutyanaplo/Esemenyek/"
                >Esemény hozzáadása</router-link></li>
              <li><router-link
                   :class="{'dropdown-item': true}"
                  to="/Kutyanaplo/Kutyak/"
                >Kutyák hozzáadása</router-link></li>
              <li><router-link
                   :class="{'dropdown-item': true}"
                  to="/Kutyanaplo/Fajtak/"
                >Fajták hozzáadása</router-link></li>
              <li><router-link
                   :class="{'dropdown-item': true}"
                  to="/Kutyanaplo/Oltasok/"
                >Oltás hozzáadása</router-link></li>
            </ul>
          </li>

          <!-- KutyaCard -->
          <li class="nav-item">
            <router-link
              class="nav-link active"
              aria-current="page"
              to="/KutyaCard/"
            >Kutyák</router-link>
          </li>

					<!-- FajtakCard -->
          <li class="nav-item">
            <router-link
              class="nav-link"
              to="/FajtakCard/"
            >Fajták</router-link>
          </li>
          <!-- Login -->
          <li class="nav-item" v-if="loginAccessLevel == 0">
            <router-link class="nav-link active" aria-current="page" to="/Login/"
              >Bejelentkezés</router-link>
          </li>  

          <!-- Logout -->
          <li class="nav-item" v-if="loginAccessLevel > 0">
           <button class="btn nav-link " @click="Logout()">Kijelentkezés</button>
          </li>
        </ul>
      </div>
    </div>
  </nav>

</template>

<script>
const axios = require("axios").default;
axios.defaults.withCredentials = true;
export default {
    name: "Menu",
    props: ["userName"],
    computed: {
      loginAccessLevel(){
          return this.$root.$data.loginAccessLevel;
        } 
      },
    methods: {
    Logout() {
      let params = {
        query: "logoutUser",
      };
      axios
        .post(this.url, params)
        .then((res) => {
          console.log(res.data);
          this.$root.$data.loginAccessLevel = res.data.loginAccessLevel;
          // this.$root.$data.loginUserName = res.data.loginUserName;
          this.$root.$data.loginId = res.data.loginId;
          this.$root.$data.loginEmail = res.data.loginEmail;
          // let loginAccessLevel = res.data.loginAccessLevel;
          // let loginUserName = res.data.loginUserName;
          if(this.$root.name != "home") this.$router.push({ name: "home" });        
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
</style>