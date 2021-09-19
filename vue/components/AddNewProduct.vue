<template>
  <div class="container">
    <h3 class="text-center margin-bottom-20px content-header">New Product</h3>
    <b-button href="/product" variant="info"><i class="fa fa-backward"></i></b-button>
    <div class="content-form">
      <div class="alert-content" v-if="alert === true">
        <b-alert variant="success" show>Success Alert</b-alert>
      </div>
      <b-form @submit="onSubmit" @reset="onReset" v-if="show" enctype="multipart/form-data">
        <b-form-group id="input-group-enname" label="Product English Name:" label-for="input-enname">
          <b-form-input
            id="input-enname"
            v-model="form.en_name"
            placeholder="Enter name of product as English"
            required
          ></b-form-input>
        </b-form-group>
        <b-form-group id="input-group-khname" label="Product Khmer Name:" label-for="input-khname">
          <b-form-input
            id="input-khname"
            v-model="form.kh_name"
            placeholder="Enter name of product as Khmer"
            required
          ></b-form-input>
        </b-form-group>
        <b-form-group id="input-group-category" label="Category:" label-for="input-category">
          <b-form-select
            id="input-category"
            v-model="form.category"
            :options="categories"
            required
          ></b-form-select>
        </b-form-group>
        <b-form-group id="input-group-brand" label="Brand:" label-for="input-brand">
          <b-form-select
            id="input-brand"
            v-model="form.brand"
            :options="brands"
            required
          ></b-form-select>
        </b-form-group>
        <b-form-group id="input-group-description" label="Description:" label-for="input-description">
          <b-form-textarea
            id="input-description"
            v-model="form.description"
            required
          ></b-form-textarea>
        </b-form-group>
        <b-form-file v-on:change="onFileChange" plain></b-form-file>
        <div class="content-button">
          <b-button type="submit" variant="primary">Submit</b-button>
          <b-button type="reset" variant="danger">Reset</b-button>
        </div>
      </b-form>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        form: {
          en_name: '',
          kh_name: '',
          category: null,
          brand: null,
          description: '',
          image: null
        },
        categories: [{ text: 'Select One', value: null }, {text: 'Screen', value: 1}, {text: 'Headset', value: 2}, {text: 'chargers', value: 3}],
        brands: [{ text: 'Select One', value: null }, {text: 'Samsung', value: 1}, {text: 'PUB G', value: 2}],
        show: true,
        alert: false,
        filesAccumulated: []
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        let formData = new FormData();
        formData.append("en_name", this.form.en_name)
        formData.append("kh_name", this.form.kh_name)
        formData.append("category_id", this.form.category)
        formData.append("brands", this.form.brand)
        formData.append("description", this.form.description)
        formData.append("image", this.form.image)
        this.$axios.post('/api/product', formData)
          .then(function (response) {
            this.alert = true;
            console.log(response);
          })
          .catch(function (error) {
            console.log(error);
          });
      },
      onReset(event) {
        event.preventDefault()
        // Reset our form values
        this.form.en_name = ''
        this.form.kh_name = ''
        this.form.category = null
        this.form.description = ''
        this.form.files = null
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      },
      onFileChange($event) {
        console.log($event);
        this.form.image = $event.target.files[0];
      },
    },
    mounted() {
    }
  }
</script>
<style scoped>
  .margin-bottom-20px{
    margin-bottom: 20px;
  }
  .content-button{
    margin-top: 15px;
  }
  .content-header{
    width: 96%;
    float: right;
    display: inline-block;
  }
  .content-form{
    display: inline-block;
    width: 100%;
  }
</style>
