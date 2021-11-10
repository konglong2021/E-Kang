<template>
    <div id="pos-product-list">
      <div class="product-list-header" style="display: none;">
        <div class="pull-left"><i class="fa fa-home fa-3x"></i></div>
        <div v-for="c in categories" :key="c.id" class="pull-left category-item">{{c.name}}</div>
        <div class="clearboth"></div>
      </div>
      <div class="control-panel">
        <div class="panel-top">
          <div class="content-panel-right">
            <b-container class="col-12 mx-auto menu-wrapper">
              <b-row>
                <b-col>
                  <div class="input-group input-group-sm search-content">
                    <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                    <input class="form-control input-search-box" type="search" placeholder="Search..."  v-model="searchInput" @keyup.enter="searchProduct()" />
                  </div>
                </b-col>
              </b-row>
            </b-container>
          </div>
          <div class="panel-bottom"></div>
        </div>
      </div>
      <div class="product-list-body">
        <div  v-for="p in products" :key="p.id" class="pro-item" >
          <div class="pro-img" :style="{ backgroundImage: `url('${p.img}')` }" @click="selectProductItem(p)">
            <div class="pro-price">{{p.price}} {{p.currency}}</div>
          </div>
          <div class="pro-name">{{p.name}}</div>
          <div class="clearboth"></div>
        </div>
        <div class="clearboth"></div>
      </div>
    </div>
</template>
<script>
export default {
  data() {
    return {
      categories : [
          {
              id : 1,
              name : 'Phone'
          },
          {
              id: 2,
              name : 'Computer'
          },
          {
              id: 3,
              name : 'Printer'
          }
      ],
      products : [],
      searchInput: null,
    };
  },
  watch:{
  },
  methods: {
    async getListProduct(){
      let vm = this;
      await vm.$axios.get('/api/stock').then(function (response) {
        if(response && response.hasOwnProperty("data")){
          let dataResponse = response.data.data;
          if(dataResponse){
            for(let i=0; i < dataResponse.length; i++){
              let productList = dataResponse[i].product;
              if(productList && productList.length > 0){
                for(let index=0; index < productList.length; index++){
                  let productItem =  { id: '', name: null, price : 0, currency:'USD', img :''};
                  productItem.id = productList[index].id;
                  productItem.name = productList[index].en_name + " (" + productList[index].kh_name + ")";
                  productItem.price = productList[index].sale_price;
                  productItem.img = productList[index].image !== "no image" ? vm.generateImageUrlDisplay(productList[index].image) : productList[index].image;
                  vm.products.push(productItem);
                }
              }
              else if(productList && productList.hasOwnProperty("id")){
                let productItem =  { id: '', name: null, price : 0, currency:'USD', img :''};
                productItem.id = productList.id;
                productItem.name = productList.en_name + " (" + productList.kh_name + ")";
                productItem.price = productList.sale_price;
                productItem.img = (productList.image !== "no image" && productList.image !== "no image created") ? vm.generateImageUrlDisplay(productList.image) : productList.image;
                vm.products.push(productItem);
              }
            }
          }
          console.log(vm.products);
        }
      }).catch(function (error) {
        console.log(error);
        vm.$toast.error("getting data error ").goAway(2000);
      });
    },
    onSubmit(event) {
      event.preventDefault();
      alert(JSON.stringify(this.form));
    },
    selectProductItem(item){
      this.$emit('selectProduct', item);
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
    generateImageUrlDisplay(img){
      if (typeof window !== "undefined") {
        return window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img;
      }
    },
    async searchProduct(){
      const response = await this.$axios.post('/api/product/search', {search : this.searchInput});
      if(response){
        if(response.data && response.data.hasOwnProperty("data") && response.data.data.length > 0){
          let items = [];
          this.responseProductList = response.data.data;
          for(let index=0; index < response.data.data.length; index++){
            let productItem = response.data.data[index];
            let newItem = {};
            let brands = [];
            if(productItem["brands"] && productItem["brands"].length > 0){
              for(let i =0; i < productItem["brands"].length; i++){
                brands.push(productItem["brands"][i]["name"]);
              }
            }
            newItem['id'] = productItem["id"];
            newItem['name'] = productItem["en_name"] + " (" + productItem["kh_name"] + ")";
            newItem['brand'] = brands.join(", ");
            newItem['loyalty'] = "N/A";
            newItem['image'] = productItem["image"];
            newItem['brands'] = productItem["brands"];
            newItem['categories'] = productItem["categories"];
            newItem['description'] = productItem["description"];
            newItem['sale_price'] = productItem["sale_price"];
            newItem['code'] = productItem["code"];
            newItem["en_name"] = productItem["en_name"];
            newItem["kh_name"] = productItem["kh_name"];
            items.push(newItem);
          }
          this.products = this.cloneObject(items);
        }
        else{
          this.products = [];
        }
      }
    },
    handleClick(e) {
      if(e.target.value === '' || e.target.value === null || e.target.value === undefined){
        this.searchInput = '';
        this.getListProduct();
      }
    },
  },
  mounted() {
    this.getListProduct();
  }
}
</script>
<style scoped>
  .category-item {
      padding: 10px;
      text-align: left;
      vertical-align: center;
      cursor: pointer;
      min-width: 100px;

  }
  .category-item:hover {
      background-color: #000;
      color:#fff;
  }
  .product-list-header {
      border-bottom: 2px solid #000;
      display: inline-block;
      width: 100%;
      z-index: 1000;
  }
  .pro-item {
      float: left;
      background:#fff;
      padding: 5px;
      border-radius: 10px;
      margin: 2px;
      min-width: 150px;
      cursor: pointer;
  }
  .pro-img {
      background-repeat: no-repeat;
      padding: 50px;

  }
  .pro-price{
      color :#fff;
      background-color: #000;
      border-radius: 5px;
      position: absolute;
      margin-top: -53px;
      margin-left: -10px;
  }
</style>
