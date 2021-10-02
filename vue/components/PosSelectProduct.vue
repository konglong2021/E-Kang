<template>
    <div>
        <div v-for="p in products" :key="p.id"  class="p-item user-select-none">
            <div style="width:85%; user-select: none;" class="pull-left user-select-none"  v-on:blur="closeMenu" v-on:contextmenu="openMenu(p)">
              <div class="p-name user-select-none">{{p.name}}  </div>
              <div class="p-qty user-select-none"> {{p.qty}}  / Unit</div>
              <div v-show="p.id == productSelect.id">
                <context-menu v-model="contextMenu"></context-menu>
              </div>
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
    products: Array
  },
  data() {
    return {
      contextMenu:{
        showMenu:false,
      },
      productList : [],
      productSelect: {},
    };
  },
  watch:{
    contextMenu:{
      handler(val){
        console.log(this.contextMenu, this.productSelect);
      },
      deep:true
    }
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
    openMenu: function(data) {
      this.productSelect = data;
      this.contextMenu.showMenu = true;
    },
    closeMenu(){
      this.contextMenu.showMenu = false;
    }
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
