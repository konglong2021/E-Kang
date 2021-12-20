<template>
  <div class="inventory-dashboard-content main-page-content">
    <div class="content-loading" v-if="loadingFields && (loadingFields.productListLoading || loadingFields.supplierListLoading || loadingFields.warehouseListLoading)">
      <div class="spinner-grow text-muted"></div>
    </div>
    <div v-if="!loadingFields.productListLoading && !loadingFields.supplierListLoading && !loadingFields.warehouseListLoading">
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
                    <span class="margin-span-btn">Import</span>
                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                  </b-button>
                </div>
                <div class="btn-wrapper margin-right-20-percentage">
                  <b-button href="#" title="Add new Product" size="sm" variant="primary" @click="showModal()">
                    <span class="margin-span-btn">New Product</span>
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </b-button>
                </div>
                <div class="btn-wrapper margin-right-20-percentage">
                  <b-button href="#" title="Add new Supplier" size="sm" variant="primary"  @click="showSupplierModal()">
                    <span class="margin-span-btn">New Supplier</span>
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </b-button>
                </div>
                <div class="btn-wrapper">
                  <b-button href="#" title="Add new WareHouse" size="sm" variant="primary"  @click="showWareHouseModal()">
                    <span class="margin-span-btn">New WareHouse</span>
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </b-button>
                </div>
              </b-row>
            </b-container>
          </div>
          <div class="panel-bottom"></div>
        </div>
      </div>
      <div class="content-product">
        <div class="content-data">
          <div class="btn-wrapper margin-btn" v-if="!isShowFormAddProductInPurchase">
            <b-button href="#" size="sm" variant="primary" title="Add new purchase record" @click="showPurchaseModal()">
              <span class="margin-span-btn">Stock In</span>
              <i class="fa fa-plus" aria-hidden="true"></i>
            </b-button>
            <b-button href="#" size="sm" variant="primary" title="Check stock record" @click="showStockTable()" style="display:none;">
              <span class="margin-span-btn">Check Stock</span>
            </b-button>
          </div>
          <div class="display-inline-block full-with" v-if="isShowFormAddProductInPurchase">
            <div class="display-inline-block content-field-purchase float-left" >
              <div>
                <label class="label-with">Supplier</label>
                <b-form-select :disabled="suppliers.length === 0" class="form-control select-content-inline" v-model="purchase.supplier" :options="suppliers"></b-form-select>
              </div>
              <div class="margin-bottom-20">
                <label class="label-with">Store</label>
                <b-form-select :disabled="warehouses.length === 0" class="form-control select-content-inline" v-model="purchase.warehouse" :options="warehouses"></b-form-select>
              </div>
              <div class="display-inline-block">
                <b-button
                  href="#" size="sm" variant="primary"
                  title="Add product to stock"
                  :disabled="warehouses.length === 0 && suppliers.length === 0"
                  @click="showExistingProductModal()">Add product to stock</b-button>
                <b-button
                  v-show="purchase.supplier && purchase.warehouse && this.items.length > 0"
                  href="#" size="sm" variant="primary"
                  title="Save stock" @click="submitPurchase()"
                >Save purchase</b-button>
                <b-button
                  href="#" size="sm" variant="primary"
                  title="Discard stock" @click="discardPurchase()"
                >Discard add stock</b-button>
              </div>
            </div>
            <div class="display-inline-block content-field-purchase float-right">
              <div>
                <label class="label-with">Vat</label>
                <b-form-select class="form-control select-content-inline" v-model="purchase.vat" :options="vats"></b-form-select>
              </div>
              <div class="margin-bottom-20">
                <label class="label-with">Batch</label>
                <b-form-input class="form-control select-content-inline display-inline-block" v-model="purchase.batch"></b-form-input>
              </div>
            </div>
          </div>
          <div class="margin-5" v-if="isShowFormAddProductInPurchase">
            <h4 class="font-700">Product list</h4>
            <b-table
              :items="items"
              :fields="fields"
              stacked="md"
              show-empty
              small
            >
              <template #cell(actions)="row">
                <b-button size="sm" title="Adjust product select" variant="success" @click="adjustProductAdd(row.item, row.index, $event.target)">
                  <i class="fa fa-edit"></i>
                </b-button>
                <b-button size="sm" variant="primary" title="Remove product select from list"  @click="showRemoveProductSelect(row.item, row.index, $event.target)" class="mr-1">
                  <i class="fa fa-trash-o"></i>
                </b-button>
              </template>
              <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
            </b-table>
          </div>
          <div>
            <div class="content-loading" v-if="loadingFields.stockLoading">
              <div class="spinner-grow text-muted"></div>
            </div>
            <b-table v-if="!loadingFields.stockLoading && isShowStockTable"
                     :items="stockItems"
                     :fields="stockFields"
                     stacked="md"
                     show-empty
                     small
            >
              <template #cell(image)="row">
                <div class="pro-img">
                </div>
              </template>
            </b-table>
          </div>
        </div>
      </div>
    </div>
    <add-new-product-modal v-model="newProductModal" @checkingProductAdd="checkingProductAdd($event)" /> <!--no need to import it will automatically rendering it -->
    <b-modal id="modal-create-supplier" ref="supplier-form-modal" size="lg"
             @hidden="onResetSupplier" cancel-title="Cancel"
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
             @hidden="onResetWareHouse" cancel-title="Cancel"
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
             @hidden="onResetExistingProduct" cancel-title="Cancel"
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
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.import_price" :disabled="isDisabledImportPrice === true"></b-form-input>
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
    <b-modal id="modal-remove-existing-product" ref="remove-existing-product-form-modal" size="lg"
             cancel-title="No"
             @ok="removeProductAdd(product_select)" ok-title="Yes">
      <h3 class="center">Are you sure want to remove product select from list?</h3>
    </b-modal>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        newProductModal:{
          showModal:false
        },
        loadingFields: {productListLoading: false, supplierListLoading: false, warehouseListLoading: false, stockLoading: true},
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
          { key: 'product_qty', label: 'Qty' },
          { key: 'store', label: 'Store' },
          { key : 'supplier', label: "Supplier"},
          { key: 'actions', label: 'Actions' }
        ],
        stockItems:[],
        stockFields: [
          { key: 'en_name', label: 'Name' },
          { key: 'kh_name', label: 'Name(KH)' },
          { key: 'image', label: 'Icon' },
          { key: 'code', label: 'QR Code' },
          { key: 'sale_price', label: 'Sell Price' },
          { key: 'product_qty', label: 'Total in stock' },
          { key: 'store', label: 'Store' },
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
        isShowStockTable: false,
        purchase_product_selected: [],
        product_select: {
          en_name: '',
          kh_name: '',
          code: null,
          sale_price: 0,
          qty: 0,
          store: null,
          id: '',
          import_price: 0,
          isDisableField: false,
        },
        vats: [{text: '0%', value: 0}, {text: '5%', value: 0.05}, {text: '10%', value: 0.1}, {text: '15%', value: 0.15}],
        stock: {
          en_name: null,
          kh_name: null,
          code: null,
          sale_price: 0,
          product_qty: 0,
          store: null,
          supplier: null,
        },
        removeProductSelect: {},
        isDisabledImportPrice : false,
        isUpdateProductAdd: false,
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
      showStockTable(){
        this.isShowStockTable = true;
        let vm = this;
        vm.stockItems = [];
        vm.loadingFields.stockLoading = true;
        vm.$axios.get('/api/stock')
          .then(function (response) {
            if(response.data){
              vm.loadingFields.stockLoading = false;
              let dataStock = response.data;
              if(dataStock && dataStock.length > 0){
                for (let i=0; i < dataStock.length; i++){
                  vm.stock = {};
                  let product = dataStock[i]["product"];
                  vm.stock.store = dataStock[i]["warehouse"]["name"] + " (" + dataStock[i]["warehouse"]["address"] + ")";
                  vm.stock.product_qty = dataStock[i]["total"].toString();
                  vm.stock.en_name = product["en_name"];
                  vm.stock.kh_name = product["kh_name"];
                  vm.stock.code = product["code"];
                  vm.stock.image = product["image"];
                  vm.stock.sale_price = product["sale_price"].toString();
                  vm.stockItems.push(vm.stock);
                }
              }
            }
          })
          .catch(function (error) {
            vm.$toast.error("getting data error ").goAway(2000);
            console.log(error);
          });
      },
      async onResetExistingProduct(){
        this.product_select = {};
      },
      onSubmitExistingProduct($product){
        let items = [];
        if(this.items && this.items.length > 0){
          let index = 0,isFound = false;
          items = this.cloneObject(this.items);

          for (let i=0; i < this.items.length; i++){
            if(this.items[i]["id"] === $product["id"]){
              index = i;
              isFound = true;
              break;
            }
          }
          if(isFound === true){
            if(this.product_select["isUpdateProductAdd"] !== true){
              items[index]["qty"] = parseInt(items[index]["qty"]) + parseInt($product["qty"]);
            }
          }
          else {
            items.push($product);
          }
        }
        else {
          items.push($product);
        }

        this.items = this.cloneObject(items);
        this.product_select = {
          en_name: '',
          kh_name: '',
          code: null,
          sale_price: 0,
          qty: 0,
          store: null,
          id: '',
          import_price: 0,
          isDisableField: false,
        };
        this.isDisabledImportPrice = false;
      },
      showExistingProductModal(){
        this.$refs['existing-product-form-modal'].show();
      },
      selectedProduct(productList, productId){
        this.isAddMoreProduct = true;
        let isFoundAlreadyAdd = false;

        if(this.items.length > 0){
          for(let k = 0; k < this.items.length; k++) {
            if(this.items[k]["id"] === productId){
              this.isDisabledImportPrice = this.items[k]["id"] === productId;
              isFoundAlreadyAdd = true;
              this.product_select.id = this.items[k].id;
              this.product_select.en_name = this.items[k].en_name;
              this.product_select.kh_name = this.items[k].kh_name;
              this.product_select.code = this.items[k].code;
              this.product_select.sale_price = parseFloat(this.items[k].sale_price);
              this.product_select.import_price = parseFloat(this.items[k].import_price);
              break;
            }
          }
        }
        if(!isFoundAlreadyAdd){
          if(productList &&  productList.length > 0){
            for(let index = 0; index < productList.length; index++) {
              if(productId === productList[index]["id"]){
                this.product_select.id = productList[index].id;
                this.product_select.en_name = productList[index].en_name;
                this.product_select.kh_name = productList[index].kh_name;
                this.product_select.code = productList[index].code;
                this.product_select.sale_price = parseFloat(productList[index].sale_price);
                this.isDisabledImportPrice = false;
                break;
              }
            }
          }
        }
      },
      adjustProductAdd(item, index, target){
        this.product_select = item;
        this.product_select["isUpdateProductAdd"] = true;
        this.$refs['existing-product-form-modal'].show();
      },
      showRemoveProductSelect(item, index, target){
        this.removeProductSelect = item;
        this.$refs['remove-existing-product-form-modal'].show();
      },
      removeProductAdd(){
        let removeItemId = null;
        for(let j=0; j < this.items.length; j++){
          if(this.items[j]['id'] === this.removeProductSelect.id){
            removeItemId = j;
            break;
          }
        }
        if(removeItemId !== null){
          this.items.slice(removeItemId, 1);
        }
      },

      async getProductList(){
        let vm = this;
        vm.loadingFields.productListLoading = true;
        await this.$axios.get('/api/product').then(function (response) {
          vm.loadingFields.productListLoading = false;
          if(response && response.hasOwnProperty("data")){
            let dataResponse = response.data.data;
            if(dataResponse){
              for(let index=0; index < dataResponse.length; index++){
                let productItem =  { text: '', value: null};
                productItem.text = dataResponse[index].en_name + " (" + dataResponse[index].kh_name + ")";
                productItem.value = dataResponse[index].id;
                vm.products.push(productItem);
                vm.productList.push(dataResponse[index]);
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          vm.$toast.error("getting data error ").goAway(2000);
        });
      },
      async getAllWarehouse(){
        let vm = this;
        this.loadingFields.warehouseListLoading = true;
        await this.$axios.get('/api/warehouse').then(function (response) {
          vm.loadingFields.warehouseListLoading = false;
          if(response && response.hasOwnProperty("data")){
            if(response.data.data){
              let data = response.data.data;
              for(let index=0; index < data.length; index++){
                let warehouseItem =  { text: '', value: null};
                warehouseItem.text = data[index]["name"] + "(" + data[index]["address"] + ")";
                warehouseItem.value = data[index]["id"];
                vm.warehouses.push(warehouseItem);
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
        vm.loadingFields.supplierListLoading = true;
        await this.$axios.get('/api/supplier')
          .then(function (response) {
            vm.loadingFields.supplierListLoading = false;
            if(response && response.hasOwnProperty("data")){
              if(response.data){
                let data = response.data;
                for(let index=0; index < data.length; index++){
                  let supplierItem =  { text: '', value: null};
                  supplierItem.text = data[index]["name"] + "(" + data[index]["address"] + ")";
                  supplierItem.value = data[index]["id"];
                  vm.suppliers.push(supplierItem);
                }
              }
            }
          }).catch(function (error) {
            console.log(error);
            vm.$toast.error("Getting data error").goAway(3000);
          });

      },

      viewDetailStock(item, index, target){
      },
      adjustStock( item,index,target ){
        alert('adjust stock click '+index);
      },

      showModal(){
        this.newProductModal.showModal = true;
      },
      showSupplierModal(){
        this.$refs['supplier-form-modal'].show();
      },
      onResetSupplier(){},
      onSubmitSupplier(){
        let vm = this;

        vm.loadingFields.supplierListLoading = true;
        vm.$toast.info("Submit data is starting").goAway(1500);
        this.$axios.post('/api/supplier', this.supplier)
          .then(function (response) {
            vm.$toast.success("Submit data is successful").goAway(2000);
            if(response.data.supplier){
              vm.loadingFields.supplierListLoading = false;
              let data = response.data.supplier;
              let supplierItem =  { text: '', value: null};
              supplierItem.text = data["name"] + "(" + data["address"] + ")";
              supplierItem.value = data["id"];
              vm.suppliers.push(supplierItem);
            }
            vm.hideModal();
          })
          .catch(function (error) {
            vm.$toast.error("getting data error ").goAway(2500);
            console.log(error);
          });
      },
      showWareHouseModal(){
        this.$refs['warehouse-form-modal'].show();
      },
      onResetWareHouse(){},
      async onSubmitWareHouse(){
        let vm = this;

        vm.loadingFields.warehouseListLoading = true;
        vm.$toast.info("Data starting submit").goAway(1500);

        await this.$axios.post('/api/warehouse', this.warehouse)
          .then(function (response) {
            if(response.data.warehouse){
              vm.loadingFields.warehouseListLoading = false;
              vm.$toast.success("Submit data successfully").goAway(2000);
              let data = response.data.warehouse;
              let warehouseItem =  { text: '', value: null };
              warehouseItem.text = data["name"] + "(" + data["address"] + ")";
              warehouseItem.value = data["id"];
              vm.warehouses.push(warehouseItem);
              this.hideModal();
            }
          })
          .catch(function (error) {
            console.log(error);
            vm.$toast.error("Submit data getting error").goAway(3000);
          });
      },
      showPurchaseModal(){
        this.isShowFormAddProductInPurchase = true;
        this.isShowStockTable = false;
        if(this.stock && this.stock.length > 0){
          for (let index=0; index < this.stock.length ; index++){
            
          }
        }
      },
      discardPurchase(){
        this.isShowFormAddProductInPurchase = false;
        this.items = [];
        this.purchase.supplier = null;
        this.purchase.warehouse = null;
        this.purchase.vat = null;
        this.isShowStockTable = true;
      },
      async submitPurchase(){
        let dataSubmit = {};
        dataSubmit["warehouse_id"] = this.purchase.warehouse;
        dataSubmit["supplier_id"] = this.purchase.supplier;
        dataSubmit["batch"] = "V_" + this.purchase.batch;

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
        vm.loadingFields.stockLoading = true;
        vm.$toast.info("Data starting submit").goAway(1500);
        await this.$axios.post('/api/purchase', dataSubmit)
          .then(function (response) {
            if(response){
              vm.isShowFormAddProductInPurchase = false;
              vm.isShowStockTable = true;
              vm.loadingFields.stockLoading = false;
              vm.$toast.success("Submit data successfully").goAway(2000);
              if(response.data.message){
                vm.loadingFields.stockLoading = true;
                vm.$axios.get('/api/stock')
                .then(function (response) {
                    if(response.data.data){
                      vm.loadingFields.stockLoading = false;
                      let dataStock = response.data.data;
                      if(dataStock && dataStock.length > 0){
                        for (let i=0; i < dataStock.length; i++){
                          vm.stock = {};
                          let product = dataStock[i]["product"];
                          vm.stock.store = dataStock[i]["warehouse"]["name"] + " (" + dataStock[i]["warehouse"]["address"] + ")";
                          vm.stock.product_qty = dataStock[i]["total"].toString();
                          vm.stock.en_name = product["en_name"];
                          vm.stock.kh_name = product["kh_name"];
                          vm.stock.code = product["code"];
                          vm.stock.image = product["image"];
                          vm.stock.sale_price = product["sale_price"].toString();
                          vm.stockItems.push(vm.stock);
                        }
                      }
                    }
                })
                .catch(function (error) {
                    vm.$toast.error("getting data error ").goAway(2000);
                    console.log(error);
                });
              }
            }
          })
          .catch(function (error) {
            console.log(error);
            vm.$toast.success("Submit data getting error").goAway(3000);
          });
      },
      async getDataPurchase(){
        let vm = this;
        await this.$axios.get('/api/purchase')
          .then(function (response) {
            if(response.data.data){
              let responsePurchases = response.data.data;
              if(responsePurchases && responsePurchases.length > 0){
                for (let index=0; index < responsePurchases.length; index++){
                }
              }
            }
          })
          .catch(function (error) {
            console.log(error);
            vm.$toast.success("Submit data getting error").goAway(3000);
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

      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },

      generateBatch(){
        return this.getFullDateAndTime();
      },

      getFullDateAndTime(){
        let today = new Date();
        let dd = today.getDate();
        let mm = today.getMonth()+1; //January is 0!
        let day = (dd<10) ? '0'+dd : dd;
        let month = (mm<10) ? '0'+mm : mm;
        let yyyy = today.getFullYear();
        let hours = today.getHours();
        let minutes = today.getMinutes();
        let time = today.getTime();

        return (yyyy + mm + dd + hours + minutes + time);
      }
    },
    mounted() {
      this.getDataPurchase();
      this.getProductList();
      this.getAllWarehouse();
      this.getAllSupplier();
      this.showStockTable();
      this.generateBatch();
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
