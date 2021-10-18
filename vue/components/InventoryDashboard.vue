<template>
  <div class="inventory-dashboard-content main-page-content">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h3 class="head-title">Inventory Overview</h3>
        </div>
        <div class="content-panel-right">
           <b-container class="col-12 mx-auto menu-wrapper">
            <b-row>
              <b-col>
                <div class="input-group input-group-sm search-content">
                  <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                  <input class="form-control input-search-box" type="search" placeholder="Search..."/>
                </div>
              </b-col>

              <div class="btn-wrapper">
                <b-button href="#" size="sm" variant="primary" title="Import product from Supplier">
                  Import<i class="fa fa-cart-plus" aria-hidden="true"></i>
                </b-button>
              </div>
              <div class="btn-wrapper margin-right-20-percentage">
                <b-button href="#" title="Add new Product" size="sm" variant="primary" @click="showModal()">
                  New Product<i class="fa fa-plus" aria-hidden="true"></i>
                </b-button>
              </div>
              <div class="btn-wrapper margin-right-20-percentage">
                <b-button href="#" title="Add new Supplier" size="sm" variant="primary"  @click="showSupplierModal()">
                  New Supplier<i class="fa fa-plus" aria-hidden="true"></i>
                </b-button>
              </div>
              <div class="btn-wrapper">
                <b-button href="#" title="Add new WareHouse" size="sm" variant="primary"  @click="showWareHouseModal()">
                  New WareHouse<i class="fa fa-plus" aria-hidden="true"></i>
                </b-button>
              </div>
            </b-row>
           </b-container>
        </div>
        <div class="panel-bottom"></div>
      </div>
    </div>
    <div class="content-product">
      <div class="btn-wrapper margin-btn" v-if="!isShowFormAddProductInPurchase">
        <b-button href="#" size="sm" variant="primary" title="Add new purchase record" @click="showPurchaseModal()">
          new purchase<i class="fa fa-plus" aria-hidden="true"></i>
        </b-button>
      </div>
      <div class="display-inline-block" v-if="isShowFormAddProductInPurchase" style="margin-bottom: 10px; width: 30%;">
        <div>
            <label class="label-with">Supplier</label>
            <b-form-select class="form-control select-content-inline" v-model="purchase.supplier" :options="suppliers"></b-form-select>
        </div>
        <div>
          <label class="label-with">Store</label>
          <b-form-select class="form-control select-content-inline" v-model="purchase.warehouse" :options="warehouses"></b-form-select>
        </div>
        <div style="margin-bottom: 20px;">
          <label class="label-with">Vat</label>
          <b-form-select class="form-control select-content-inline" v-model="purchase.vat" :options="vats"></b-form-select>
        </div>
        <b-button
          href="#" size="sm" variant="primary"
          title="Add product to purchase"
          @click="showExistingProductModal()">Add product to purchase</b-button>
        <b-button
          v-show="purchase.supplier && purchase.warehouse && this.items.length > 0"
          href="#" size="sm" variant="primary"
          title="Save purchase" @click="submitPurchase()"
        >Save purchase</b-button>
      </div>
      <div style="margin-top: 5px;" v-if="isShowFormAddProductInPurchase">
        <h4 style="font-weight: 700;">Product list</h4>
        <b-table
          :items="items"
          :fields="fields"
          stacked="md"
          show-empty
          small

        >
          <template #cell(actions)="row">
            <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
              <i class="fa fa-eye"></i>
            </b-button>
            <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustStock(row.item, row.index, $event.target)">
              <i class="fa fa-edit"></i>
            </b-button>
          </template>
          <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
        </b-table>
      </div>
      <div v-if="!isShowFormAddProductInPurchase">
          <b-table
            :items="purchaseItems"
            :fields="purchaseFields"
            stacked="md"
            show-empty
            small

          >
            <template #cell(actions)="row">
              <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                <i class="fa fa-eye"></i>
              </b-button>
              <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustStock(row.item, row.index, $event.target)">
                <i class="fa fa-edit"></i>
              </b-button>
            </template>
            <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
          </b-table>
      </div>
    </div>

    <add-new-product-modal v-model="newProductModal" @checkingProductAdd="checkingProductAdd($event)" /> <!--no need to import it will automatically rendering it -->
    <b-modal id="modal-create-supplier" ref="supplier-form-modal" size="lg"
             @hidden="onResetSupplier" cancel-title="Cacnel"
             @ok="onSubmitSupplier" ok-title="Save" title="New Supplier">
      <b-form enctype="multipart/form-data">
        <div class="full-content">
        </div>
        <div class="full-content">
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-name'" class="label-input">Name</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-name'" type="text" v-model="supplier.name" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-address'" class="label-input">Address</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-address'" type="text" v-model="supplier.address" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-email'" class="label-input">Email</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-email'" type="email" v-model="supplier.email" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-phone'" class="label-input">Phone number</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-phone'" class="input-content" v-model="supplier.phone"></b-form-input>
            </b-col>
          </b-row>
        </div>
      </b-form>
    </b-modal>
    <b-modal id="modal-create-warehouse" ref="warehouse-form-modal" size="lg"
             @hidden="onResetWareHouse" cancel-title="Cacnel"
             @ok="onSubmitWareHouse" ok-title="Save" title="New Warehouse">
      <b-form enctype="multipart/form-data">
        <div class="full-content">
        </div>
        <div class="full-content">
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-name'" class="label-input">Name</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-name'" type="text" v-model="warehouse.name" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-address'" class="label-input">Address</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-address'" type="text" v-model="warehouse.address" class="input-content"></b-form-input>
            </b-col>
          </b-row>
        </div>
      </b-form>
    </b-modal>
    <b-modal id="modal-create-existing-product" ref="existing-product-form-modal" size="lg"
             @hidden="onResetExistingProduct" cancel-title="Cacnel"
             @ok="onSubmitExistingProduct(product_select)" ok-title="Save" title="Add Product">
      <b-form enctype="multipart/form-data">
        <div class="full-content" v-if="products && products.length > 0">
          <div class="display-inline-block full-with">
            <div class="col-md-12 float-right">
              <div class="form-group form-content-detail">
                <label class="label-with">Product</label>
                <b-form-select class="form-control select-content-inline" v-model="product_select.product" :options="products" @change="selectedProduct(productList, product_select.product)"></b-form-select>
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">Import price</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.import_price"></b-form-input>
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">Qty</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.qty"></b-form-input>
              </div>
            </div>
          </div>
        </div>
      </b-form>
    </b-modal>
  </div>
</template>

<script>
  import {empty} from "../.nuxt/utils";

  export default {
    data() {
      return {
        newProductModal:{
          showModal:false
        },
        loadingFields: [],
        items:[],
        fields: [
          { key: 'en_name', label: 'Name' },
          { key: 'kh_name', label: 'Name(KH)' },
          { key: 'code', label: 'QR Code' },
          { key: 'sale_price', label: 'Sell Price' },
          { key: 'import_price', label: 'Import Price' },
          { key: 'qty', label: 'Qty' },
          { key: 'actions', label: 'Actions' }
        ],
        purchaseItems:[],
        purchaseFields: [
          { key: 'en_name', label: 'Name' },
          { key: 'kh_name', label: 'Name(KH)' },
          { key: 'code', label: 'QR Code' },
          { key: 'sale_price', label: 'Sell Price' },
          { key: 'import_price', label: 'Import Price' },
          { key: 'qty', label: 'Qty' },
          { key: 'store', label: 'Store' },
          { key : 'supplier', label: "Supplier"},
          { key: 'actions', label: 'Actions' }
        ],
        product: {
          en_name: '',
          kh_name: '',
          category: null,
          brand: null,
          description: '',
          image: null,
          sale_price: 0,
          code: null,
        },
        categories: [{ text: 'Select One', value: null }, {text: 'Screen', value: 1}, {text: 'Headset', value: 2}, {text: 'chargers', value: 3}],
        brands: [{ text: 'Select One', value: null }, {text: 'Samsung', value: 1}, {text: 'PUB G', value: 2}],
        supplier: {},
        warehouse: {},
        purchase: {
          import_price: 0,
          product : null,
          supplier: null,
          warehouse: null,
          subtotal: 0,
          grandtotal: 0,
          qty: 0,
          batch: null
        },
        products: [],
        productList: [],
        suppliers: [],
        warehouses: [],
        isAddMoreProduct : false,
        isShowFormPurchase: false,
        isAddExistingProduct: false,
        isShowFormAddProductInPurchase: false,
        purchase_product_selected: [],
        product_select: {
          en_name: '',
          kh_name: '',
          code: null,
          sale_price: 0,
          qty: 0,
          store: null,
          id: '',
        },
        vats: [{text: '0%', value: 0}, {text: '5%', value: 0.05}, {text: '10%', value: 0.1}, {text: '15%', value: 0.15}],
      };
    },
    watch:{
      newProductModal:{
          handler(val){
          },
          deep:true
      }
    },
    methods: {
      checkAddProduct(){
        this.isAddExistingProduct = !this.isAddExistingProduct;
      },
      async onResetExistingProduct(){
        this.product_select = {};
      },
      onSubmitExistingProduct($product){
        if(this.items && this.items.length > 0){
          let index = 0,isFound = false;
          for (let i=0; i < this.items.length; i++){
            if(this.items[i]["id"] === $product["id"]){
              index = i;
              isFound = true;
              break;
            }
          }
          if(isFound === true){
            this.items[index]["qty"] = parseInt(this.items[index]["qty"]) + parseInt($product["qty"]);
          }
          else {
            this.items.push($product);
          }
        }
        else {
          this.items.push($product);
        }
      },
      showExistingProductModal(){
        this.$refs['existing-product-form-modal'].show();
      },

      async getProductList(){
        let vm = this;
        await this.$axios.get('/api/product').then(function (response) {
            if(response && response.hasOwnProperty("data")){
              this.$toast.success("submit data is successfully").goAway(1500);
              let dataResponse = response.data.data;
              if(dataResponse){
                for(let index=0; index < dataResponse.length; index++){
                  let productItem =  { text: '', value: null};
                  productItem.text = dataResponse[index].en_name + " (" + dataResponse[index].kh_name + ")";
                  productItem.value = dataResponse[index].id;
                  this.products.push(productItem);
                  this.productList.push(dataResponse[index]);
                }
              }
            }
        }).catch(function (error) {
          vm.$toast.error("submit data is getting error").goAway(2000);
          console.log(error);
        });
      },
      async getAllWarehouse(){
        let vm = this;
        await this.$axios.get('/api/warehouse').then(function (response) {
           if(response && response.hasOwnProperty("data")){
             this.$toast.success("submit data is successfully").goAway(1500);
             if(response.data.data){
               let data = response.data.data;
               for(let index=0; index < data.length; index++){
                 let warehouseItem =  { text: '', value: null};
                 warehouseItem.text = data[index]["name"] + "(" + data[index]["address"] + ")";
                 warehouseItem.value = data[index]["id"];
                 this.warehouses.push(warehouseItem);
               }
             }
           }
        }).catch(function (error) {
          vm.$toast.error("submit data is getting error").goAway(2000);
          console.log(error);
        });
      },
      async getAllSupplier(){
        let vm = this;
        await this.$axios.get('/api/supplier')
          .then(function (response) {
            if(response && response.hasOwnProperty("data")){
              this.$toast.success("submit data is successful").goAway(1500);
              if(response.data.data){
                let data = response.data.data;
                for(let index=0; index < data.length; index++){
                  let supplierItem =  { text: '', value: null};
                  supplierItem.text = data[index]["name"] + "(" + data[index]["address"] + ")";
                  supplierItem.value = data[index]["id"];
                  this.suppliers.push(supplierItem);
                }
              }
            }

          }).catch(function (error) {
            if(!empty(error)) {
              vm.$toast.error("submit data is getting error").goAway(2000);
            }
            console.log(error);
          });

      },

      selectedProduct(productList, productId){
        this.isAddMoreProduct = true;
        if(productList &&  productList.length > 0){
          for(let index = 0; index < productList.length; index++) {
            if(productId === productList[index]["id"]){
              this.product_select.id = productList[index].id;
              this.product_select.en_name = productList[index].en_name;
              this.product_select.kh_name = productList[index].kh_name;
              this.product_select.code = productList[index].code;
              this.product_select.sale_price = parseFloat(productList[index].sale_price);
              break;
            }
          }
        }
      },

      async getAllData(){
        let vm = this;
        await this.$axios.get('/api/purchase')
          .then(function (response) {
            if(response){
              this.$toast.success("submit data is successful").goAway(1500);
            }
          })
          .catch(function (error) {
            if(!empty(error)){
              vm.$toast.error("submit data is getting error").goAway(2000);
            }
            console.log(error);
          });
      },
      viewDetail(item,index,target){
        this.$toast.error('Error while authenticating');
        alert('detail click ' + index);
      },
      adjustStock( item,index,target ){
           alert('adjust stock click '+index);
      },

      showModal(){
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component
        this.newProductModal.showModal = true;
        //alert('Debug me , I am going to popup the modal');
        //console.log('modal data' ,this.newProductModal);
      },

      showSupplierModal(){
        this.$refs['supplier-form-modal'].show();
      },
      onResetSupplier(){},
      onSubmitSupplier(){
        let vm = this;
        this.$toast.info("submit data in progress").goAway(1000);
        this.$axios.post('/api/supplier', this.supplier)
          .then(function (response) {
            if(response){
              vm.$toast.success("submit data is successful").goAway(1500);
            }
            this.hideModal();
          })
          .catch(function (error) {
            this.$toast.error("submit data is getting error").goAway(2000);
            console.log(error);
          });
      },

      showWareHouseModal(){
        this.$refs['warehouse-form-modal'].show();
      },

      onResetWareHouse(){},
      onSubmitWareHouse(){
        let vm = this;
        this.$toast.info("submit data in progress").goAway(1000);
        this.$axios.post('/api/warehouse', this.warehouse)
          .then(function (response) {
            if(response){
              this.$toast.success("submit data is successfully").goAway(1500);
              this.hideModal();
            }
          })
          .catch(function (error) {
            vm.$toast.error("submit data is getting error").goAway(2000);
            console.log(error);
          });
      },

      getCurrentDate(){
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var day = (dd<10) ? '0'+dd : dd;
        var month = (mm<10) ? '0'+mm : mm;
        var yyyy = today.getFullYear();

        return day+'/'+month+'/'+yyyy;
      },

      showPurchaseModal(){
        this.isShowFormAddProductInPurchase = true;
      },
      async submitPurchase(){
        let dataSubmit = {};
        dataSubmit["warehouse_id"] = this.purchase.warehouse;
        dataSubmit["supplier_id"] = this.purchase.supplier;
        dataSubmit["batch"] = "V_" + this.getCurrentDate();

        let purchaseDetail = [];
        let subtotal = 0;
        for(let index=0; index < this.items.length; index++){
          let purchaseDetailItem = {};
          let productTotalPrice = 0;

          purchaseDetailItem['product_id']= this.items[index]['id'];
          purchaseDetailItem['unitprice'] = this.items[index]['import_price'];
          purchaseDetailItem['quantity'] = this.items[index]['qty'];
          productTotalPrice = parseInt(this.items[index]['qty']) * parseFloat(this.items[index]['import_price']);
          subtotal += productTotalPrice;
          purchaseDetail.push(purchaseDetailItem);
        }
        dataSubmit["purchases"] = purchaseDetail;
        dataSubmit["subtotal"] = subtotal;
        dataSubmit["grandtotal"] = (subtotal + (subtotal * parseFloat(this.purchase.vat)));
        let vm = this;
        this.$toast.info("submit data in progress").goAway(1000);
        await this.$axios.post('/api/purchase', dataSubmit)
          .then(function (response) {
            if(response){
              this.$toast.success("submit data is successful").goAway(1500);
            }
          })
          .catch(function (error) {
            if(error){
              vm.$toast.error("submit data is getting error").goAway(2000);
            }
            console.log(error);
          });
      },

      renderProductOptionData(product){
        let productItem =  { text: '', value: null};
        productItem.text = product["en_name"] + " (" + product["kh_name"] + ")";
        productItem.value = product["id"];
        return productItem;
      },
      async checkingProductAdd($event){
        if($event){
          await this.products.push(this.renderProductOptionData($event));
          await this.productList.push($event);
        }
      },
    },
    mounted() {
      this.getAllData();
      this.getProductList();
      this.getAllWarehouse();
      this.getAllSupplier();
    }
  }
</script>

<style scoped>
  .content-table{
    width: 50%;
    display: inline-block;
    float: left;
  }
  .content-add-purchase{
    display: inline-block;
    width: 49%;
    float: right;
    margin: 10px 0 20px 0;
  }
  .content-btn-product{
    display: inline-block;
    float: right;
    width: 69.4%;
  }

</style>
