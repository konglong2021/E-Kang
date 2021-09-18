<template>
  <div>
    <b-container class="bv-example-row">
      <b-row>
          <div class="col-lg-6 mx-auto login-form"> 
              <div class="mx-auto">
                  <center>
                <img src="/images/logo.png" width="150px"  />
                  </center>
              </div>
        <b-form @submit="onSubmit">
          <b-form-group
            id="input-group-1"
            label="Username:"
            label-for="input-1"
          >
            <b-form-input
              id="input-1"
              v-model="form.username"
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
              v-model="form.passwrod"
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
        name: "",
        food: null,
        checked: []
      },
      foods: [
        { text: "Select One", value: null },
        "Carrots",
        "Beans",
        "Tomatoes",
        "Corn"
      ],
      show: true
    };
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();
      alert(JSON.stringify(this.form));
    }
  }
};
</script>
<style  scoped>
.login-form {
    margin-top: 200px;
    background-color :#fff;
    padding: 20px;
    border-radius: 10px;
}
</style>
