<template>
  <b-container fluid class="bv-example-row">
    <div class="main-page-content">
      <div class="control-panel">
        <div class="panel-top">
          <div class="content-panel-left" style="width: 20%;">
            <h3 class="head-title">{{$t('content_title_purchase')}}</h3>
          </div>
          <div class="content-panel-right content-panel-right-full-width" style="vertical-align: text-bottom; width: 80%;">
<!--            <div class="float-right">-->
<!--              <b-form-select  class="form-control input-content input-select-warehouse min-height-43-px" v-model="warehouse" :options="warehouses" @change="selectedWarehouse(warehouse)"></b-form-select>-->
<!--            </div>-->
<!--            <div class="float-right product" style="margin-right: 8px;">-->
<!--              <div class="content-search" >-->
<!--                <multiselect class="input-content content-multiple-select"-->
<!--                             v-model="product_select" :options="productOptions"-->
<!--                             track-by="name" label="name" :show-labels="false"-->
<!--                             :placeholder="$t('label_search_by_product')"-->
<!--                             @select="selectionChangeProduct"-->
<!--                             @remove="removeElement"></multiselect>-->
<!--              </div>-->
<!--            </div>-->
<!--            <div class="float-right" style="margin-right: 8px">-->
<!--              <div class="content-search" >-->
<!--                <multiselect class="input-content content-multiple-select"-->
<!--                             v-model="customer_select" :options="customerOptions"-->
<!--                             track-by="name" label="name" :show-labels="false"-->
<!--                             :placeholder="$t('label_search_by_customer')"-->
<!--                             @select="selectionChangeCustomer"-->
<!--                             @remove="removeElement"></multiselect>-->
<!--              </div>-->
<!--            </div>-->
          </div>
        </div>
      </div>
      <div class="content-product content-order-list">
        <div class="content-loading" v-if="isLoading">
          <div class="spinner-grow text-muted"></div>
        </div>
        <div v-if="!isLoading && items && items.length > 0">
          <b-table-simple style="display: none;">
            <b-thead class="table-header" style="padding-right: 15px;">
                  <b-tr class="tr-header">
                    <b-th class="th-header">{{ $t('label_date_purchase') }}</b-th>
                    <b-th class="th-header">{{ $t('label_purchase_by') }}</b-th>
                    <b-th class="th-header">{{ $t('label_supplier_name') }}</b-th>
                    <b-th class="th-header">{{ $t('label_product_name') }}</b-th>
                    <b-th class="th-header">{{ $t('label_quantity') }}</b-th>
                    <b-th class="th-header">{{ $t('label_import_price') }} ($)</b-th>
                    <b-th class="th-header">{{ $t('label_sub_total') }} ($)</b-th>
                    <b-th class="th-header">{{ $t('label_grand_total') }} ($)</b-th>
                  </b-tr>
                </b-thead>
            <b-tbody class="table-body max-height-57-vh">
              <b-tr class="table-body-tr" v-for="item in items" v-bind:key="item.purchase_id">
                <b-td class=" date content-td" >
                  <b class="content">{{ (item.date !== undefined ? item.date : "") }}</b>
                </b-td>
                <b-td class=" purchase_by content-td" >
                  <b class="content">{{ (item.purchase_by !== undefined ? item.purchase_by : "") }}</b>
                </b-td>
                <b-td class=" supplier content-td">
                  <b class="content">{{ (item.supplier !== undefined ? item.supplier : "") }}</b>
                </b-td>
                <b-td class=" name content-td">
                  <span class="content">{{ item.name !== undefined ? item.name : "" }}</span>
                </b-td>
                <b-td class=" quantity content-td">
                  <span class="content">{{ item.quantity !== undefined ? item.quantity : "" }}</span>
                </b-td>
                <b-td class=" unitprice content-td">
                  <span class="content">{{ item.unitprice !== undefined ? item.unitprice + "$" : ""}}</span>
                </b-td>
                <b-td class=" subtotal content-td">
                  <b class="content">{{ item.subtotal !== undefined ? (item.subtotal + "$") : "" }}</b>
                </b-td>
                <b-td class=" grand_total content-td">
                  <b class="content">{{ item.grand_total !== undefined ? (item.grand_total + "$") : "" }}</b>
                </b-td>
              </b-tr>
            </b-tbody>
          </b-table-simple>
          <table class="table table-purchase">
            <thead class="table-header">
              <tr class="tr-header">
                <th class="th-header" style="width: 10%;">{{ $t('label_date_purchase') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_purchase_by') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_supplier_name') }}</th>
                <th class="th-header" style="width: 17%;">{{ $t('label_product_name') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_quantity') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_import_price') }} ($)</th>
                <th class="th-header" style="width: 15%;">{{ $t('label_sub_total') }} ($)</th>
                <th class="th-header" style="width: 15%;">{{ $t('label_grand_total') }} ($)</th>
              </tr>
            </thead>
            <tbody class="table-body">
              <tr class="table-body-tr" v-for="item in items" v-bind:key="item.purchase_id">
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.date !== undefined ? item.date : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.purchase_by !== undefined ? item.purchase_by : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.supplier !== undefined ? item.supplier : "") }}</b>
                </td>
                <td class="content-td" style="width: 17%;">
                  <b class="content">{{ (item.name !== undefined ? item.name : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.quantity !== undefined ? item.quantity : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.unitprice !== undefined ? item.unitprice : "") }}</b>
                </td>
                <td class="content-td" style="width: 15%;">
                  <b class="content">{{ (item.subtotal !== undefined ? item.subtotal : "") }}</b>
                </td>
                <td class="content-td" style="width: 15%;">
                  <b class="content">{{ (item.grand_total !== undefined ? item.grand_total : "") }}</b>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </b-container>
</template>
<script>
export default {
  middleware: "local-auth",
  layout:'inventoryui',
  props: {
  },
  data() {
    return {
      isLoading: false,
      items: [],
      showData: false,
      warehouses : [],
      warehouseList: [],
      suppliers : [],
      supplierList : [],
      products: [],
      productSelectOptions:[]
    }
  },
  watch: {

  },
  methods:{
    async getListProduct(){
      let vm = this;
      vm.products = [];
      vm.productOptions= [];

      await vm.$axios.get('/api/product').then(function (response) {
        if(response && response.hasOwnProperty("data")){
          let dataResponse = response.data;
          if(dataResponse && dataResponse.length > 0){
            vm.totalRows = response.data.length;
            for(let i=0; i < dataResponse.length; i++){
              let productList = dataResponse[i];
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
                  vm.productOptions.push({name: (productList[index].en_name + " - " + productList[index].kh_name + " (" + productList[index].code + ")"), value: productItem.id})
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
                vm.productOptions.push({name: (productItem.en_name + " - " +productItem.kh_name + " (" + productItem.code + ")"), value: productItem.id})
              }
            }
          }
        }
      }).catch(function (error) {
        console.log(error);
        vm.$toast.error("getting data error ").goAway(2000);
      });
    },
    generateImageUrlDisplay(img){
      if (typeof window !== "undefined") {
        if((img !== "no image" && img !== "no image created")){
          return (window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img) ;
        }
      }
    },
    async getAllWarehouse(){
      let vm = this;
      vm.loadingFields.warehouseListLoading = true;
      vm.warehouseList = [];
      vm.warehouses = [];

      await vm.$axios.get('/api/warehouse').then(function (response) {
        vm.loadingFields.warehouseListLoading = false;
        if(response && response.hasOwnProperty("data")){
          if(response.data.data){
            let data = response.data.data;
            for(let index=0; index < data.length; index++){
              let warehouseItem =  { text: '', value: null};
              warehouseItem.text = data[index]["name"] + "(" + data[index]["address"] + ")";
              warehouseItem.value = data[index]["id"];
              vm.warehouses.unshift(warehouseItem);
              vm.warehouseList.unshift(data[index]);
            }
          }
        }
      }).catch(function (error) {
        console.log(error);
        vm.$toast.error("Getting data error").goAway(3000);
      });
    },
    async getAllSupplier(){
      let vm = this;
      await this.$axios.get('/api/supplier')
        .then(function (response) {
          vm.isLoading = false;
          if(response && response.hasOwnProperty("data")){
            vm.suppliers = vm.cloneObject(response.data);
            for(let index =0; index < response.data.length; index++){
              vm.supplierList.push({text: response.data[index]["name"], value:response.data[index]["id"]})
            }
          }
        }).catch(function (error) {
          console.log(error);
          vm.$toast.error("Getting data error").goAway(3000);
        });
    },
    async getDataPurchase(){
      let self = this;
      self.isLoading = true;
      self.items = [];
      await self.$axios.get('/api/purchase')
        .then(function (response) {
          self.isLoading = false;
          let data = self.cloneObject(response.data.data);
          if(data && data.length > 0){
            let itemPurchase = [];

            for(let index=0; index < data.length; index++){
              let purchaseItem = self.cloneObject(data[index]);
              let supplier = self.suppliers.find(item => item.id === purchaseItem["supplier_id"]);
              let user = self.cloneObject(self.$store.$cookies.get('user'));
              itemPurchase[purchaseItem.id] = [];
              let grandTotal = 0;

              if(purchaseItem.hasOwnProperty("purchasedetails") && purchaseItem["purchasedetails"] && purchaseItem["purchasedetails"].length > 0){
                for(let indexProduct = 0; indexProduct < purchaseItem["purchasedetails"].length; indexProduct++){
                  let purchaseDetailData = [];
                  let purchaseDetailItem = self.cloneObject(purchaseItem["purchasedetails"][indexProduct]);
                  let product = self.products.find(item => item.id === purchaseDetailItem.product_id);

                  if(product !== null && product !== undefined){
                    let createdDate = new Date(purchaseDetailItem.created_at);
                    let dd = createdDate.getDate();
                    let mm = createdDate.getMonth() + 1;
                    let day = (dd < 10) ? ('0' + dd) : dd;
                    let month = (mm < 10) ? ('0' + mm) : mm;
                    let yyyy = createdDate.getFullYear();
                    purchaseDetailData["date"] = (day + "/" + month + "/" + yyyy);
                    purchaseDetailData["name"] = product["en_name"] + " " + product["kh_name"];
                    purchaseDetailData["quantity"] = parseInt(purchaseDetailItem["quantity"]);
                    purchaseDetailData["unitprice"] = parseFloat(purchaseDetailItem["unitprice"]);
                    purchaseDetailData["product_id"] = product["id"] ;
                    purchaseDetailData["purchase_id"] = purchaseItem["id"];
                    purchaseDetailData["subtotal"] = (parseFloat(purchaseDetailItem["unitprice"]) * parseInt(purchaseDetailItem["quantity"]));
                    // grandTotal = (grandTotal + purchaseDetailData["subtotal"]);
                    // if((indexProduct + 1) === (purchaseItem["purchasedetails"].length)){
                    //   purchaseDetailData["grand_total"] = grandTotal;
                    //   console.log(grandTotal);
                    // }
                    itemPurchase[purchaseItem.id].push(purchaseDetailData);
                  }
                }
              }
              if(itemPurchase[purchaseItem.id] && itemPurchase[purchaseItem.id].length > 0){
                let grandTotal = itemPurchase[purchaseItem.id].reduce((sum, transaction) => {
                  return sum += transaction.subtotal;
                }, 0);
                for(let i=0; i< itemPurchase[purchaseItem.id].length; i++){
                  let itemData = [];
                  if(i === 0){
                    itemData["purchase_id"] = itemPurchase[purchaseItem.id][i].purchase_id;
                    itemData["purchase_by"] = user.name;
                    itemData["supplier"] =  supplier["name"];
                    itemData["batch"] =  purchaseItem["batch"];

                    itemData["product_id"] = itemPurchase[purchaseItem.id][i].product_id;
                    itemData["name"] = itemPurchase[purchaseItem.id][i].name;
                    itemData["quantity"] = itemPurchase[purchaseItem.id][i]["quantity"];
                    itemData["unitprice"] = itemPurchase[purchaseItem.id][i]["unitprice"];
                    itemData["date"] = itemPurchase[purchaseItem.id][i]["date"];
                    itemData["lengthDetail"] = itemPurchase[purchaseItem.id].length;
                    itemData["subtotal"] = itemPurchase[purchaseItem.id][i]["subtotal"];
                    itemData["grand_total"] = grandTotal;
                  }
                  else {
                    itemData["product_id"] = itemPurchase[purchaseItem.id][i].product_id;
                    itemData["name"] = itemPurchase[purchaseItem.id][i].name;
                    itemData["quantity"] = itemPurchase[purchaseItem.id][i]["quantity"];
                    itemData["unitprice"] = itemPurchase[purchaseItem.id][i]["unitprice"];
                    itemData["subtotal"] = itemPurchase[purchaseItem.id][i]["subtotal"];
                  }
                  self.items.push(itemData);
                }
              }
            }
          }
        })
        .catch(function (error) {
          console.log(error);
          self.$toast.success("Submit data getting error").goAway(3000);
        });
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
  },
  mounted() {
    this.getListProduct();
    this.getAllSupplier();
    this.getDataPurchase();
  }
}
</script>

<style scoped>
.table-purchase .table-header{
  display: inline-block;overflow: hidden;width: 100%;
}
.table-purchase .table-header .tr-header{
  display: inline-block;
  overflow: hidden;
  width: 99%;
  border-bottom: 1px solid #dee2e6;
}
.table-purchase .table-header .tr-header .th-header{
  vertical-align: top;
  text-align: left;
  padding: 12px 9px;
  display: inline-block;
  overflow: hidden;
  border: none;
}
.table-purchase .table-body{
  display: inline-block;
  overflow-y: scroll;
  width: 100%;
  max-height: 75vh;
}
.table-purchase .table-body .table-body-tr{
  display: inline-block;
  width: 100%;
  overflow: hidden;
  border-bottom: 1px solid #dee2e6;
}
.table-purchase .table-body .table-body-tr .content-td {
  display: inline-block;
  overflow: hidden;
  border-bottom: none;
  border-top: none;
  padding: 12px 9px;
}

</style>
