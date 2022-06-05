<template>
  <b-container fluid class="bv-example-row main-page-content">
    <div style="width: 100%; display: inline-block; overflow:hidden; padding-top: 2rem;padding-bottom: 2rem;border-bottom: 2px solid #e9edf2!important;">
      <b-container>
        <b-row style="padding-top: 35px;">
          <b-col lg="4">
            <div class="card border-1 border-left-3 border-left-accent text-center mb-lg-0 card-border-class">
              <div class="card-body">
                <h4 class="h2 mb-0" style="margin-bottom: 10px !important;">{{ calculatePrice(items) }} ($)</h4>
                <div>
                  ប្រាក់ចំនេញ សម្រាប់ខែនេះ
                </div>
              </div>
            </div>
          </b-col>
          <b-col lg="4">
            <div class="card border-1 border-left-3 border-left-accent text-center mb-lg-0 card-border-class">
              <div class="card-body">
                <h4 class="h2 mb-0" style="margin-bottom: 10px !important;">{{ calculateImportPrice(items) }} ($)</h4>
                <div>
                  ប្រាក់ដើម សម្រាប់ខែនេះ
                </div>
              </div>
            </div>
          </b-col>
          <b-col lg="4">
            <div class="card border-1 border-left-3 border-left-accent text-center mb-lg-0 card-border-class">
              <div class="card-body">
                <h4 class="h2 mb-0" style="margin-bottom: 10px !important;">{{ calculateSalePrice (items) }} ($)</h4>
                <div>
                  ប្រាក់លក់សរុប សម្រាប់ខែនេះ
                </div>
              </div>
            </div>
          </b-col>
        </b-row>
      </b-container>
    </div>
    <div style="width: 100%; display: inline-block; overflow:hidden; padding-top: 2rem;padding-bottom: 2rem;">
      <b-container>
        <div style="display:inline-block;width:100%; margin-bottom: 20px;">
          <div class="form-row-content-detail full-with">
            <div class="form-column-label">ស្វែងរកទិន្នន័យតាមខែ : </div>
            <div class="form-column-input width-50-percentage">
              <b-form-select style="width: 100% !important;" class="form-control select-content-inline" v-model="filterMonth" :options="optionMonths" v-on:change="changeFilterMonth(filterMonth)"></b-form-select>
            </div>
          </div>
        </div>
        <div class="content-loading" v-if="isLoading">
          <div class="spinner-grow text-muted"></div>
        </div>
        <div v-if="!isLoading">
          <b-table striped hover :items="items" :fields="fields"></b-table>

          <h4 style="display: none; font-weight: 900;">ទឹកប្រាក់សរុបប្រចាំថ្ងៃ : {{calculate(items) + "($)"}}</h4>
          <h3 v-if="items.length === 0 && !dateFilter">មិនមានទិន្នន័យនៃការលក់ទេ</h3>
        </div>
      </b-container>
    </div>
  </b-container>
</template>
<script>
import moment from 'moment';
export default {
  middleware: "local-auth",
  layout:'report',
  data(){
    return {
      items: [],
      fields: [
        {key: 'name', label: 'ឈ្មោះទំនិញ'},
        {key: 'import_qty', label: 'ចំនួនទិញចូល'},
        {key: 'import_price', label: 'តម្លៃទិញចូល ($)'},
        {key: 'sub_total_import_price', label: 'តម្លៃទិញចូលសរុប ($)'},
        {key: 'sale_qty', label: 'ចំនួនលក់ចេញ'},
        {key: 'sale_price', label: 'តម្លៃលក់ចេញ ($)'},
        {key: 'sub_total_sale_price', label: 'តម្លៃលក់ចេញសរុប ($)'},
      ],
      category: {},
      products: [],
      isLoading: false,
      dateFilter: new Date().toISOString().slice(0, 10),
      customers: [],
      customersList: [],
      warehouses: [{text: "ជ្រើសរើស ឃ្លាំងទំនិញ", value: null}],
      warehouse: null,
      optionMonths : [],
      filterMonth: parseInt(this.getCurrentMonth()),
    }
  },
  methods:{
    calculate(items){
      let total = [];
      Object.entries(items).forEach(([key, val]) => {
        total.push(val.grandtotal ? parseFloat(val.grandtotal) : 0) ;
      });
      return total.reduce(function(total, num){ return total + num }, 0);
    },
    async getCustomerList(){
      let self = this;
      await self.$axios.get('/api/customer').then(function (response) {
        if(response.hasOwnProperty("data") && response.data.hasOwnProperty("customer")){
          self.customersList = self.cloneObject(response.data.customer);
          for(let index=0; index < response.data.customer.length; index++){
            self.customers.push({text : response.data.customer[index]["name"], value : response.data.customer[index]["id"]});
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
    showModal(){
      this.$refs['brand-form-modal'].show();
    },
    async getProductList(){
      let vm = this;
      vm.products = [];

      await vm.$axios.get('/api/stock').then(function (response) {
        if(response && response.hasOwnProperty("data")){
          let dataResponse = response.data;
          if(dataResponse && dataResponse.length > 0){
            vm.totalRows = response.data.length;
            for(let i=0; i < dataResponse.length; i++){
              let productList = dataResponse[i].product;
              if(productList && productList.length > 0){
                for(let index=0; index < productList.length; index++){
                  let productItem =  { id: '', name: null, price : 0, currency:'USD', img :'', code : null};
                  productItem.id = productList[index].id;
                  productItem.en_name = productList[index].en_name;
                  productItem.kh_name = productList[index].kh_name;
                  productItem.name = productList[index].en_name + " (" + productList[index].kh_name + ")";
                  productItem.price = productList[index].sale_price;
                  productItem.img = productList[index].image !== "no image" ? vm.generateImageUrlDisplay(productList[index].image) : productList[index].image;
                  productItem.code = productList[index].code;
                  vm.products.push(productItem);
                }
              }
              else if(productList && productList.hasOwnProperty("id")){
                let productItem =  { id: '', name: null, price : 0, currency:'USD', img :'', code : null};
                productItem.id = productList.id;
                productItem.name = productList.en_name + " (" + productList.kh_name + ")";
                productItem.en_name = productList.en_name;
                productItem.kh_name = productList.kh_name;
                productItem.price = productList.sale_price;
                productItem.img = (productList.image !== "no image" && productList.image !== "no image created") ? vm.generateImageUrlDisplay(productList.image) : productList.image;
                productItem.code = productList.code;
                vm.products.push(productItem);
              }
            }
          }
        }
      }).catch(function (error) {
        console.log(error);
        vm.$toast.error("getting data error ").goAway(2000);
      });
    },
    async getAllOrderData($dateFilter){
      if($dateFilter){
        let self = this;
        self.items = [];
        self.isLoading = true;
        self.getFullDate();
        await self.$axios.post('/api/stock/detail' , $dateFilter).then(function (response) {
          self.isLoading = false;
          if(response && response.hasOwnProperty("data")){
            let orders = response.data.order;
            let purchases = response.data.purchase;
            let lastArray = (purchases.length < orders.length) ? orders.map((item, i) => Object.assign({}, item, purchases[i])) : purchases.map((item, i) => Object.assign({}, item, orders[i]));
            for(let i=0; i < lastArray.length; i++){
              let reportItem =[];

              let itemData = lastArray[i];
              let productItem = self.products.find(product => product.id === itemData.product_id);
              if(productItem){
                reportItem["product_id"] = productItem.id;
                reportItem["name"] = (productItem["en_name"] + " " + productItem["kh_name"]);

                reportItem["sale_qty"] = itemData.quantity ? parseInt(itemData.quantity) : 0;
                reportItem["sale_price"] = itemData.sellprice ? parseFloat(itemData.sellprice) : 0;
                reportItem["sub_total_sale_price"] = parseFloat(itemData.o_total) > 0 ? parseFloat(itemData.o_total) : 0;

                reportItem["import_qty"] = itemData.quantity ? parseInt(itemData.quantity) : 0;
                reportItem["import_price"] = itemData.unitprice ? parseFloat(itemData.unitprice) : 0;
                reportItem["sub_total_import_price"] = parseFloat(itemData.p_total) > 0 ? parseFloat(itemData.p_total) : 0;
              }
              self.items.push(reportItem);
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("getting data error ").goAway(2000);
        });
      }
    },
    filterDataCustomerList(itemId){
      if(this.customersList && this.customersList.length > 0){
        for(let index=0; index < this.customersList.length; index++){
          if(itemId === this.customersList[index].id){
            return this.customersList[index];
          }
        }
      }
    },
    generateImageUrlDisplay(img){
      if (typeof window !== "undefined") {
        if((img !== "no image" && img !== "no image created")){
          return (window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img) ;
        }
      }
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
    filterProduct(product_id){
      if(this.products && this.products.length > 0){
        for(let index=0; index < this.products.length; index++){
          if(product_id === this.products[index].id){
            return this.products[index];
          }
        }
      }
    },
    filterReport(){
      this.getAllOrderData(this.dateFilter);
    },
    getLastDayOfMonth(){
      let today = new Date();
      let month = (today.getMonth() + 1); //January is 0!
      return new Date(today.getFullYear(), month, 0);
    },
    getCurrentMonth(){
      let today = new Date();
      let mm = (today.getMonth() + 1);
      return ((mm < 10) ? ("0" + mm) : mm);
    },
    getFullDate($day){
      let today = new Date();
      let mm = (today.getMonth() + 1); //January is 0!
      let month = (mm < 10) ? ("0" + mm) : mm;
      let yyyy = today.getFullYear();

      return (yyyy + "-" + month + "-" + $day);
    },
    calculatePrice($list){
      let totalSalePrice = [];
      let totalImportPrice = [];

      Object.entries($list).forEach(([val]) => {
        totalSalePrice.push(val.sub_total_sale_price);
      });
      Object.entries($list).forEach(([val]) => {
        totalImportPrice.push(val.sub_total_import_price);
      });

      let totalImport = totalImportPrice.reduce(function(total, num) {
          return parseFloat((parseFloat(total) + parseFloat(num)).toFixed(2)) }
        , 0);
      let totalSale = totalSalePrice.reduce(function(total, num) {
          return parseFloat((parseFloat(total) + parseFloat(num)).toFixed(2)) }
        , 0);

      const lastPrice = (totalSale - totalImport);
      console.log(lastPrice);
      return parseFloat(lastPrice.toFixed(2));
    },
    calculateImportPrice($list){
      let totalImportPrice = [];
      Object.entries($list).forEach(([key, val]) => {
        totalImportPrice.push(val.sub_total_import_price);
      });

      return totalImportPrice.reduce(function(total, num) {
          return parseFloat((parseFloat(total) + parseFloat(num)).toFixed(2)) }
        , 0);
    },
    calculateSalePrice($list){
      let totalSalePrice = [];
      Object.entries($list).forEach(([key, val]) => {
        totalSalePrice.push(val.sub_total_sale_price);
      });

      return totalSalePrice.reduce(function(total, num) {
          return parseFloat((parseFloat(total) + parseFloat(num)).toFixed(2)) }
        , 0);
    },
    getListMonthName(){
      moment.locale('en'); // sets words language (optional if current locale is to be used)
      moment.months() // returns a list of months in the current locale (January, February, etc.)
      let months = moment.monthsShort();
      console.log(months);
      for(let index=0; index < months.length; index++){
        this.optionMonths.push({text : months[index], value: (index+1)})
      }
    },
    changeFilterMonth(filterMonth){
      let today = new Date();
      let mm = parseInt(filterMonth) > 10 ? "0" + parseInt(filterMonth): parseInt(filterMonth);

      let startDay = "01";
      let lastDay = new Date(today.getFullYear(), mm, 0).getDate();
      let yyyy = today.getFullYear();

      let dateFilter = {"from": (startDay + "-" + mm + "-" + yyyy), "to": (lastDay + "-" + mm + "-" + yyyy)};
      this.getAllOrderData(dateFilter);
    }
  },

  mounted() {
    this.getListMonthName();
    this.getProductList();
    this.getCustomerList();
    this.getWareHouseList();
    this.getAllOrderData({"from": this.getFullDate("01"), "to": this.getFullDate(this.getLastDayOfMonth().getDate())});
  }
}
</script>
