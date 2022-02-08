<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Daily Sale Transaction </h3>
            </div>
            <div class="content-panel-right">
              <b-container class="col-8 mx-auto menu-wrapper">
                <b-row>
                  <b-col>
                    <div class="input-group input-group-sm search-content">
             <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
            <input class="form-control input-search-box" type="search" placeholder="Search..."/>
          </div>
                  </b-col>
                  <div class="btn-wrapper" style="display:none;">
                    <b-button href="#"  title="Export as Excel" size="sm" variant="primary" @click="showModal()">
                      Excel
                      <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                    </b-button>
                  </div>
                  <div class="btn-wrapper" style="display:none;">
                    <b-button href="#"  title="Add new Category" size="sm" variant="primary" @click="showModal()">
                      Print
                      <i class="fa fa-print" aria-hidden="true"></i>
                    </b-button>
                  </div>
                </b-row>
              </b-container>
            </div>
            <div class="panel-bottom"></div>
          </div>
        </div>
        <div class="content-product">
          <div class="content-report-input-filter">
            <div class="display-inline-block width-50-percentage float-left">
              <b-form-input type="date" class="form-control select-content-inline display-inline-block" v-model="dateFilter" @keyup.enter="filterReport()"></b-form-input>
            </div>
          </div>
          <div class="content-table">
            <div class="content-loading" v-if="isLoading">
              <div class="spinner-grow text-muted"></div>
            </div>
            <div v-if="!isLoading">
              <b-table-simple v-if="items.length > 0">
                <b-thead>
                  <b-tr>
                    <b-th>Date</b-th>
                    <b-th>Sale by</b-th>
                    <b-th>Customer Name</b-th>
                    <b-th>Product Name</b-th>
                    <b-th>Qty</b-th>
                    <b-th>Sale Price ($)</b-th>
                    <b-th>Discount</b-th>
                    <b-th>Vat</b-th>
                    <b-th>Sub Total ($)</b-th>
                    <b-th>Grand Total ($)</b-th>
                  </b-tr>
                </b-thead>
                <b-tbody>
                  <b-tr v-for="item in items">
                    <b-td class="date" v-show="item.date" :rowspan="item.lengthDetail"><b>{{ item.date }}</b></b-td>
                    <b-td class="sale_by" v-show="item.sale_by" :rowspan="item.lengthDetail"><b>{{ item.sale_by }}</b></b-td>
                    <b-td class="customer" v-show="item.customer" :rowspan="item.lengthDetail"><b>{{ item.customer }}</b></b-td>
                    <b-td class="name" v-show="item.name">{{ item.name }}</b-td>
                    <b-td class="qty" v-show="item.qty">{{ item.qty }}</b-td>
                    <b-td class="sale_price" v-show="item.sale_price">{{ item.sale_price + "$"}}</b-td>
                    <b-td class="discount" v-show="item.discount > 0 || item.discount === 0" :rowspan="item.lengthDetail"><b>{{ item.discount === 0 ? "0" : item.discount + "%"}}</b></b-td>
                    <b-td class="vat" v-show="item.vat  >= 0" :rowspan="item.lengthDetail"><b>{{ item.vat === 0 ? 0 : item.vat + "%" }}</b></b-td>
                    <b-td class="subtotal" v-show="item.subtotal" :rowspan="item.lengthDetail"><b>{{ item.subtotal + "$"}}</b></b-td>
                    <b-td class="grandtotal" v-show="item.grandtotal" :rowspan="item.lengthDetail"><b>{{ item.grandtotal + "$"}}</b></b-td>
                  </b-tr>
                </b-tbody>
                <b-tfoot></b-tfoot>
              </b-table-simple>
              <h4 style="font-weight: 900;">ទឹកប្រាក់សរុបប្រចាំថ្ងៃ : {{calculate(items) + "($)"}}</h4>
              <h3 v-if="items.length === 0 && !dateFilter">មិនមានទិន្នន័យនៃការលក់ទេ</h3>
            </div>
          </div>
        </div>
      </div>
    </b-row>
  </b-container>
</template>
<script>
    export default {
        middleware: "local-auth",
        layout:'report',
        data(){
            return {
              items:[],
              fields: [
                    { key: 'name', label: 'Name' },
                    { key: 'date', label: 'Sall Date' },
                    { key: 'qty', label: 'Total Product' },
                    {key:'sale_by',label:'Sale By'}
                ],
              category:{},
              products : [],
              isLoading: false,
              dateFilter: new Date().toISOString().slice(0, 10),
              customers: [],
              customersList: [],
              warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
              warehouse: null,
            }
        },
        methods:{
          calculate(items){
            let total = [];
            Object.entries(items).forEach(([key, val]) => {
              total.push(val.grandtotal ? parseFloat(val.grandtotal) : 0) ;
            });
            console.log(total);
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
              await self.$axios.post('/api/sale/search', {dateFilter: $dateFilter}).then(function (response) {
                  self.isLoading = false;
                  if(response && response.hasOwnProperty("data")){
                    let itemOrder = [];
                    for(let indexOrder =0; indexOrder < response.data.length; indexOrder++){
                      let orderItem = response.data[indexOrder];
                      let customerItem = self.filterDataCustomerList(orderItem.customer_id);
                      let user = self.cloneObject(self.$store.$cookies.get('user'));
                      itemOrder[orderItem.id] = [];

                      if(orderItem.hasOwnProperty("orderdetails") && orderItem.orderdetails.length > 0){
                        for(let indexOrderDetail =0; indexOrderDetail < orderItem.orderdetails.length; indexOrderDetail++){
                          let itemOrderDetail = [];
                          let orderDetailItem = orderItem.orderdetails[indexOrderDetail];
                          let productData = self.filterProduct(orderDetailItem.product_id);
                          if(productData !== null && productData !== undefined){
                            let createdDate = new Date(orderDetailItem.created_at);
                            let dd = createdDate.getDate();
                            let mm = createdDate.getMonth() + 1;
                            let day = (dd < 10) ? ('0' + dd) : dd;
                            let month = (mm < 10) ? ('0' + mm) : mm;
                            let yyyy = createdDate.getFullYear();
                            itemOrderDetail["date"] = (day + "/" + month + "/" + yyyy);
                            itemOrderDetail["name"] = productData["en_name"] + " (" + productData["kh_name"] + ")";
                            itemOrderDetail["en_name"] = productData["en_name"];
                            itemOrderDetail["kh_name"] = productData["kh_name"] ;
                            itemOrderDetail["product_id"] = productData["id"] ;
                            itemOrderDetail["qty"] = parseInt(orderDetailItem.quantity);
                            itemOrderDetail["sale_price"] = productData["price"] ;
                            itemOrderDetail["order_id"] =orderDetailItem.order_id;
                            itemOrder[orderItem.id].push(itemOrderDetail);
                          }
                        }
                      }
                      for(let index=0; index < itemOrder[orderItem.id].length; index++){
                        let itemData = [];
                        if(index === 0){
                          itemData["order_id"] = orderItem.id;
                          itemData["sale_by"] = user.name;
                          if(customerItem){
                            itemData["customer"] = customerItem["name"];
                          }
                          itemData["discount"] = (orderItem["discount"] > 0 ? orderItem["discount"] : 0);
                          itemData["vat"] = ((orderItem.hasOwnProperty("vat") && orderItem["vat"] > 0) ? (orderItem["vat"] * 100) : 0);
                          itemData["lengthDetail"] = itemOrder[orderItem.id].length;
                          itemData["subtotal"] = orderItem["subtotal"];
                          itemData["grandtotal"] = orderItem["grandtotal"];

                          itemData["name"] = itemOrder[orderItem.id][index].name;
                          itemData["qty"] = itemOrder[orderItem.id][index]["qty"];
                          itemData["sale_price"] = itemOrder[orderItem.id][index]["sale_price"];
                          itemData["date"] = itemOrder[orderItem.id][index]["date"];
                        }
                        else {
                          itemData["name"] = itemOrder[orderItem.id][index].name;
                          itemData["qty"] = itemOrder[orderItem.id][index]["qty"];
                          itemData["sale_price"] = itemOrder[orderItem.id][index]["sale_price"];
                        }
                        self.items.push(itemData);
                      }
                    }
                    console.log(self.items);
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
          showModal(){
            this.$htmlToPaper("content-table");
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
