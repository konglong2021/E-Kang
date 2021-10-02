<template>
<b-container fluid class="bv-example-row">
  <b-row>
    <b-col cols="4" class="content-product-select">
      <PosSelectProduct :products="productSelectList" />
      <PosCalculator />
    </b-col>
    <b-col cols="8" class="product-list">
        <PosProductList @selectProduct="selectProduct($event)" />
    </b-col>
  </b-row>
</b-container>
</template>
<script>
import {empty} from "../.nuxt/utils";

export default {
    layout:'posui',
  data(){
    return {
      productSelectList: []
    }
  },
  methods: {
    selectProduct($data){
      if(!empty($data)){
        let item = $data;
        let itemFoundObj = this.findDuplicateProductItem($data);
        if(itemFoundObj !== null && itemFoundObj['data'] !== null){
          this.productSelectList.splice(itemFoundObj['index'], 1);
          item["qty"] = (itemFoundObj['data']["qty"] + 1);
        }
        else {
          item["qty"] = 1;
        }

        this.productSelectList.push(item);
      }
    },
    findDuplicateProductItem($item){
      if(this.productSelectList && this.productSelectList.length > 0 ){
        for (let index=0; index < this.productSelectList.length; index++){
          if(this.productSelectList[index]["id"] === $item["id"]){
            let returnObj = [];
            returnObj['data'] = this.productSelectList[index];
            returnObj['index'] = index;
            return returnObj;
          }
        }
      }
      return null;
    }
  },
  mounted() {
  }
}
</script>

<style scoped>
  .product-list{
      border-left: 2px solid #000;
      background: #eff3f6;
      height: 95vh;
  }
  .content-product-select .user-select-none{
    user-select: none !important;
    -ms-user-select: none !important;
    -moz-user-select: none !important;
  }
</style>
