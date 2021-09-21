<template>
    <div>
      <b-modal id="modal-create-product" size="md"
               @hidden="onReset" cancel-title="បោះបង់"
               @ok="onSubmit" ok-title="រក្សាទុក" title="បង្កើតទំនិញថ្មី">
        <b-form enctype="multipart/form-data">
          <div class="full-content">
          </div>
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-enname'" class="label-input">ឈ្មោះទំនិញជាអង់គ្លេស</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-enname'" type="text" v-model="product.en_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-khname'" class="label-input">ឈ្មោះទំនិញជាខ្មែរ</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-khname'" type="text" v-model="product.kh_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-category'" class="label-input">ប្រភេទទំនិញ</label></b-col>
              <b-col sm="8"><b-form-select :id="'input-category'" class="form-control input-content" v-model="product.category" :options="categories"></b-form-select></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-brand'" class="label-input">ប្រេនទំនិញ</label></b-col>
              <b-col sm="8"><b-form-select :id="'input-brand'" class="form-control input-content" v-model="product.brand" :options="brands"></b-form-select></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-sale_price'" class="label-input">តម្លៃលក់</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-sale_price'" type="number" class="input-content" v-model="product.sale_price"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-description'" class="label-input">ការពិពណ៌នា</label></b-col>
              <b-col sm="8"><b-form-textarea :id="'input-description'" class="input-content" v-model="product.description"></b-form-textarea></b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
    </div>
</template>

<script>
  export default {
    data() {
      return {
        product: {
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
      };
    },
    methods: {
      onSubmit(event) {
        event.preventDefault();
        let formData = new FormData();
        formData.append("en_name", this.product.en_name);
        formData.append("kh_name", this.product.kh_name);
        formData.append("category_id", this.product.category);
        formData.append("brands", this.product.brand);
        formData.append("description", this.product.description);
        formData.append("image", this.product.image);

        this.$axios.post('/api/product', formData)
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            console.log(error);
          });
      },
      onReset(event) {
        event.preventDefault();
        // Reset our form values
        this.product.en_name = '';
        this.product.kh_name = '';
        this.product.category = null;
        this.product.description = '';
        this.product.brand = null;
        this.product.image = null;
        this.product.sale_price= 0;
        this.product.code= null;
      },
    }
  }
</script>

<style>
  .content-product-input{
    max-width: 20%;
    margin-bottom: 25px;
  }
  .content-product-input .input-icon{
    background-color: #fff;
    border: 1px solid #ced4da;
    line-height: 1.8;
    padding: 0 12px;
    font-size: 22px;
    cursor: pointer;
  }
  .content-product-input .icon-background{
    background-color: #f8f9fa;
  }
  .content-product-input .icon-no-border-left-right{
    border-left: none;
    border-right: none;
  }
  .content-product-input .input-icon-left{
    border-right: none;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
  }
 .content-product-input .input-icon-right{
    border-left: none;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
  }
  .content-product-input .input-content-search{
    border-top: 1px solid #ced4da;
    border-bottom: 1px solid #ced4da;
    border-right: none;
    border-left: none;
    padding: 20px 0;
  }
   .content-product-input .input-content-search:focus{
    outline: none;
    box-shadow: none;
  }
</style>
