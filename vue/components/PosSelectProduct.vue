<template>
    <div class="display-inline-block full-with">
        <div class="calculator-product-content">
          <div v-for="p in products" v-bind:key="p.id" class="p-item"
               @click="selectedItem(p)" :class="{'active-item-product' : selected == p.id}">
            <div style="width:70%;" class="pull-left">
              <div class="p-name">{{ p.name }} </div>
              <div class="p-qty"> {{ (p.qty) }}  / Unit</div>
            </div>
            <div style="width:15%; text-align:left" class="pull-left p-price" >
              {{p.price}} {{p.currency}}
            </div>
            <div v-if="selected && selected == p.id" style="width:15%; text-align:right" class="pull-right p-price" >
              <b-button size="sm" @click="submitNumberIncrease(p)">
                <i class="fa fa-plus"></i>
              </b-button>
              <b-button size="sm">
                <i class="fa fa-minus"></i>
              </b-button>
            </div>
            <div class="clearboth"></div>
          </div>
        </div>
        <div class="content-calculator">
          <div class="content-btn pull-right">
            <b-button size="lg">
              <i class="fa fa-money"> </i>
              Payment
            </b-button>
          </div>
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
    products: [],
  },
  data() {
    return {
      productList : [],
      selected: undefined,
    };
  },
  watch:{
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
    selectedItem($item, $event){
      this.selected = $item.id;
      this.$emit("selectedItem", $item);
    },
    submitNumberIncrease(product){
      for(let index=0; index < this.productList.length; index++){
        if(this.productList[index].id === product.id){

        }
      }
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
        font-size: 15px;
    }
    .p-qty {
      margin-right: 10px;
      color: #555;
      font-size: 12px;
    }
    .p-price {
        font-weight: bold;
        font-size: 10px;
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
        padding: 10px;
    }
    .content-btn{
      margin-top: 10px;
      padding: 10px;
      position: absolute;
      bottom: 5px;
      right: 50%;
    }
    .total {
        font-weight: bold;
        font-size: 15px;
    }
    .content-product-select .user-select-none{
      user-select: none !important;
      -ms-user-select: none !important;
      -moz-user-select: none !important;
    }

  .content-calculator{
    display: inline-block;
    width: 100%;
    position: relative;
    overflow: hidden;
  }
</style>
