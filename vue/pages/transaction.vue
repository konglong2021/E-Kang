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
        <div class="content-product">
          <div>
            <div >
              <b-table-simple>
                <b-thead>
                  <b-tr>
                    <b-th>Sale by</b-th>
                    <b-th>Customer Name</b-th>
                    <b-th>Discount</b-th>
                    <b-th>Vat</b-th>
                    <b-th>Product Name</b-th>
                    <b-th>Qty</b-th>
                    <b-th>Date Sale</b-th>
                    <b-th>Action</b-th>
                  </b-tr>
                </b-thead>
                <b-tbody>
                  <b-tr v-for="item in items">
                    <b-td class="sale_by" v-show="item.sale_by" :rowspan="item.lengthDetail"><b>{{ item.sale_by }}</b></b-td>
                    <b-td class="customer" v-show="item.customer" :rowspan="item.lengthDetail"><b>{{ item.customer }}</b></b-td>
                    <b-td class="discount" v-show="item.discount > 0 || item.discount === 0" :rowspan="item.lengthDetail"><b>{{ item.discount === 0 ? "0" : item.discount }}</b></b-td>
                    <b-td class="vat" v-show="item.vat" :rowspan="item.lengthDetail"><b>{{ item.vat }}</b></b-td>
                    <b-td class="name" v-show="item.name">{{ item.name }}</b-td>
                    <b-td class="qty" v-show="item.qty">{{ item.qty }}</b-td>
                    <b-td class="date" v-show="item.date">{{ item.date }}</b-td>
                    <b-td v-show="item.order_id" :rowspan="item.lengthDetail">
                      <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                        <i class="fa fa-eye"></i>
                      </b-button>
                      <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustStock(row.item, row.index, $event.target)">
                        <i class="fa fa-edit"></i>
                      </b-button>
                    </b-td>
                  </b-tr>
                </b-tbody>
                <b-tfoot>
                </b-tfoot>
              </b-table-simple>

              <b-table style="display: none;" class="content-table-scroll"
                       sticky-header="true"
                       :items="items"
                       :fields="fields"
                       head-variant="light"
              >
              </b-table>
            </div>
          </div>
        </div>
      </div>
      <b-modal id="modal-submit-payment" ref="payment-form-modal" size="lg" modal-class="payment-form-modal"
               @hidden="onResetPayment" ok-only ok-variant="secondary" footer-class="justify-content-center"
               @ok="onSubmitPayment" ok-title="រក្សាទុក" title="ការលក់" no-close-on-backdrop>
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
                  <label :for="'input-exchange-rate'" class="label-input no-margin-bottom">បញ្ចូលអត្រាប្តូរប្រាក់រៀល</label>
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
            <span style="display: block;">{{$t('title_total_in_usd')}} : {{calculate("USD", items)}} USD</span>
            <span style="display: block;margin-top: 10px;">{{$t('title_total_after_vat_in_usd')}} : {{calculateIncludeTax(calculate("USD", items))}} USD</span>
            <span style="display: block;margin-top: 10px;" v-if="exchange_rate">{{$t('title_total_in_riel')}} : {{calculateToRiel(calculate("USD", items), exchange_rate)}} Riel</span>
          </div>
        </b-form>


        <div id="invoice-print" style="display: inline-block; width: 100%; height: 100%; overflow: hidden; padding: 30px 70px !important; font-family: 'Arial', 'Khmer OS Bokor', sans-serif !important;">
          <div style="margin-bottom: 30px; font-family: 'Arial', 'Khmer OS Bokor', sans-serif; display:inline-block">
            <h1 class="text-center" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{ $t('title') }}</h1>
          </div>
          <div class="full-content margin-bottom-20">
            <div class="container-row-form width-60-percentage float-left">
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-customer'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ឈ្មោះអតិថិជន : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{displayCustomerName(order.customer)}}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">បញ្ចូលអត្រាប្តូរប្រាក់រៀល : </label>
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
      </b-modal>
    </b-container>
  </div>
</template>
<script>

  export default {
    middleware: "local-auth",
    layout:'posui',
    data(){
      return {
        items: [],
        fields: [
          { key: 'sale_by', label: 'Sale by'},
          { key: 'customer', label: 'Customer Name'},
          { key: 'discount', label: 'Discount'},
          { key: 'vat', label: 'Vat'},
          { key: 'name', label: 'Product Name'},
          // { key: 'qty', label: 'Quantity' },
          // { key: 'grandtotal', label: 'Grand Total' },
          // { key: 'subtotal', label: 'Sub Total' },
        ],
        warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
        warehouse: null,
        products : [],
        isLoading: false,
        customers: [],
        customersList: [],
      }
    },
    methods: {
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
      async getAllOrderData(){
        let self = this;
        self.isLoading = true;
        self.items = [];

        await self.$axios.get('/api/sale').then(function (response) {
          self.isLoading = false;
          if(response && response.hasOwnProperty("data")){
            self.orders = response.data;
            let itemOrder = [];
            if(self.orders.length > 0){
              for(let indexOrder =0; indexOrder < self.orders.length; indexOrder++){
                let orderItem = self.orders[indexOrder];
                let customerItem = self.filterDataCustomerList(orderItem.customer_id);
                let user = self.cloneObject(self.$store.$cookies.get('user'));
                itemOrder[orderItem.id] = [];

                if(orderItem.hasOwnProperty("orderdetails") && orderItem.orderdetails.length > 0){
                  for(let indexOrderDetail =0; indexOrderDetail < orderItem.orderdetails.length; indexOrderDetail++){
                    let itemOrderDetail = [];
                    let orderDetailItem = orderItem.orderdetails[indexOrderDetail];
                    let productData = self.filterProduct(orderDetailItem);
                    if(productData !== null && productData !== undefined){
                      let createdDate = new Date(orderDetailItem.created_at);
                      let dd = createdDate.getDate();
                      let mm = createdDate.getMonth() + 1;
                      let day = (dd < 10) ? ('0' + dd) : dd;
                      let month = (mm < 10) ? ('0' + mm) : mm;
                      let yyyy = createdDate.getFullYear();
                      itemOrderDetail["date"] = (day + "/" + month + "/" + yyyy);
                      itemOrderDetail["name"] = productData["en_name"] + " (" + productData["kh_name"] + ")";
                      itemOrderDetail["qty"] = parseInt(orderDetailItem.quantity);
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
                    itemData["customer"] = customerItem["name"];
                    itemData["discount"] = (orderItem["discount"] > 0 ? orderItem["discount"] : 0);
                    itemData["vat"] = ((orderItem.hasOwnProperty("vat") && orderItem["vat"] > 0) ? (orderItem["vat"] * 100) : 0);
                    itemData["lengthDetail"] = orderItem.orderdetails.length;

                    itemData["name"] = itemOrder[orderItem.id][index].name;
                    itemData["qty"] = itemOrder[orderItem.id][index]["qty"];
                    itemData["date"] = itemOrder[orderItem.id][index]["date"];
                  }
                  else {
                    itemData["name"] = itemOrder[orderItem.id][index].name;
                    itemData["qty"] = itemOrder[orderItem.id][index]["qty"];
                    itemData["date"] = itemOrder[orderItem.id][index]["date"];
                  }
                  self.items.push(itemData);
                }
              }
              console.log(self.items);
            }

          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("getting data error ").goAway(2000);
        });
      },
      filterProduct(orderdetails){
        if(this.products && this.products.length > 0){
          for(let index=0; index < this.products.length; index++){
            if(orderdetails.product_id === this.products[index].id){
              return this.products[index];
            }
          }
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
      selectedWarehouse(warehouse){
        this.$emit('selectWarehouse', warehouse);
        if(warehouse){
          this.getListProduct(warehouse);
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
    },
    mounted() {
      this.warehouse = this.$store.$cookies.get('storeItem');
      if(this.$store.$cookies.get('storeItem')){
        this.getListProduct(this.$store.$cookies.get('storeItem'));
      }
      this.getCustomerList();
      this.getWareHouseList();
      this.getAllOrderData();
    }
  }
</script>

<style scoped></style>
