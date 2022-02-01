<template>
    <div class="display-inline-block full-with">
      <div  class="calculator-product-content">
        <div class="p-item" v-if="products.length > 0">
          <div style="width:69%;" class="display-inline-block"><span></span></div>
          <div style="width:14%; text-align:left" class="display-inline-block p-price">Unit Price</div>
          <div style="width:14%; text-align:left" class="display-inline-block p-price">Sub Total</div>
        </div>
        <div v-for="p in products" v-bind:key="p.id" class="p-item"
             @click="selectedItem(p)" :class="{'active-item-product' : selected == p.id}"
        >
          <div style="width:70%;" class="pull-left">
            <div class="p-name">{{ p.name }} </div>
            <div class="p-qty"> {{ (p.qty) }}  / Unit</div>
          </div>
          <div style="width:15%; text-align:left" class="pull-left p-price" >
            {{p.price}} {{p.currency}}
          </div>
          <div style="width:15%; text-align:left" class="pull-left p-price" >
            {{calculateSubTotal(p)}} {{p.currency}}
          </div>
          <div v-if="selected && selected === p.id" style="width:15%; text-align:right" class="pull-right p-price" >
            <b-button size="sm" @click="submitNumberIncrease(p)"><i class="fa fa-plus"></i></b-button>
            <b-button size="sm" @click="submitNumberDisCrease(p)" :disabled="disableButtonRemove === true"><i class="fa fa-minus"></i></b-button>
          </div>
          <div class="clearboth"></div>
        </div>
      </div>
      <div class="content-calculator">
          <div class="content-btn-card" style="display: none;">
            <b-button
              v-bind:disabled = "calculate('USD', products) === 0 && calculate('Riel', products) === 0"
              size="lg"
              @click="addToCard(products)" title="Add to card"
            >
              <i class="fa fa-cart-arrow-down font-size-28"></i>
            </b-button>
          </div>
          <div class="content-btn pull-right" style="right: 55%;">
            <b-button size="lg"
                      v-bind:disabled = "calculate('USD', products) === 0 && calculate('Riel', products) === 0"
                      @click="openSubmitPaymentModal()"
            >
              <i class="fa fa-money margin-span-btn font-size-28"></i>
              Payment
            </b-button>
          </div>
          <div class="total-wrapper pull-right">
            <div class="total">Total (All Tax not included) (USD) : {{calculate("USD", products)}} USD </div>
            <div class="total">Total (All Tax not included) (Riel): {{calculate("Riel", products)}} Riel </div>
            <div class="tax"> Taxes:  10% </div>
          </div>
        </div>
      <b-modal id="modal-submit-payment" ref="payment-form-modal" size="lg"
               @hidden="onResetPayment" ok-only ok-variant="secondary" footer-class="justify-content-center"
               @ok="onSubmitPayment" ok-title="រក្សាទុក" title="ការលក់">
        <b-form enctype="multipart/form-data">
          <div class="full-content margin-bottom-20">
            <div class="container-row-form width-45-percentage float-left">
              <div class="form-row-content-detail">
                <div class="form-column-label">
                  <label :for="'input-customer'" class="label-input no-margin-bottom">ឈ្មោះអតិថិជន</label>
                </div>
                <div class="form-column-input">
                  <b-form-select  class="form-control input-content" v-model="order.customer" :options="customers"></b-form-select>
                </div>
              </div>
            </div>
            <div class="container-row-form width-45-percentage float-right">
              <div class="form-row-content-detail">
                <div class="form-column-label">
                  <label :for="'input-vat'" class="label-input no-margin-bottom">ពន្ធ</label>
                </div>
                <div class="form-column-input">
                  <b-form-select  class="form-control input-content" v-model="order.vat" :options="vats"></b-form-select>
                </div>
              </div>
              <div class="form-row-content-detail">
                <div class="form-column-label">
                  <label :for="'input-discount'" class="label-input no-margin-bottom">បញ្ចុះតម្លៃ</label>
                </div>
                <div class="form-column-input">
                  <b-form-input type="number" class="input-content" v-model="order.discount"></b-form-input>
                </div>
              </div>
            </div>
          </div>
          <b-table table-class="table-payment"
            :items="items"
            :fields="fields"
            :per-page="0"
            :current-page="currentPage"
            stacked="md"
            show-empty
            small
          ></b-table>
          <div style="display: inline-block;float: right;">
            <span>{{$t('title_total')}} : {{calculate("USD", items)}} USD</span>
          </div>
        </b-form>
      </b-modal>
    </div>
</template>
<script>
export default {
  props: {
    products: [],
    warehouseSelectedId: null,
  },
  data() {
    return {
      productList : [],
      selected: undefined,
      disableButtonRemove: false,
      perPage: 8,
      currentPage: 1,
      items: [],
      fields: [
        { key: 'name', label: 'ឈ្មោះទំនិញ', thClass: "header-th"},
        { key: 'qty', label: 'ចំនួន'},
        { key: 'price', label: 'តម្លៃឯកតា ($)' },
        { key: 'total', label: 'តម្លៃសរុប ($)' },
      ],
      totalRows: 0,
      customers : [],
      warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
      vats: [{text: '0%', value: 0}, {text: '5%', value: 0.05}, {text: '10%', value: 0.1}, {text: '15%', value: 0.15}],
      order: { customer : null, warehouse : null, vat: 0.1, discount : 0,},
    };
  },
  watch:{},
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
      calculate($currency, $products){
        let total = [];
        Object.entries($products).forEach(([key, val]) => {
          if(val.currency === $currency){
            total.push(val.price * val.qty);
          }
        });
        return total.reduce(function(total, num){ return total + num }, 0);
      },
      calculateSubTotal($product){
        return ($product.price * $product.qty);
      },
    selectedItem($item, $event){
      this.selected = $item.id;
      this.$emit("selectedItem", $item);
    },
    submitNumberIncrease(product){
      for(let index=0; index < this.products.length; index++) {
        if (this.products[index]["id"] === product["id"]) {
          let itemTemp = JSON.parse(JSON.stringify(this.products[index]));
          itemTemp["qty"] = Number(product["qty"]) + 1;
          this.$set(this.products, index, itemTemp);
          product = itemTemp;
        }
      }
    },
    submitNumberDisCrease(product){
      let foundProductItemIndex = null;
      for(let index=0; index < this.products.length; index++) {
        if (this.products[index]["id"] === product["id"]) {
          let itemTemp = JSON.parse(JSON.stringify(this.products[index]));
          if(product["qty"] > 1){
            itemTemp["qty"] = Number(product["qty"])-1;
            this.$set(this.products, index, itemTemp);
            product = itemTemp;
          }
          else if(product["qty"] === 1){
            this.products.splice(index, 1);
          }
          else {
            this.disableButtonRemove = true;
          }
        }
      }
    },
    closeDropdown($event){
      this.selected = undefined;
    },
    openSubmitPaymentModal(){
      this.$refs['payment-form-modal'].show();
      if(this.products && this.products.length > 0){
        for(let index =0; index < this.products.length; index++){
          let productItem = this.products[index];
          productItem["total"] = productItem["qty"] * productItem["price"];
          this.products[index] = productItem;
        }
        this.items = this.cloneObject(this.products);
      }
    },
    async getCustomerList(){
      let self = this;
      await self.$axios.get('/api/customer').then(function (response) {
          if(response.hasOwnProperty("data")){
            for(let index=0; index < response.data.length; index++){
              self.customers.push({text : response.data[index]["name"], value : response.data[index]["id"]});
            }
          }
        })
        .catch(function (error) {
          self.$toast.error("getting data error ").goAway(2000);
          console.log(error);
        });
    },
    async getWareHouseList(){
      let self = this;
      await self.$axios.get('/api/warehouse').then(function (response) {
        if(response.data.hasOwnProperty("data")){
          for(let index=0; index < response.data.data.length; index++){
            self.warehouses.push({text : response.data.data[index]["name"], value : response.data.data[index]["id"]});
          }
        }
      })
        .catch(function (error) {
          self.$toast.error("getting data error ").goAway(2000);
          console.log(error);
        });
    },
    async onSubmitPayment(){
      let self = this;
      let dataSubmit = {};
      dataSubmit.warehouse_id = this.warehouseSelectedId;
      dataSubmit.customer_id = self.order.customer;
      dataSubmit.vat = self.order.vat;
      dataSubmit.discount = self.order.discount;
      dataSubmit.items = [];

      for (let index=0; index < self.items.length ; index++){
        let item = self.items[index];
        dataSubmit.items.push({product_id : item["id"], sellprice : item["price"], quantity: item["qty"]});
      }
      let subTotal = self.calculate("USD", dataSubmit.items);
      dataSubmit.subtotal = subTotal;

      let discount = subTotal * (this.order.discount / 100);
      let priceAfterDiscount = subTotal - discount;
      let totalVat = priceAfterDiscount * this.order.vat;
      let grandTotal = priceAfterDiscount + totalVat;
      dataSubmit.grandtotal = grandTotal;

      self.$toast.info("Data starting submit").goAway(1500);
      await this.$axios.post('/api/sale', dataSubmit).then(function (response) {
        if(response.data.hasOwnProperty("data")){

        }
      })
      .catch(function (error) {
          self.$toast.error("getting data error ").goAway(2000);
          console.log(error);
      });
    },
    onResetPayment(){

    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
    addToCard($data){
      let self = this;
      let dataSubmit = {};
      dataSubmit.warehouse_id = this.warehouseSelectedId;
      dataSubmit.customer_id = self.order.customer;
      dataSubmit.vat = self.order.vat;
      dataSubmit.discount = self.order.discount;
      dataSubmit.items = [];

      for (let index=0; index < self.items.length ; index++){
        let item = self.items[index];
        dataSubmit.items.push({product_id : item["id"], sellprice : item["price"], quantity: item["qty"]});
      }
      let subTotal = self.calculate("USD", dataSubmit.items);
      dataSubmit.subtotal = subTotal;

      let discount = subTotal * (this.order.discount / 100);
      let priceAfterDiscount = subTotal - discount;
      let totalVat = priceAfterDiscount * this.order.vat;
      let grandTotal = priceAfterDiscount + totalVat;
      dataSubmit.grandtotal = grandTotal;
    },
  },
  mounted() {
    this.onInitData();
    this.getCustomerList();
    //this.getWareHouseList();
  },
}
</script>
<style scoped>
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
      overflow: hidden;
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
    .content-btn-card{
      margin-top: 10px;
      padding: 10px;
      position: absolute;
      bottom: 5px;
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
