<template>
    <div>
      <b-modal id="modal-create-product" ref="product-form-modal" size="lg"
               @hidden="onReset" cancel-title="បោះបង់"
               @ok="onSubmit" ok-title="រក្សាទុក" title="បង្កើតទំនិញថ្មី">
        <b-form enctype="multipart/form-data">
          <div class="full-content">
            <div class="content-file-upload">
              <b-form-file id="file" name="file" class="input-file" v-on:change="onFileChange" plain></b-form-file>
              <div id="output" v-if="uploadFile" class="img"></div>
              <div v-if="!uploadFile" class="img" :style="{ backgroundImage: `url('images/image.png')` }"></div>
            </div>
          </div>
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-enname'" class="label-input">ឈ្មោះទំនិញជាអង់គ្លេស</label></b-col>
              <b-col sm="8">
                <b-form-input :id="'input-enname'" type="text" v-model="product.en_name" class="input-content"></b-form-input>
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-khname'" class="label-input">ឈ្មោះទំនិញជាខ្មែរ</label></b-col>
              <b-col sm="8">
                <b-form-input :id="'input-khname'" type="text" v-model="product.kh_name" class="input-content"></b-form-input>
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-category'" class="label-input">ប្រភេទទំនិញ</label></b-col>
              <b-col sm="8">
                <b-form-select :id="'input-category'" class="form-control input-content" v-model="product.category" :options="categories"></b-form-select>
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-brand'" class="label-input">ប្រេនទំនិញ</label></b-col>
              <b-col sm="8">
                <multiselect class="input-content" v-model="product.brand" :options="brands" track-by="name" label="name" :multiple="true" :show-labels="false" aria-placeholder="Select brands"></multiselect>
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-sale_price'" class="label-input">តម្លៃលក់</label></b-col>
              <b-col sm="8">
                <b-form-input :id="'input-sale_price'" type="number" class="input-content" v-model="product.sale_price"></b-form-input>
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-description'" class="label-input">ការពិពណ៌នា</label></b-col>
              <b-col sm="8">
                <b-form-textarea :id="'input-description'" class="input-content" v-model="product.description"></b-form-textarea>
              </b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
    </div>
</template>

<script>
  export default {
    props:{
      'value':{
        type:Object,
        require:true
      },
    },
    watch:{
       'value.showModal':{
         //watch value change sent from parent component
         handler(value){
           if(value==true){
              this.$refs['product-form-modal'].show();
           }
         },
         deep:true
       }
    },
    mounted(){
      let vm = this;
      console.log(this.value,'myvalue');
      this.getBrands();
      this.getCategories();
    },
    data() {
      return {
        categories: [{text: "Select category", value: null}],
        brands: [],
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
        uploadFile: null,
        file: null,
      };
    },
    methods: {
      async getBrands(){
        const response = await this.$axios.get('/api/brand');
        if(response.data.data){
          for(let index=0; index < response.data.data.length; index++){
            this.brands.push({name : response.data.data[index]["name"], value : response.data.data[index]["id"]});
          }
        }
      },
      async getCategories(){
        const response = await this.$axios.get('/api/category');
        if(response.data.data){
          for(let index=0; index < response.data.data.length; index++){
            this.categories.push({text : response.data.data[index]["name"], value : response.data.data[index]["id"]});
          }
        }
      },
      onReset(event) {
        event.preventDefault();
        // Reset our form values
        const product = { ... this.product}; //clone object product
        this.product.en_name = '';
        this.product.kh_name = '';
        this.product.category = null;
        this.product.description = '';
        this.product.brand = null;
        this.product.image = null;
        this.product.sale_price= 0;
        this.product.code= null;
        const data = {
          showModal :false,
          data:product
        };
        this.$emit('input', data);//send data back to parent component

      },
      onFileChange($event) {
        this.uploadFile = $event.target.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
          document.getElementById("output").setAttribute("style","background-image: url(" + e.target.result + ')');
        };
        reader.readAsDataURL($event.target.files[0]);
      },
      onSubmit(event) {
        let brands= [];
        let formData = new FormData();

        if(this.product.brand && this.product.brand.length > 0){
          for(let index=0; index < this.product.brand.length; index++){
            brands.push(this.product.brand[index]["value"]);
          }
        }
        formData.append("en_name", this.product.en_name);
        formData.append("kh_name", this.product.kh_name);
        formData.append("category_id", this.product.category);
        formData.append("description", this.product.description);
        formData.append("image", this.uploadFile);
        formData.append("sale_price", this.product.sale_price);
        formData.append("brands" , JSON.stringify(brands));
        this.$axios.post('/api/product', formData)
          .then(function (response) {
            commit('setMessage', {response: 'success', type: type});
            this.hideModal();
          })
          .catch(function (error) {
            console.log(error);
        });
      },
      hideModal() {
        this.$refs['product-form-modal'].hide();
      },
    }
  }
</script>

<style>
  .full-content .multiselect{
    height: 40px;
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
