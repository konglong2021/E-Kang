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
          <table class="table table-purchase">
            <thead class="table-header">
              <tr class="tr-header">
                <th class="th-header" style="width: 10%;">{{ $t('label_date_purchase') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_purchase_by') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_supplier_name') }}</th>
                <th class="th-header" style="width: 15%;">{{ $t('label_product_name') }}</th>
                <th class="th-header" style="width: 7%;">{{ $t('label_quantity') }}</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_import_price') }} ($)</th>
                <th class="th-header" style="width: 10%;">{{ $t('label_sub_total') }} ($)</th>
                <th class="th-header" style="width: 15%;">{{ $t('label_grand_total') }} ($)</th>
                <th class="th-header" style="width: 10%;">{{ $t('title_action') }}</th>
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
                <td class="content-td" style="width: 15%;">
                  <b class="content">{{ (item.name !== undefined ? item.name : "") }}</b>
                </td>
                <td class="content-td" style="width: 7%;">
                  <b class="content">{{ (item.quantity !== undefined ? item.quantity : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.unitprice !== undefined ? item.unitprice : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;">
                  <b class="content">{{ (item.subtotal !== undefined ? item.subtotal : "") }}</b>
                </td>
                <td class="content-td" style="width: 15%;">
                  <b class="content">{{ (item.grand_total !== undefined ? item.grand_total : "") }}</b>
                </td>
                <td class="content-td" style="width: 10%;" :rowspan="item.lengthDetail">
                  <b-button size="sm" title="View data" class="btn-no-background">
                    <i class="fa fa-eye"></i>
                  </b-button>
                  <b-button size="sm" title="Edit order data" class="btn-no-background">
                    <i class="fa fa-edit"></i>
                  </b-button>
                  <b-button size="sm" title="Remove order data" class="btn-no-background-danger">
                    <i class="fa fa-trash"></i>
                  </b-button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <b-modal
            id="modal-edit-purchase" ref="edit-purchase-form-modal"
            size="lg" modal-class="payment-form-modal"
            @hidden="onResetEditPayment" ok-only ok-variant="secondary" footer-class="justify-content-center"
            @ok="handleSubmit" ok-title="កែប្រែ" title="ការនាំទំនិញចូល" no-close-on-backdrop>
        <b-form enctype="multipart/form-data" @submit.stop.prevent="onSubmitEditPurchase">
          <div class="float-left width-48-percentage float-left" style="margin-right: 15px;">
            <b-row>
              <b-col md="12" style="margin-bottom: 10px;">
                <label class="label-with">{{$t('title_supplier')}}</label>
                <b-form-select class="form-control select-content-inline" v-model="purchase.supplier" :options="suppliers"></b-form-select>
              </b-col>
              <b-col md="12">
                <label class="label-with">{{ $t('title_warehouse') }}</label>
                <b-form-select class="form-control select-content-inline" v-model="purchase.warehouse" :options="warehouses"></b-form-select>
              </b-col>
            </b-row>
          </div>
          <div class="float-left width-50-percentage float-right">
            <b-row>
              <b-col md="12" style="margin-bottom: 10px;">
                <label class="label-with">ពន្ធ</label>
                <b-form-select class="form-control select-content-inline" v-model="purchase.vat" :options="vats"></b-form-select>
              </b-col>
              <b-col md="12">
                <label class="label-with">Batch</label>
                <b-form-input class="form-control select-content-inline display-inline-block" v-model="purchase.batch"></b-form-input>
              </b-col>
            </b-row>
          </div>
        </b-form>
    </b-modal>
    <b-modal id="modal-confirm-remove" ref="confirm-remove-form-modal" size="md"
             @hidden="onResetConfirm" ok-variant="secondary" footer-class="justify-content-center"
             @ok="onSubmitToRemove" ok-title="បាទ/ចាស" cancel-title="បោះបង់" title="ការលក់" no-close-on-backdrop>
      <h4 style="text-align: center;">ទិន្នន័យមួយនេះ និងត្រូវលុបចេញ?</h4>
    </b-modal>

  </b-container>
</template>
<script>
import $ from "jquery";

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
      productSelectOptions:[],
      purchaseList: [],
      purchase: {},
      itemsProductDetail: [],
      fieldsProductDetail: [
        { key: 'name', label: 'ឈ្មោះទំនិញ', thClass: "header-th", thStyle : "font-size: 17px;"},
        { key: 'quantity', label: 'ចំនួន', thClass: "header-th", thStyle : "font-size: 17px; width: 15%;"},
        { key: 'unitprice', label: 'តម្លៃឯកតា ($)', thClass: "header-th", thStyle : "font-size: 17px;width: 15%;"},
        { key: 'total', label: 'តម្លៃសរុប ($)', thClass: "header-th" , thStyle : "font-size: 17px;"},
        { key: 'action', label: this.$t('title_action'), thClass: "header-th", thStyle : "font-size: 17px;"},
      ],
      dataSelectToRemove: null,
      tr_id_select: null,
      vats: [{text: '0%', value: 0}, {text: '5%', value: 0.05}, {text: '10%', value: 0.1}, {text: '15%', value: 0.15}],
    }
  },
  watch: {},
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
      vm.warehouseList = [];
      vm.warehouses = [];

      await vm.$axios.get('/api/warehouse').then(function (response) {
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
          if(response && response.hasOwnProperty("data")){
            vm.suppliers = vm.cloneObject(response.data);
            console.log(response.data);

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
            self.purchaseList = self.cloneObject(data);
            let itemPurchase = [];

            for(let index=0; index < data.length; index++){
              let purchaseItem = self.cloneObject(data[index]);
              let supplier = self.suppliers.find(item => item.value === purchaseItem["supplier_id"]);
              let user = self.cloneObject(self.$store.$cookies.get('user'));
              itemPurchase[purchaseItem.id] = [];

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
                    itemData["purchase_id"] = itemPurchase[purchaseItem.id][i].purchase_id ? itemPurchase[purchaseItem.id][i].purchase_id : purchaseItem.id;
                    itemData["purchase_by"] = user.name;
                    itemData["supplier"] =  supplier["text"];
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
    viewOrderData(){

    },
    UpdateOrderData(item, $target){
      let purchaseDetailList = [];
      let purchaseDetailArray = [];
      let listProductAlreadyAdd = [];
      if(this.purchaseList.length > 0){
        let purchaseItem = this.purchaseList.find(row => row.id === item.order_id);

        if(purchaseItem && purchaseItem.hasOwnProperty("id")){
          this.purchase.warehouse = purchaseItem["warehouse_id"];
          this.purchase.batch = purchaseItem["batch"];
          this.purchase.supplier = purchaseItem["supplier_id"];
          purchaseDetailList = this.cloneObject(purchaseItem["purchasedetails"]);
        }
        if(purchaseDetailList && purchaseDetailList.length > 0){
          for(let indexPurchase = 0; indexPurchase < purchaseDetailList.length; indexPurchase++){
            let productIdSelected = purchaseDetailList[indexPurchase]["product_id"];
            let data = {};
            let productItem = this.products.find(dataProduct=>dataProduct.id === productIdSelected);

            if(productItem){
              data["id"] =  productItem["id"];
              data["name"] = productItem["name"];
              data["quantity"] = parseInt(purchaseDetailList[indexPurchase]["quantity"]);
              data["unitprice"] = purchaseDetailList[indexPurchase]["sellprice"];
              let subtotal = (parseFloat(purchaseDetailList[indexPurchase]["unitprice"]) * parseInt(purchaseDetailList[indexPurchase]["quantity"]));
              data["subtotal"] = subtotal;
              listProductAlreadyAdd.push(productItem["id"]);
              purchaseDetailArray.push(data);
            }
          }
        }
        this.productSelectOptions = this.productSelectOptions.filter(function (element) {
          return listProductAlreadyAdd.includes(element.value) === false;
        });
        this.itemsProductDetail = this.cloneObject(purchaseDetailArray);
      }

      this.$refs['edit-purchase-form-modal'].show();
    },
    onResetEditPayment(){},
    handleSubmit(){},
    onSubmitEditPurchase(){},

    openConfirmToRemove(row){
      this.dataSelectToRemove = row;
      this.tr_id_select = row["purchase_id"];
      this.$refs['confirm-remove-form-modal'].show();
    },
    onResetConfirm(){},
    async onSubmitToRemove(){
      let self = this;
      if(self.dataSelectToRemove && self.dataSelectToRemove.hasOwnProperty("purchase_id")){
        await self.$axios.delete('/api/purchase/delete/' + self.dataSelectToRemove.purchase_id).then(function (response) {
          $("#tr-" + self.dataSelectToRemove.purchase_id).fadeOut(1000);
          self.$refs["confirm-remove-form-modal"].hide();
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("getting data error ").goAway(2000);
        });
      }
    },
  },
  mounted() {
    this.getListProduct();
    this.getAllWarehouse();
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
