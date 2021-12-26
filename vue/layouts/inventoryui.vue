<template>
  <div>
    <div class="main-inventory" v-if="!isLoading">
      <InventoryTopBar/>
      <Nuxt />
    </div>
    <loading v-if="isLoading"></loading>
  </div>

</template>

<script>
  export default {
    data(){
      return {
        isLoading: true,
      }
    },
    mounted() {
      let self = this;
      setTimeout(function(){
        self.isLoading = false;
      }, 500);
    }
  }
</script>

<style>
  .main-pos {
    background-color: #dedede;
    height: 100vh;
  }
  .main-inventory{
    background-color: #eff3f6;
       height: 100vh;
  }

  .inventory-dashboard-content{
    display: inline-block;
    width: 100%;
  }
  .control-panel{
    border-bottom: 1px solid #cccccc;
    display: inline-block;
    /*margin-bottom: 5px;*/
    padding: 5px 16px;
    width: 100%;
  }
  .content-panel-left{
    display: inline-block;
    width: 40%;
    float: left;
    color: #8f8f8f;
  }
  .content-panel-right{
    display: inline-block;
    width: 60%;
    float: left;
  }
  .panel-top{
    display: inline-block;
    width: 100%;
  }
  .search-content{
    border-bottom: 1px solid #ced4da;
    margin-right: 1px;
  }
  .button-search-box{
    background-color: #fff;
    border: 1px solid #fff;
    line-height: 1.7;
    padding-left: 10px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
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
    background-color: #fff;
    border-radius: 5px;
    padding-top: 10px;
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
  .content-panel-right .col{
    padding-left: 1px;
    padding-right: 1px;

  }
</style>
