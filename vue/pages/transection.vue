<template>
  <div>
    <b-container fluid class="bv-example-row">
      <div class="main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Order Overview</h3>
            </div>
            <div class="content-panel-right content-panel-right-full-width">
              <div class="float-right">
                <b-form-select  class="form-control input-content input-select-warehouse" v-model="warehouse" :options="warehouses" @change="selectedWarehouse(warehouse)"></b-form-select>
              </div>
            </div>
          </div>
        </div>
        <b-table class="content-table-scroll"
                 sticky-header="true"
                 :items="orders"
                 :fields="fields"
                 head-variant="light"
        >
        </b-table>
      </div>
    </b-container>
  </div>
</template>
<script>

  export default {
    middleware: "local-auth",
    layout:'posui',
    data(){
      return {
        orders: [],
        fields: [
          { key: 'sale_by', label: 'Sale by' },
          { key: 'name', label: 'Product Name' },
          { key: 'customer_id', label: 'Customer Name' },
          { key: 'discount', label: 'Discount' },
          { key: 'grandtotal', label: 'Grand Total' },
          { key: 'subtotal', label: 'Sub Total' },
          { key: 'vat', label: 'Vat' },
          { key: 'qty', label: 'Quantity' },
        ],
        warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
        warehouse: null,
        products : [],
      }
    },
    methods: {
      async getAllOrderData(){
        let self = this;
        await self.$axios.get('/api/sale').then(function (response) {
          if(response && response.hasOwnProperty("data")){
            self.orders = response.data;
            let itemOrder = [];

            if(self.orders.hasOwnProperty("orderdetails")){
              let orderdetails = self.orders.orderdetails;
              if(orderdetails.length > 0){
                for (let i=0; i < orderdetails.length; i++){
                  let productData = self.cloneObject(self.filterProduct(orderdetails[i]));
                  if(productData !== null && productData !== undefined){
                    let createdDate = new Date(orderdetails[i].created_at);
                    let dd = createdDate.getDate();
                    let mm = createdDate.getMonth() + 1;
                    let day = (dd < 10) ? ('0' + dd) : dd;
                    let month = (mm < 10) ? ('0' + mm) : mm;
                    let yyyy = createdDate.getFullYear();
                    itemOrder["date"] = (day + "/" + month + "/" + yyyy);
                    let user = self.cloneObject(self.$store.$cookies.get('user'));
                    itemOrder["sale_by"] = user["name"];
                    itemOrder["name"] = productData["en_name"] + " (" + productData["kh_name"] + ")";
                    itemOrder["qty"] = parseInt(orderdetails[i].quantity);
                    self.items.push(itemOrder);
                  }
                }
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("getting data error ").goAway(2000);
        });
      },
      async getListProduct($warehouse){
        let vm = this;
        vm.products = [];
        vm.productLoading = true;
        if($warehouse){
          await vm.$axios.get('/api/stockbywarehouse/' + $warehouse).then(function (response) {
            if(response && response.hasOwnProperty("data")){
              vm.productLoading = false;
              let dataResponse = response.data;
              if(dataResponse && dataResponse.length > 0){
                vm.totalRows = response.data.length;
                for(let i=0; i < dataResponse.length; i++){
                  let productList = dataResponse[i].product;
                  if(productList && productList.length > 0){
                    for(let index=0; index < productList.length; index++){
                      let productItem =  { id: '', name: null, price : 0, currency:'USD', img :'', code : null};
                      productItem.id = productList[index].id;
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
        }
        else {
          await vm.$axios.get('/api/stocksell').then(function (response) {
            if(response && response.hasOwnProperty("data")){
              vm.productLoading = false;
              let dataResponse = response.data;
              if(dataResponse && dataResponse.length > 0){
                vm.totalRows = response.data.length;
                for(let i=0; i < dataResponse.length; i++){
                  let productList = dataResponse[i].product;
                  if(productList && productList.length > 0){
                    for(let index=0; index < productList.length; index++){
                      let productItem =  { id: '', name: null, price : 0, currency:'USD', img :'', code : null};
                      productItem.id = productList[index].id;
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
        }
      },
      selectedWarehouse(warehouse){
        this.$emit('selectWarehouse', warehouse);
        if(warehouse){
          this.getListProduct(warehouse);
        }
      },
    },

    mounted() {
      this.getAllOrderData();
    }
  }
</script>

<style scoped></style>
