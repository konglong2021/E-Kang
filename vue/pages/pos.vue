<template>
<b-container fluid class="bv-example-row">
  <b-row>
    <b-col cols="4" class="content-product-select">
      <PosSelectProduct :products="productSelectList" @selectedItem="selectedItem" />
      <PosCalculator :productItem = "calculateItem" @listenAction="increaseQty($event)"/>
    </b-col>
    <b-col cols="8" class="product-list">
        <PosProductList @selectProduct="selectProduct($event)" />
    </b-col>
  </b-row>
</b-container>
</template>
<script>

export default {
    layout:'posui',
  data(){
    return {
      productSelectList: [],
      productItem: {},
      calculateItem: {},
    }
  },
  methods: {
    selectProduct($data){
      //this.productItem = JSON.parse(JSON.stringify($data));
      if($data){
        if(!$data.hasOwnProperty("qty")){
          if(this.productSelectList.length === 0){
            $data["qty"] = 1;
            this.productSelectList.push($data);
          }
          else {
            let foundItem = false;
            for(let i=0; i < this.productSelectList.length; i++){
              if(this.productSelectList[i]["id"] === $data["id"]){
                let itemTemp = JSON.parse(JSON.stringify(this.productSelectList[i]));
                itemTemp["qty"] = Number(itemTemp['qty']) + 1;
                this.$set(this.productSelectList, i, itemTemp);
                foundItem = true;
                break;
              }
            }
            if(foundItem === false){
              $data["qty"] = 1;
              this.productSelectList.push($data);
            }
          }
        }
        else {
          let foundItem = false;
          for(let i=0; i < this.productSelectList.length; i++){
            if(this.productSelectList[i]["id"] === $data["id"]){
              let itemTemp = JSON.parse(JSON.stringify(this.productSelectList[i]));
              itemTemp["qty"] = Number(itemTemp['qty']) + 1;
              this.$set(this.productSelectList, i, itemTemp);
              foundItem = true;
              break;
            }
          }
          if(foundItem === false){
            $data["qty"] = 1;
            this.productSelectList.push($data);
          }
        }
      }
    },
    selectedItem($item){
      this.calculateItem = $item;
    },
    increaseQty($event){
      for(let index=0; index < this.productSelectList.length; index++) {
        if (this.productSelectList[index]["id"] === $event["id"]) {
          let itemTemp = JSON.parse(JSON.stringify(this.productSelectList[index]));
          itemTemp["qty"] = Number($event["qty"]);
          this.$set(this.productSelectList, index, itemTemp);
          this.calculateItem = itemTemp;
        }
      }
    },
  },
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
