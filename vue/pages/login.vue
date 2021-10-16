<template>
  <div>
    <b-container class="bv-example-row">
      <b-row>
          <div class="col-lg-6 mx-auto login-form">
              <div class="mx-auto">
                  <center><h2>Login</h2></center>
              </div>
        <b-form @submit.prevent="onSubmit">
          <b-form-group
            id="input-group-1"
            label="Username:"
            label-for="input-1"
          >
            <b-form-input
              id="input-1"
              v-model="form.email"
              placeholder="Username"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-2"
            label="Password:"
            label-for="input-2"
          >
            <b-form-input
              id="input-2"
              v-model="form.password"
              placeholder="Enter passwrod"
              type="password"
              required
            ></b-form-input>
          </b-form-group>



          <b-button type="submit" class="col-sm-12" variant="success"> Login </b-button>

        </b-form>

          </div>
      </b-row>
    </b-container>
  </div>
</template>
<script>
export default {
  layout: "main",
  data() {
    return {
      form: {
        email: "",
        password: "",
      },
      show: true
    };
  },
  methods: {
    async onSubmit(event) {
      let response = await this.$axios.post('/api/login', this.form);
      let token = response.data.Token;
      let user = response.data.user;
      await this.$store.commit('auth/setToken', token);
      await this.$store.commit('auth/updateUser', user);
      console.log("Login " + this.$store.getters['auth/token']);
      await this.$router.push('/');
    }
  },
  mounted(){
  }
};
</script>
<style  scoped>
.login-form {
    margin-top: 100px;
    background-color :#fff;
    padding: 20px;
    border-radius: 10px;
}
</style>
