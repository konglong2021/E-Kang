<template>
  <div class="product-list">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h6 class="text-info font-size-24 font-weight-bold">ទំនិញទាំងអស់</h6>
          <b-button class="btn btn-sm" @click="addNewProdut()" variant="info">បន្ថែមថ្មី</b-button>
        </div>
        <div class="content-panel-right">
          <div class="input-group input-group-sm search-content">
             <span class="input-group-addon button-search-box">
               <i class="fa fa-search"></i>
             </span>
            <input class="form-control input-search-box" type="search" placeholder="Recherche..."/>
          </div>
        </div>
        <div class="panel-bottom"></div>
      </div>
    </div>
    <div class="container-list">
      <div class="content" v-if="productList && productList.length > 0">
        <div class="content-item" @click="updateProduct(product)" v-for="product  in productList" :key="product.id">
          <div class="content-image">
            <img :src="generateImageUrlDisplay(product.image)">
          </div>
          <div class="content-detail">
            <strong><span class="title">{{ (product.kh_name) }}</span></strong>
            <span class="font-khmer-os">({{ (product.en_name) }})</span>
<!--            <div>Price: <span >$&nbsp;5.10</span></div>-->
<!--            <div>On hand: <span>-1.00</span> <span>Units</span></div>-->
          </div>
        </div>
      </div>
    </div>
    <add-new-product-modal v-model="newProductModal" />
  </div>
</template>

<script>
  export default {
  // components: { AddNewProductModal },
    data() {
      return {
        newProductModal:{
            showModal:false
        },
        productList: [],
      };
    },
    methods: {
      async onInit(){
        try {
          const response = await this.$axios.get('/api/product');
          if(response.data.data){
            for (let index =0; index < response.data.data.length; index++){
              this.productList.push(response.data.data[index]);
            }
          }
        } catch (error) {
          console.log(error);
        }

      },
      updateProduct(product){
        this.$router.push({ path: "create-new-product:productId", name: 'create-new-product', params: { productId: product["id"] }});
      },
      generateImageUrlDisplay(img){
        return  window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img;
      }
      ,
      addNewProdut(){
          this.newProductModal.showModal = true;//display the modal form
      }
    },
    mounted() {
      console.log(window.location.protocol + "//" + window.location.hostname + ":8000/");
      this.onInit()
    },
  }
</script>

<style scoped>
  .control-panel{
    border-bottom: 1px solid #cccccc;
    display: inline-block;
    margin-bottom: 5px;
    width: 100%;
  }
  .content-panel-left{
    display: inline-block;
    width: 50%;
    float: left;
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

  .container-list{
    display: inline-block;
    width: 100%;
  }
  .content-image{
    display: inline-block;
    vertical-align: top;
    overflow: hidden;
    width: 30%;
  }
  .content-image img{
    width: 90px;
    height: 90px;
  }
  .content-detail{
    display: inline-block;
    width: 68%;
    font-size: 12px;
  }
  .content-item{
    border: 1px solid #ced4da;
    /*font-family: "Khmer OS";*/
    display: inline-block;
    margin-bottom: 3px;
    margin-right: 20px;
    padding: 8px 8px;
    margin-top: 3px;
    width: 23.45%;
    cursor: pointer;
  }

  .content-item:last-child{
    margin-right: 0;
  }
  .title{
    font-family: "Roboto", "Odoo Unicode Support Noto", sans-serif;
  }
  .font-size-22{
    font-size: 22px;
  }
  .font-khmer-os{
    /*font-family: "Khmer OS";*/
  }
</style>
