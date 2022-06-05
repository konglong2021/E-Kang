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
                  ប្រាក់ចំនេញ សម្រាប់ថ្ងៃនេះ
                </div>
              </div>
            </div>
          </b-col>
          <b-col lg="4">
            <div class="card border-1 border-left-3 border-left-accent text-center mb-lg-0 card-border-class">
              <div class="card-body">
                <h4 class="h2 mb-0" style="margin-bottom: 10px !important;">{{ calculateImportPrice(items) }} ($)</h4>
                <div>
                  ប្រាក់ដើម សម្រាប់ថ្ងៃនេះ
                </div>
              </div>
            </div>
          </b-col>
          <b-col lg="4">
            <div class="card border-1 border-left-3 border-left-accent text-center mb-lg-0 card-border-class">
              <div class="card-body">
                <h4 class="h2 mb-0" style="margin-bottom: 10px !important;">{{ calculateSalePrice (items) }} ($)</h4>
                <div>
                  ប្រាក់លក់សរុប សម្រាប់ថ្ងៃនេះ
                </div>
              </div>
            </div>
          </b-col>
        </b-row>
      </b-container>
    </div>
    <div style="width: 100%; display: inline-block; overflow:hidden; padding-top: 2rem;padding-bottom: 2rem;">
      <b-container>
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
          let lastDayOfCurrentMonth = self.getLastDayOfMonth().getDate();
          self.isLoading = true;
          self.getFullDate();
          await self.$axios.post('/api/stock/detail' , {"from": self.getFullDate("01"), "to": self.getFullDate(lastDayOfCurrentMonth)}, {dateFilter: $dateFilter}).then(function (response) {
              self.isLoading = false;
              if(response && response.hasOwnProperty("data")){
                let orders = response.data.order;
                let purchases = response.data.purchase;
                let lastArray;
                if(purchases.length > orders.length){
                  lastArray = purchases.map((item, i) => Object.assign({}, item, orders[i]));
                }
                else if(purchases.length < orders.length){
                  lastArray = orders.map((item, i) => Object.assign({}, item, purchases[i]));
                }
                for(let i=0; i < lastArray.length; i++){
                  let reportItem =[];

                  let itemData = lastArray[i];
                  let productItem = self.products.find(product => product.id === itemData.product_id);
                  if(productItem){
                    reportItem["product_id"] = productItem.id;
                    reportItem["name"] = (productItem["en_name"] + " " + productItem["kh_name"]);

                    reportItem["sale_qty"] = itemData.quantity ? parseInt(itemData.quantity) : 0;
                    reportItem["sale_price"] = itemData.sellprice ? parseFloat(itemData.sellprice) : 0;
                    reportItem["sub_total_sale_price"] = itemData.o_total ? parseFloat(itemData.o_total) : 0;

                    reportItem["import_qty"] = itemData.quantity ? parseInt(itemData.quantity) : 0;
                    reportItem["import_price"] = itemData.unitprice ? parseFloat(itemData.unitprice) : 0;
                    reportItem["sub_total_import_price"] = itemData.p_total ? parseFloat(itemData.p_total) : 0;
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
        return new Date(2008, month, 0);
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

        Object.entries($list).forEach(([key, val]) => {
          totalSalePrice.push(val.sub_total_sale_price);
        });
        Object.entries($list).forEach(([key, val]) => {
          totalImportPrice.push(val.sub_total_import_price);
        });

        let totalImport = totalImportPrice.reduce(function(total, num) {
            return parseFloat((parseFloat(total) + parseFloat(num)).toFixed(2)) }
          , 0);
        let totalSale = totalSalePrice.reduce(function(total, num) {
            return parseFloat((parseFloat(total) + parseFloat(num)).toFixed(2)) }
          , 0);

        return (totalSale - totalImport);
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
      }
},

    mounted() {
      this.getProductList();
      this.getCustomerList();
      this.getWareHouseList();
      if(this.dateFilter){
        console.log(this.dateFilter);
        this.getAllOrderData(this.dateFilter);
      }
    }
}
</script>
