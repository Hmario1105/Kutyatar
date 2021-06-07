<template>
<div>
  <div class="m-5">
    <h1 class="mb-5">Bejelentkezés</h1>
    <form
      class="row g-3 needs-validation"
      novalidate
    >
      <div class="row p-2">
        <label
          for="email"
          class="col-sm-1 col-form-label"
        >Email</label>
        <div class="col-sm-4">
          <input
            type="text"
            class="form-control"
            id="email"
            value="admin@ab.hu"
            v-model="email"
            required
          >
          <div class="invalid-feedback">
            Az email kötelező.
          </div>

        </div>
      </div>
      <div class="row p-2">
        <label
          for="password"
          class="col-sm-1 col-form-label"
        >Password</label>
        <div class="col-sm-4">
          <input
            type="password"
            class="form-control"
            id="password"
            v-model="password"
            required
          >
          <div class="invalid-feedback">
            A jelszó kötelező.
          </div>
        </div>
      </div>
      <div id="butt" class="row p-2">
        <div class="col-auto">
          <button
            type="submit"
            class="btn btn-primary mb-3"
            @click.prevent="onClickLogin"
          >Login</button>
        </div>
      </div>
    </form>
  </div>
  </div>
</template>

<script>
const axios = require("axios").default;
axios.defaults.withCredentials = true;
export default {
  name: "Home",
  data() {
    return {
      email: null,
      password: null,
      form: null,
    };
  },
  mounted() {
    this.form = document.querySelector(".needs-validation");
  },
  methods: {
    onClickLogin() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        //jó kitöltöttség
        this.loginUser();
      }
    },
    loginUser() {
      let params = {
        query: "loginUser",
        email: this.email,
        password: this.password,
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
          if (
            this.$root.$data.loginAccessLevel > 0 
          ) {
            //redirect főoldal
            this.$router.push({ name: "home" });
          } else {
              alert("helytelen email vagy jelszó")
          }
          this.$emit("changeUser");
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