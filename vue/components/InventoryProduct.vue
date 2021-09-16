<template>
  <div>
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h6>Products</h6>
          <b-button class="btn btn-sm" href="/create-new-product" variant="info"><i class="fa fa-plus-circle font-size-22"></i></b-button>
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
      <div class="content">
        <div class="content-item" v-for="product in productList">
          <div class="content-image">
            <img height="50px" :image-url="require('@/assets/' + product.image)">
          </div>
          <div class="content-detail">
            <strong><span class="title">{{ (product.en_name) }}</span></strong>
            <span>[FURN_0001]</span>
            <div>Price: <span >$&nbsp;5.10</span></div>
            <div>On hand: <span>-1.00</span> <span>Units</span></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        productList: [],
        tests : [{text: "fff"}, {text: "dddd"}]
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
    },
    mounted() {
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
  .content-detail{
    display: inline-block;
    width: 68%;
    font-size: 12px;
  }
  .content-item{
    display: inline-block;
    width: 23.45%;
    padding: 8px 8px;
    margin-top: 3px;
    margin-bottom: 3px;
    margin-right: 10px;
    margin-left: 10px;
    border: 1px solid #ced4da;
  }
  .content-item:first-child{
    margin-left: 0;
  }
  .content-item:nth-child(5n + 5){
    margin-left: 0;
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
</style>
