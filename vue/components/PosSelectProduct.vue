<template>
    <div>
        <div v-for="p in products" v-bind:key="p.id" class="p-item"
             @click="selectedItem(p)" :class="{'active-item-product' : selected == p.id}">
            <div style="width:85%;" class="pull-left">
              <div class="p-name">{{ p.name }} </div>
              <div class="p-qty"> {{ (p.qty) }}  / Unit</div>
            </div>
            <div style="width:15%; text-align:right" class="pull-right p-price" >
                {{p.price}} {{p.currency}}
            </div>
            <div class="clearboth"></div>
        </div>
        <div>
            <div class="total-wrapper pull-right">
              <div class="total">Sub Total : {{calculate("USD")}} USD </div>
                <div class="total">Sub Total : {{calculate("Riel")}} Riel </div>
                <div class="tax"> Taxes: 100</div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
  props: {
    // product: Object,
    products: [],
  },
  data() {
    return {
      productList : [],
      // products: [],
      selected: undefined,
    };
  },
  watch:{
    // product: {
    //   handler(val){
    //     let that = this;
    //     if(val){
    //       if(!val.hasOwnProperty("qty")){
    //         if(this.products.length === 0){
    //           val["qty"] = 1;
    //           this.products.push(val);
    //         }
    //         else {
    //           let foundItem = false;
    //           let elmFound = {};
    //           for(let i=0; i < this.products.length; i++){
    //             if(this.products[i]["id"] === val["id"]){
    //               let itemTemp = JSON.parse(JSON.stringify(this.products[i]));
    //               itemTemp["qty"] = Number(itemTemp['qty']) + 1;
    //               this.$set(this.products, i, itemTemp);
    //               foundItem = true;
    //               break;
    //             }
    //           }
    //           if(foundItem === false){
    //             val["qty"] = 1;
    //             this.products.push(val);
    //           }
    //         }
    //       }
    //     }
    //   }
    // }
  },
  methods: {
    async onInitData(){
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
    onSubmit(event) {
      event.preventDefault();
      alert(JSON.stringify(this.form));
    },
    calculate($currency){
      let total = [];

      Object.entries(this.products).forEach(([key, val]) => {
        if(val.currency === $currency){
          total.push(val.price * val.qty);
        }
      });
      return total.reduce(function(total, num){ return total + num }, 0);
    },
    selectedItem($item){
      this.selected = $item.id;
      this.$emit("selectedItem", $item);
    },
  },
  mounted() {
    this.onInitData();
  },
}
</script>
<style  scoped>
    .p-name {
        font-weight: bold;
        font-size: 20px;
    }
    .p-qty {
        margin-right: 10px;
        color: #555;
    }
    .p-price {
        font-weight: bold;
        font-size: 15px;
    }
    .p-item {
      border-bottom: solid 1px #ccc;
      cursor: pointer;
      position: relative;
    }
    .p-item:hover{
        background-color: #ccc;
    }
    .total-wrapper {
        border-top: 2px solid #000;
        margin-top: 10px;
        padding:10px;
    }
    .total {
        font-weight: bold;
        font-size: 30px;
    }
    .content-product-select .user-select-none{
      user-select: none !important;
      -ms-user-select: none !important;
      -moz-user-select: none !important;
    }
</style>
