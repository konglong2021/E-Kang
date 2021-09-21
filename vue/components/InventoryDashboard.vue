<template>
  <div class="inventory-dashboard-content main-page-content">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h6>Inventory Overview</h6>
        </div>
        <div class="content-panel-right">
          <div class="input-group input-group-sm search-content">
             <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
            <input class="form-control input-search-box" type="search" placeholder="Search..."/>
          </div>
        </div>
        <div class="panel-bottom"></div>
      </div>
    </div>
    <div class="content-product">
      <div class="input-group input-group-sm content-product-input">
        <span class="input-icon input-icon-left"><i class="fa fa-search"></i></span>
        <b-form-input :id="'input-product'" type="text" class="input-content-search"></b-form-input>
        <span class="input-icon icon-no-border-left-right"><i class="fa fa-keyboard-o"></i></span>
        <span class="input-icon input-icon-right icon-background" @click="showModal()"><i class="fa fa-plus"></i></span>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>ឈ្មោះទំនិញជាអង់គ្លេស</th>
            <th>ឈ្មោះទំនិញជាខ្មែរ</th>
            <th>តម្លៃលក់</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>

    </div>
    <div>
    </div>
    <add-new-product-modal v-model="newProductModal"/> <!--no need to import it will automatically rendering it -->
  </div>
</template>

<script>
  export default {
    data() {
      return {
        newProductModal:{
          showModal:false
        },
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
    watch:{
      newProductModal:{
          handler(val){
              console.log('I am watching modal value',this.newProductModal);
          },
          deep:true
      }
    },
    methods: {
      showModal(){
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component

        this.newProductModal.showModal = true;
        alert('Debug me , I am going to popup the modal');
        console.log('modal data' ,this.newProductModal);


      },
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

<style scoped>
  .inventory-dashboard-content{
    display: inline-block;
    width: 100%;
  }
  .control-panel{
    border-bottom: 1px solid #cccccc;
    display: inline-block;
    margin-bottom: 5px;
    padding: 5px 16px;
    width: 100%;
  }
  .content-panel-left{
    display: inline-block;
    width: 50%;
    float: left;
    color: #8f8f8f;
  }
  .content-panel-right{
    display: inline-block;
    width: 50%;
    float: left;
  }
  .panel-top{
    display: inline-block;
    width: 100%;
  }
  .search-content{
    border-bottom: 1px solid #ced4da;
  }
  .button-search-box{
    background-color: #fff;
    border: 1px solid #fff;
    line-height: 1.7;
  }
  .input-search-box{
    border: none;
  }
  .input-search-box:focus, .input-search-box:active{
    box-shadow: none;
  }

  .content-product{
    display: inline-block;
    padding-left: 16px;
    width: 100%;
  }
  .content-product .content-product-input{
    max-width: 20%;
    margin-bottom: 25px;
  }
  .content-product .content-product-input .input-icon{
    background-color: #fff;
    border: 1px solid #ced4da;
    line-height: 1.8;
    padding: 0 12px;
    font-size: 22px;
    cursor: pointer;
  }
  .content-product .content-product-input .icon-background{
      background-color: #f8f9fa;
  }
  .content-product .content-product-input .icon-no-border-left-right{
    border-left: none;
    border-right: none;
  }
  .content-product .content-product-input .input-icon-left{
    border-right: none;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
  }
  .content-product .content-product-input .input-icon-right{
    border-left: none;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
  }
  .content-product .content-product-input .input-content-search{
    border-top: 1px solid #ced4da;
    border-bottom: 1px solid #ced4da;
    border-right: none;
    border-left: none;
    padding: 20px 0;
  }
  .content-product .content-product-input .input-content-search:focus{
    outline: none;
    box-shadow: none;
  }

  .content-card{
    display: inline-block;
    padding: 5px 16px;
    width: 100%;
  }
  .card-item{
    border: 1px solid #ced4da;
    display: inline-block;
    padding: 8px 16px;
    margin: 5px 10px;
    min-width: 150px;
    width: 300px;
    height: 140px;
  }
  .card-item-header-title-left{
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 0;
    margin-top: 0;
    display: block;
    float: left;
  }
  .card-item-header-title-left a {
    color: #17a2b8;
  }
  .card-item-header-title-left a:hover{
    text-decoration: none;
  }
  .card-item-header-section{
    display: inline-block;
    float: right;
  }
  .card-item-header-section a {
    color: #666666;
  }

  .card-content{
    display: inline-block;
    margin-top: 16px;
    width: 100%;
  }
  .card-content a:hover{
    text-decoration: none;
  }
</style>

