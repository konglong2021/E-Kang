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
        let foundItemIndex = this.findDuplicateProductItem(this.productSelectList, $data);
        if(foundItemIndex === undefined){
          if(!$data.hasOwnProperty("qty")){
            $data["qty"] = 1;
          }
          this.productSelectList.push($data);
        }
        else if(foundItemIndex !== undefined){
          this.productSelectList[foundItemIndex]["qty"] = Number(this.productSelectList[foundItemIndex]["qty"]) + 1;
        }
      }
    },
    findDuplicateProductItem(productSelectList, $item){
      if(productSelectList && productSelectList.length > 0 ){
        for (let index=0; index < productSelectList.length; index++){
          if(productSelectList[index]["id"] === $item["id"]){
            return index;
          }
        }
      }
    },
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
