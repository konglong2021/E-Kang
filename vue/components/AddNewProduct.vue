<template>
    <div class="bv-example-row container-fluid content-product">
      <div class="control-panel">
        <div class="panel-top">
          <div class="content-panel-left">
            <h6 class="text-info font-size-24 font-weight-bold">ទំនិញ/បង្កើតថ្មី</h6>
            <b-button href="/product" variant="info" class="margin-right-20">ត្រលប់</b-button>
          </div>
          <div class="panel-bottom"></div>
        </div>
      </div>
      <div class="container-list container">
        <b-card no-body >
          <b-tabs card class="box-shadow full-height">
            <b-tab title="ពត៍មានទូទៅទំនិញ" class="content-tab" active>
              <div class="content-form">
                <b-form v-if="show" enctype="multipart/form-data">
                  <div class="full-content">
                    <div class="options" style="display: none;">
                      <b-form-checkbox id="is-purchase" name="is-purchase" value="is_purchase" v-model="is_purchases" unchecked-value="not_purchase">ទំនិញនាំចូល</b-form-checkbox>
                    </div>
                    <div class="content-file-upload">
                      <b-form-file id="file" name="file" class="input-file" v-on:change="onFileChange" plain></b-form-file>
                      <div id="output" v-if="uploadFile" class="img" :style="{ backgroundImage: `url('${file}')` }"></div>
                      <div v-if="!uploadFile" class="img" :style="{ backgroundImage: `url('images/image.png')` }"></div>
                    </div>
                  </div>
                  <div class="full-content">
                    <b-row class="my-1">
                      <b-col sm="2"><label :for="'input-enname'" class="label-input">ឈ្មោះទំនិញជាអង់គ្លេស</label></b-col>
                      <b-col sm="4"><b-form-input :id="'input-enname'" type="text" v-model="form.en_name" class="input-content"></b-form-input></b-col>
                      <b-col sm="2"><label :for="'input-khname'" class="label-input">ឈ្មោះទំនិញជាខ្មែរ</label></b-col>
                      <b-col sm="4"><b-form-input :id="'input-khname'" type="text" v-model="form.kh_name" class="input-content"></b-form-input></b-col>
                    </b-row>
                    <b-row class="my-1">
                      <b-col sm="2"><label :for="'input-category'" class="label-input">ប្រភេទទំនិញ</label></b-col>
                      <b-col sm="4"><b-form-select :id="'input-category'" class="form-control input-content" v-model="form.category" :options="categories"></b-form-select></b-col>
                      <b-col sm="2"><label :for="'input-brand'" class="label-input">ប្រេនទំនិញ</label></b-col>
                      <b-col sm="4"><b-form-select :id="'input-brand'" class="form-control input-content" v-model="form.brand" :options="brands"></b-form-select></b-col>
                    </b-row>
                    <b-row class="my-1">
                      <b-col sm="2"><label :for="'input-sale_price'" class="label-input">តម្លៃលក់ ($)</label></b-col>
                      <b-col sm="4"><b-form-input :id="'input-sale_price'" type="number" class="input-content" v-model="form.sale_price"></b-form-input></b-col>
                      <b-col sm="2"><label :for="'input-description'" class="label-input">ការពិពណ៌នា</label></b-col>
                      <b-col sm="4"><b-form-textarea :id="'input-description'" class="input-content" v-model="form.description"></b-form-textarea></b-col>
                    </b-row>
                    <b-row class="my-1">
                      <b-col sm="2">
                      </b-col>
                      <b-col sm="4">
                        <b-button type="submit" variant="primary" class="margin-right-20" @click="onSubmit">រក្សាទុក</b-button>
                        <b-button type="reset" variant="danger" class="margin-right-20" @click="onReset">បោះបង់</b-button>
                      </b-col>
                    </b-row>
                  </div>
                </b-form>
              </div>
            </b-tab>
          </b-tabs>
        </b-card>
      </div>
    </div>

</template>

<script>
  export default {
    data() {
      return {
        is_purchases: false,
        product: {},
        form: {
          en_name: '',
          kh_name: '',
          category: null,
          brand: null,
          description: '',
          image: null,
          sale_price: 0,
          code: null,

        },

        categories: [{ text: 'Select One', value: null }, {text: 'Screen', value: 1}, {text: 'Headset', value: 2}, {text: 'chargers', value: 3}],
        brands: [{ text: 'Select One', value: null }, {text: 'Samsung', value: 1}, {text: 'PUB G', value: 2}],
        warehouses: [{ text: 'Select One', value: null }, {text: 'A', value: 1}, {text: 'B', value: 2}],
        suppliers: [{ text: 'Select One', value: null }, {text: 'A', value: 1}, {text: 'B', value: 2}],
        show: true,
        uploadFile: null,
        file: null,
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault();
        let formData = new FormData();
        formData.append("en_name", this.form.en_name);
        formData.append("kh_name", this.form.kh_name);
        formData.append("category_id", this.form.category);
        formData.append("brands", this.form.brand);
        formData.append("description", this.form.description);
        formData.append("image", this.uploadFile);

        if(this.is_purchases === 'not_purchase'){
          this.$axios.post('/api/product', formData)
            .then(function (response) {
              console.log(response);
            })
            .catch(function (error) {
              console.log(error);
            });
        }
        else if(this.is_purchases === 'is_purchase'){
          formData.append("warehouse", this.purchases.warehouse);
          formData.append("supplier", this.purchases.supplier);
          formData.append("import_date", this.purchases.import_date);
          formData.append("import_price", this.purchases.import_price);
          formData.append("quantity", this.purchases.quantity);
          formData.append("vat", this.purchases.vat)
          this.$axios.post('/api/product', formData)
            .then(function (response) {
              console.log(response);
            })
            .catch(function (error) {
              console.log(error);
          });
        }
      },
      onReset(event) {
        event.preventDefault();
        // Reset our form values
        this.form.en_name = '';
        this.form.kh_name = '';
        this.form.category = null;
        this.form.description = '';
        this.form.brand = null;
        this.form.image = null;
        this.form.sale_price= 0;
        this.form.code= null;

        /*this.purchases.warehouse = '';
        this.purchases.supplier = '';
        this.purchases.import_date = null;
        this.purchases.import_price = 0;
        this.purchases.quantity = 0;
        this.purchases.vat = 0;*/
        // Trick to reset/clear native browser form validation state
        this.show = false;
        this.is_purchases = null;

        this.$nextTick(() => {
          this.show = true
        })
      },
      onFileChange($event) {
        this.uploadFile = $event.target.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById("output").setAttribute("style","background-image: url(" + e.target.result + ')');
        };
        reader.readAsDataURL($event.target.files[0]);
      },
      async onGetProductItem(productId) {
        try {
          const response = await this.$axios.get('/api/product/' + productId);
          if(response.data.data){
            this.form.en_name = response.data.data["en_name"];
            this.form.kh_name = response.data.data["kh_name"];
            this.form.description = response.data.data["description"];
            this.form.category = response.data.data["category_id"];
          }
        } catch (error) {
          console.log(error);
        }
      },
    },
    async mounted() {
      if(this.$route.params.productId !== null && this.$route.params.productId !== undefined){
        this.onGetProductItem(this.$route.params.productId);
      }
    }
  }
</script>

<style scoped>
  .content-product{
    font-family: "Khmer OS Bokor" ;
  }

  .content-product .control-panel{
    border-bottom: 1px solid #cccccc;
    display: inline-block;
    margin-bottom: 5px;
    margin-top: 10px;
    /*min-height: 85px;*/
    width: 100%;
  }
  .content-product .control-panel .panel-top{
    display: inline-block;
    width: 100%;
  }
  .content-product .control-panel .panel-top .content-panel-left{
    display: inline-block;
    width: 50%;
    float: left;
  }

  .container-list{
    font-family: "Khmer OS Bokor";
  }

  .box-shadow{
    box-shadow: 0 5px 20px -15px black;
  }
  .full-height {
    min-height: calc(100vh - 160px);
  }

  .margin-right-20{
    margin-right: 20px;
  }

  .content-form{
    display: inline-block;
    margin: 0 15px;
    width: calc(100% - 30px);
    font-family: "Khmer OS Bokor";
  }
  .label-input{
    padding-top: 21px;
    margin-bottom: 0;
    padding-bottom: 0;
    font-size: 14px;
    display: inline-block;

  }
  .input-content{
    border-bottom: #ced4da solid 1px;
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
  }
  .input-content:focus{
    outline: none;
    box-shadow: none;
  }

  .content-file-upload{
    display: inline-block;
    position: relative;
    overflow: hidden;
    float: right;
    width: 90px;
    height: 90px;
    margin: 0;
    padding: 0;
  }
  .content-file-upload:hover{
    cursor: pointer;
  }
  .content-file-upload .img{
    width: 90px;
    height: 90px;
    background-repeat: round;
  }
  .content-file-upload .input-file{
    display: inline-block;
    position: absolute;
    cursor: pointer;
    height: 100%;
    width: 100%;
    opacity: 0;
    bottom: 0;
    right: 0;
  }

</style>
