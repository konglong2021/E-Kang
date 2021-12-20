<template>
  <div>
    <b-container class="bv-example-row">
      <b-row>
          <div class="col-lg-6 mx-auto login-form">
              <div class="mx-auto">
                  <center><h2>Login</h2></center>
              </div>
            <ValidationObserver v-slot="{ invalid }">
              <b-form @submit.prevent="onSubmit">
                <b-form-group id="input-group-1">
                  <b-form-input
                    id="input-1" v-model="form.email"
                    placeholder="Username" required focus
                  ></b-form-input>

                </b-form-group>

                <ValidationProvider
                  v-slot="{ errors }"
                  name="checkPassword"
                  rules="required">
                  <b-form-group id="input-group-2">
                    <b-form-input
                      id="input-2" v-model="form.password"
                      placeholder="Enter passwrod" type="password" required
                      :error-messages="errors"
                    ></b-form-input>
                    <span class="input-invalid-message" style="color: red;">
                        {{ errors[0] }}
                      </span>
                  </b-form-group>
                </ValidationProvider>

                <b-button type="submit" class="col-sm-12" variant="success"> Login </b-button>
              </b-form>
            </ValidationObserver>
          </div>
      </b-row>
    </b-container>
  </div>
</template>
<script>
import { ValidationObserver, ValidationProvider } from "vee-validate";
export default {
    components: {
      ValidationObserver: ValidationObserver,
      ValidationProvider: ValidationProvider
    },
  layout: "main",
  data() {
    return {
      form: {
        email: "",
        password: "",
      },
      show: true,
      isExist: false,
      loginUser : {},
    };
  },
  methods: {
    async onSubmit(event) {
      let response = await this.$axios.post('/api/login', this.form);
      if(response && response.hasOwnProperty("data")){
        let token = response.data.Token;
        let user = response.data.user;
        await this.$store.commit('auth/setToken', token);
        await this.$store.commit('auth/updateUser', user);
        await this.$router.push('/');
      }
      else {
        this.form.email = null;
        this.form.password = null;
        this.form.isFieldError = true;
      }
    },

  },
  mounted(){
    //this.form.email.focus();
  },
  checkPassword() {
    const that = this;
    clearTimeout(this.timeout);
    this.timeout = setTimeout(function() {
      that.$axios
        .post("/user", { password: that.form.password })
        .then(response => {
          that.isExist = response.data.isExist;
          if (that.isExist) {
          } else {
            error[0] ="text";

            // do something if username not exist
          }
        });
    }, 1400);
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
