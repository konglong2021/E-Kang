<template>
    <div class="display-inline-block full-with" v-show="cashBalance">
      <div  class="calculator-product-content">
        <div class="p-item" v-if="products && products.length > 0">
          <div style="width:69%;" class="display-inline-block"><span></span></div>
          <div style="width:14%; text-align:left" class="display-inline-block p-price">{{ $t('label_unit_price') + " ($)"}} </div>
          <div style="width:14%; text-align:left" class="display-inline-block p-price">{{ $t('label_sub_total') + " ($)"}} </div>
        </div>
        <div v-if="products && products.length > 0">
          <div v-for="p in products" v-bind:key="p.id" class="p-item"
             @click="selectedItem(p)" :class="{'active-item-product' : selected == p.id}"
             @dblclick="openUpdateUnitSalePrice(p)" v-b-tooltip="$t('text_tooltip_update_price')"
        >
          <div style="width:70%;" class="display-inline-block pull-left">
            <div class="p-name">{{ p.name }} </div>
            <div class="p-qty"> {{ (p.qty) }}  / {{ $t('label_product_sale_item') }}</div>
          </div>
          <div style="width:15%; text-align:left; hieght: 100% !important; user-select: none;" class="display-inline-block pull-left" >
            <div class="p-price">{{p.price}} {{p.currency}}</div>
          </div>
          <div style="width:15%; text-align:left" class="pull-left p-price" >
            {{calculateSubTotal(p)}} {{p.currency}}
          </div>
          <div v-if="selected && selected === p.id" style="width:15%; text-align:right" class="pull-right p-price" >
            <b-button size="sm" @click="submitNumberIncrease(p)"><i class="fa fa-plus"></i></b-button>
            <b-button size="sm" @click="submitNumberDisCrease(p)" :disabled="disableButtonRemove === true">
              <i class="fa fa-minus"></i>
            </b-button>
          </div>
          <div class="clearboth"></div>
        </div>
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
        <div class="content-btn pull-left" style="left: -9px;" v-if="invoiceNumber !== null">
          <b-button size="lg" @click="printInvoice()">
              <i class="fa fa-print font-size-28"></i>
              {{ $t('label_print_invoice') }}
          </b-button>
        </div>
          <div class="content-btn pull-right" style="right: 50%;">
            <b-button size="lg"
                      v-bind:disabled = "calculate('USD', products) === 0 && calculate('Riel', products) === 0"
                      @click="openSubmitPaymentModal()"
            >
              <i class="fa fa-money margin-span-btn font-size-28"></i>
              Payment
            </b-button>
          </div>
          <div class="total-wrapper pull-right">
            <div class="total">{{ $t('title_total_no_tax') }} : {{calculate("USD", products)}} USD </div>
            <div class="total">{{ $t('title_total_no_tax_add_discount') }} : {{calculateAfterDis(calculate("USD", products))}} USD </div>
            <div class="total"> {{ $t('title_total_no_tax_in_riel') }}: {{calculate("Riel", products)}} Riel </div>
          </div>
        </div>
      <b-modal id="modal-update-selling-price-form" ref="update-selling-price-form-modal" modal-class="payment-form-modal"
               @hidden="onResetUpdateSellingPrice" ok-only ok-variant="secondary" footer-class="justify-content-center"
               @ok="onSubmitUpdateSellingPrice" :ok-title="$t('label_title_update')" :title="$t('label_update_selling_price_title')" no-close-on-backdrop>
        <b-form enctype="multipart/form-data" style="display: inline-block; width: 100%; height: 100%; overflow: hidden;">
          <b-row class="my-1" v-if="productItemSelectToUpdatePrice">
            <b-col sm="4"><label :for="'input-sale_price'" class="label-input">តម្លៃលក់ ($)</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-sale_price'" type="number" class="input-content" v-model="productItemSelectToUpdatePrice.price" required></b-form-input>
            </b-col>
          </b-row>
        </b-form>
      </b-modal>
      <b-modal id="modal-submit-payment" ref="payment-form-modal" size="lg" modal-class="payment-form-modal"
               @hidden="onResetPayment" ok-only ok-variant="secondary" footer-class="justify-content-center"
               @ok="onSubmitPayment" ok-title="រក្សាទុកទិន្នន័យ" title="ការលក់" no-close-on-backdrop>
        <b-form enctype="multipart/form-data" style="display: inline-block; width: 100%; height: 100%; overflow: hidden;">
          <div class="full-content margin-bottom-20">
            <div class="container-row-form width-45-percentage float-left">
              <div class="form-row-content-detail">
                <div class="form-column-label">
                  <label :for="'input-customer'" class="label-input no-margin-bottom">ឈ្មោះអតិថិជន</label>
                </div>
                <div class="form-column-input">
                  <b-form-select  class="form-control input-content" v-model="order.customer" :options="customers" @change="updateCustomerSelected(order.customer)"></b-form-select>
                </div>
              </div>
              <div class="form-row-content-detail">
                <div class="form-column-label">
                  <label :for="'input-exchange-rate'" class="label-input no-margin-bottom">អត្រាប្តូរប្រាក់រៀល (៛)</label>
                </div>
                <div class="form-column-input">
                  <b-form-input type="number" class="input-content" v-model="exchange_rate"></b-form-input>
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
                  <b-form-input type="number" class="input-content" v-model="order.discount" @change="updatedPriceInListDetailOrder(order.discount)"></b-form-input>
                </div>
              </div>
              <div class="form-row-content-detail">
                <div class="form-column-label">
                  <label :for="'input-getting-money'" class="label-input no-margin-bottom">
                    ទទួលទឹកប្រាក់
                    <span v-if="is_getting_money_usd"> ($)</span>
                    <span v-if="is_getting_money_riel"> (៛)</span>
                  </label>
                </div>
                <div class="form-column-input" v-if="!is_getting_money_usd && !is_getting_money_riel">
                  <b-button size="sm" @click="checkGettingMoney('USD')">ដុល្លា</b-button>
                  <b-button size="sm" @click="checkGettingMoney('Riel')">ប្រាក់រៀល</b-button>
                </div>
                <div class="form-column-input" v-if="is_getting_money_usd">
                  <b-form-input v-if="is_getting_money_usd" :id="'input-getting-money'" type="number" class="input-content" v-model="getting_money_usd"></b-form-input>
                </div>
                <div class="form-column-input" v-if="is_getting_money_riel">
                  <b-form-input v-if="is_getting_money_riel" :id="'input-getting-money'" type="number" class="input-content" v-model="getting_money_riel"></b-form-input>
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
          <div style="display: inline-block;float: right;margin-top: 25px;">
            <span style="display: block;">{{$t('title_total_in_usd')}} : {{ calculate("USD", items) }} USD</span>
            <span style="display: block;margin-top: 10px;">{{$t('title_total_after_vat_in_usd')}} : {{ calculateIncludeTax(calculate("USD", items)) }} USD</span>
            <span style="display: block;margin-top: 10px;" v-if="exchange_rate">{{$t('title_total_in_riel')}} : {{ calculateToRiel(calculate("USD", items), exchange_rate) }} Riel</span>
            <span style="display: block;">លុយត្រូវអាប់ ($) : {{(getting_money_usd || getting_money_riel) ? calculateMoneyGiveBack(items) : 0 }} {{ getting_money_usd ? "USD" : "Riel" }}</span>
            <span style="display: block;">លុយត្រូវអាប់ (៛) : {{ giveMoneyBackConvert }} </span>
          </div>
        </b-form>
      </b-modal>
      <div id="invoice-print" style="display:none; width: 100%; height: 100%; overflow: hidden; padding: 30px 70px !important; font-family: 'Arial', 'Khmer OS Bokor', sans-serif !important;">
        <div style="margin-bottom: 30px; font-family: 'Arial', 'Khmer OS Bokor', sans-serif; display:inline-block">
          <h1 style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif; text-align: center;">{{ $t('title') }}</h1>
        </div>
        <div class="full-content margin-bottom-20">
          <div class="container-row-form width-60-percentage float-left">
            <div class="form-row-content-detail row-content-view" v-if="invoiceNumber">
              <label class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">វិក័យប័ត្រលេខ</label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{invoiceNumber}}</strong>
            </div>
            <div class="form-row-content-detail row-content-view">
              <label :for="'input-customer'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ឈ្មោះអតិថិជន : </label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{displayCustomerName(order.customer)}}</strong>
            </div>
            <div class="form-row-content-detail row-content-view">
              <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">អត្រាប្តូរប្រាក់រៀល : </label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ exchange_rate + "(៛)"}}</strong>
            </div>
            <div class="form-row-content-detail row-content-view">
              <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">លក់ដោយ : </label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ $store.$cookies.get('user').name }}</strong>
            </div>
          </div>
          <div class="container-row-form width-29-percentage float-right">
            <div class="form-row-content-detail row-content-view">
              <label :for="'input-vat'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ពន្ធ : </label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ order.vat !== 0 ? (order.vat * 100) + "%": 0 }}</strong>
            </div>
            <div class="form-row-content-detail row-content-view">
              <label :for="'input-discount'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">បញ្ចុះតម្លៃ : </label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ order.discount + "%" }}</strong>
            </div>
            <div class="form-row-content-detail row-content-view">
              <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ថ្ងៃខែឆ្នាំលក់ : </label>
              <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ getFullDate() }}</strong>
            </div>
          </div>
        </div>
        <b-table style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;" table-class="table-payment"
                 :items="items"
                 :fields="fields"
                 :per-page="0"
                 :current-page="currentPage"
                 stacked="md"
                 show-empty
                 small
        ></b-table>
        <div style="display: inline-block;float: right; margin-top: 25px; margin-right: 75px;">
          <span style="display: block; font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{$t('title_total_in_usd')}} : {{calculate("USD", items)}} USD</span>
          <span style="display: block;margin-top: 10px; font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{$t('title_total_after_vat_in_usd')}} : {{calculateIncludeTax(calculate("USD", items))}} USD</span>
          <span style="display: block;margin-top: 10px; font-family: 'Arial', 'Khmer OS Bokor', sans-serif;" v-if="exchange_rate">{{$t('title_total_in_riel')}} : {{calculateToRiel(calculate("USD", items), exchange_rate)}} Riel</span>
        </div>
      </div>
    </div>
</template>
<script>
export default {
  props: {
    products: [],
    warehouseSelectedId: null,
    cashBalance : 0
  },
  data() {
    return {
      productList : [],
      selected: undefined,
      selectedItemData: {},
      disableButtonRemove: false,
      perPage: 8,
      currentPage: 1,
      items: [],
      fields: [
        { key: 'name', label: 'ឈ្មោះទំនិញ', thClass: "header-th", thStyle : "font-size: 17px;"},
        { key: 'qty', label: 'ចំនួន', thClass: "header-th", thStyle : "font-size: 17px;"},
        { key: 'price', label: 'តម្លៃឯកតា ($)', thClass: "header-th", thStyle : "font-size: 17px;"},
        { key: 'total', label: 'តម្លៃសរុប ($)', thClass: "header-th" , thStyle : "font-size: 17px;"},
        { key: 'discount', label: 'បញ្ចុះតម្លៃ (%)', thClass: "header-th", thStyle : "font-size: 17px;"},
        { key: 'total_after_discount', label: 'តម្លៃសរុប បន្ទាប់ពី បញ្ចុះតម្លៃ ($)', thClass: "header-th", thStyle : "font-size: 17px;"},
      ],
      totalRows: 0,
      customers : [],
      warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
      vats: [{text: '0%', value: 0}, {text: '5%', value: 0.05}, {text: '10%', value: 0.1}, {text: '15%', value: 0.15}],
      order: { customer : null, warehouse : null, vat: 0, discount : 0,},
      exchange_rate: 4100,
      getting_money_riel: 0,
      getting_money_usd: 0,
      is_getting_money_usd : false,
      is_getting_money_riel : false,
      isIncreaseNumber: false,
      isDisCreaseNumber: false,
      qtyInput : 0,
      showPlusAndMinusIcon: false,
      customersList : [],
      optionStyleHtmlToPaper: {
        specs: [
          'fullscreen=yes',
          'titlebar=yes',
          'scrollbars=yes'
        ],
        styles: [
          'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css',
          'https://unpkg.com/kidlat-css/css/kidlat.css',
          // '~/static/css/app.css',
        ],
        autoClose: true,
      },
      invoiceNumber: null,
      is_show_content_print: false,
      isInvoicePrint : false,
      productItemSelectToUpdatePrice : {},
      giveMoneyBackConvert: "0",
    };
  },
  watch:{
    products: {
      handler: function(value){

      }
    },
    isInvoicePrint: {
      handler: function(value){
        if(value === true){
          this.items = [];
          this.order["vat"] = 0;
          this.order["discount"] = 0;
          this.isInvoicePrint = false;
        }
      }
    },
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
    calculate($currency, $products){
        let total = [];
        Object.entries($products).forEach(([key, val]) => {
          if(val.currency === $currency){
            this.order.discount === 0 ? total.push(val.price * val.qty) : total.push((val.price * val.qty) - ((val.price * val.qty) * (this.order.discount / 100))) ;
          }
        });
        return total.reduce(function(total, num){ return total + num }, 0);
      },
    calculateSubTotal($product){
      return (parseFloat($product.price) * parseInt($product.qty));
    },
    calculateToRiel($totalPriceAsUSD, $exchangeRate){
      return ($totalPriceAsUSD * parseFloat($exchangeRate));
    },
    calculateIncludeTax($total){
      return $total + ($total * this.order.vat);
    },
    calculateAfterDis($total){
      return ($total - ($total * (this.order.discount / 100)));
    },
    selectedItem($item, $event){
      this.selected = $item.id;
      this.selectedItemData = $item;
      this.showPlusAndMinusIcon = true;
      this.$emit("selectedItem", $item);
    },
    increaseNumber(){
      this.isIncreaseNumber = true;
    },
    disCreaseNumber(){
      this.isDisCreaseNumber = true;
    },
    submitQtyProduct(qtyInput){
      if(this.isIncreaseNumber){
        this.submitNumberIncrease(qtyInput);
        this.isIncreaseNumber = false;
        this.qtyInput = 0;
        this.showPlusAndMinusIcon = false;
      }
      else if(this.isDisCreaseNumber){
        this.submitNumberDisCrease(qtyInput);
        this.isDisCreaseNumber = false;
        this.qtyInput = 0;
        this.showPlusAndMinusIcon = false;
      }
    },
    submitNumberIncrease(productItem){
      let itemTemp = null;
      for(let index=0; index < this.products.length; index++) {
        if (this.products[index]["id"] === productItem["id"]) {
          itemTemp = JSON.parse(JSON.stringify(this.products[index]));
          itemTemp["qty"] = (parseInt(productItem["qty"]) + 1);
          this.$set(this.products, index, itemTemp);
          //break;
        }
      }
      productItem = itemTemp;
    },
    submitNumberDisCrease(productItem){
      for(let index=0; index < this.products.length; index++) {
        if (this.products[index]["id"] === productItem["id"]) {
          let itemTemp = JSON.parse(JSON.stringify(this.products[index]));
          if(productItem["qty"] > 1){
            itemTemp["qty"] = (Number(productItem["qty"]) - 1);
            this.$set(this.products, index, itemTemp);
            productItem = itemTemp;
          }
          else if(productItem["qty"] === 1){
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
          productItem["total"] = (parseInt(productItem["qty"]) * parseFloat(productItem["price"]));
          productItem["discount"] = this.order.discount;
          productItem["total_after_discount"] = (this.order.discount === 0) ? productItem["total"] : (productItem["total"] * (this.order.discount/100));
          this.products[index] = productItem;
        }
        this.items = this.cloneObject(this.products);
      }
    },
    updatedPriceInListDetailOrder($discount){
      if(this.products && this.products.length > 0){
        for(let index =0; index < this.products.length; index++){
          let productItem = this.products[index];
          productItem["discount"] = $discount;
          productItem["total_after_discount"] = ($discount === 0) ? productItem["total"] : (productItem["total"] - (productItem["total"] * ($discount / 100)));
          this.products[index] = productItem;
        }
        this.items = this.cloneObject(this.products);
      }
    },
    async getCustomerList(){
      let self = this;
      await self.$axios.get('/api/customer').then(function (response) {
          if(response.hasOwnProperty("data") && response.data.hasOwnProperty("customer")){
            self.customersList = self.cloneObject(response.data.customer);
            for(let index=0; index < response.data.customer.length; index++){
              self.customers.push({text : response.data.customer[index]["name"], value : response.data.customer[index]["id"]});
            }
            for(let k=0; k < response.data.customer.length; k++){
              if(response.data.customer[k]["title"] === "Normal Member"){
                self.order.customer = response.data.customer[k]["id"];
                break;
              }
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
      }).catch(function (error) {
          self.$toast.error("getting data error ").goAway(2000);
          console.log(error);
        });
    },
    async onSubmitPayment(){
      let self = this;
      let dataSubmit = {};
      dataSubmit.warehouse_id = this.$store.$cookies.get('storeItem');
      dataSubmit.customer_id = self.order.customer;
      dataSubmit.vat = self.order.vat;
      dataSubmit.discount = self.order.discount;
      dataSubmit.items = [];
      let subTotal = 0;
      let grandTotal =0;
      let totalVat = 0;
      let priceAfterDiscount = 0;

      for (let index=0; index < self.items.length ; index++){
        let item = self.items[index];
        subTotal = subTotal + self.items[index]["total"];
        dataSubmit.items.push({product_id : item["id"], sellprice : item["price"], quantity: item["qty"]});
      }
      dataSubmit.subtotal = subTotal;
      totalVat = (self.order.vat * subTotal);
      priceAfterDiscount = subTotal - (subTotal * ((this.order.discount / 100)));
      dataSubmit.grandtotal = (priceAfterDiscount + totalVat);

      self.$toast.info("Data starting submit").goAway(1500);
      await this.$axios.post('/api/sale', dataSubmit).then(function (response) {
        if(response.data.success === true){
          self.$toast.success("Submit data successfully").goAway(2000);
          self.invoiceNumber = response.data.order["invoice_id"];
          self.is_show_content_print = true;
          self.$emit("updateListProduct", []);
        }
      })
      .catch(function (error) {
          self.$toast.error("getting data error ").goAway(2000);
          console.log(error);
      });
    },

    async printInvoice(){
      this.$htmlToPaper("invoice-print", this.optionStyleHtmlToPaper);
      setTimeout(() => {
        this.isInvoicePrint = true;
        this.is_show_content_print = false;
        this.invoiceNumber = null;
          this.items = [];
          this.order["vat"] =0;
          this.order["discount"] = 0;
      }, 700);
    },
    onResetPayment(){
      this.getting_money_usd = 0;
      this.getting_money_riel = 0;
      this.is_getting_money_riel = false;
      this.is_getting_money_usd = false;
      this.giveMoneyBackConvert = "0";
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
    handleKeydown (e) {
      switch (e.keyCode) {
        case 38:
          this.submitNumberIncrease(this.selectedItemData);
          break;
        case 40:
          this.submitNumberDisCrease(this.selectedItemData);
          break;
      }
    },
    updateCustomerSelected(customer){
      for(let k=0; k < this.customersList.length; k++){
        if(customer === this.customersList[k]["id"]){
          this.order.discount = (this.customersList[k]["discount"] * 100);
          this.updatedPriceInListDetailOrder(this.order.discount);
          break;
        }
      }
    },
    displayCustomerName($customerId){
      for (let index =0; index < this.customersList.length; index++){
        if($customerId === this.customersList[index]["id"]){
          return this.customersList[index]["name"];
        }
      }
    },
    getFullDate(){
      let today = new Date();
      let dd = today.getDate();
      let mm = (today.getMonth() + 1); //January is 0!
      let day = (dd < 10) ? ("0" + dd) : dd;
      let month = (mm < 10) ? ("0" + mm) : mm;
      let yyyy = today.getFullYear();

      return (day + "/" + month + "/" + yyyy);
    },
    checkGettingMoney($moneyType){
      if($moneyType === "USD"){
        this.is_getting_money_usd = true;
        this.is_getting_money_riel = false;
      }
      else{
        this.is_getting_money_riel = true;
        this.is_getting_money_usd = false;
      }
    },
    calculateMoneyGiveBack($items){
      let moneyReturn = 0, totalPay =0;
      if(this.is_getting_money_usd){
        totalPay = this.calculateIncludeTax(this.calculate("USD", $items));
        moneyReturn = (parseFloat(this.getting_money_usd) - parseFloat(totalPay));
        this.giveMoneyBackConvert = (moneyReturn > 0 ? (moneyReturn * this.exchange_rate) : 0) + " Riel";
      }
      else if(this.is_getting_money_riel){
        totalPay = this.calculateToRiel(this.calculate("USD", $items), this.exchange_rate);
        moneyReturn = (parseFloat(this.getting_money_riel) - parseFloat(totalPay));
        this.giveMoneyBackConvert = (moneyReturn > 0 ? (moneyReturn / this.exchange_rate).toFixed(2) : 0) + " USD";
      }
      return moneyReturn;
    },
    openUpdateUnitSalePrice(productItem){
      this.productItemSelectToUpdatePrice = productItem;
      this.$refs['update-selling-price-form-modal'].show();
    },
    onResetUpdateSellingPrice(){},
    onSubmitUpdateSellingPrice(){
      for(let indexProduct = 0;indexProduct < this.items.length; indexProduct++){
        if(this.items[indexProduct]["id"] === this.productItemSelectToUpdatePrice["id"]){
          this.items[indexProduct]["price"] = this.productItemSelectToUpdatePrice["price"];
        }
      }
    }
  },
  mounted() {
    let self = this;
    self.onInitData();
    self.getCustomerList();
  },
  created: function() {
    window.addEventListener('keydown', this.handleKeydown, null);
  },
  destroyed: function() {
    window.removeEventListener('keydown', this.handleKeydown, null);
  }
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
