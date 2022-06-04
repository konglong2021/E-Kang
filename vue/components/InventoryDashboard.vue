<template>
  <div class="inventory-dashboard-content main-page-content">
    <div class="full-content">
      <div class="control-panel">
        <div class="panel-top">
          <div class="content-panel-left">
            <h3 class="head-title"> {{ $t('content_title_inventory')}}</h3>
          </div>
          <div class="content-panel-right">
            <b-container class="col-12 mx-auto menu-wrapper">
              <b-row>
                <b-col>
                  <div class="input-group input-group-sm search-content">
                    <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                    <input class="form-control input-search-box" type="search" placeholder="Search..." v-model="searchInput" @keyup.enter="searchStock()" @change="handleClick" />
                  </div>
                </b-col>
                <div class="btn-wrapper margin-right-20-percentage">
                  <b-button href="#" title="Add new Product" size="sm" variant="primary" @click="showModal()">
                    <span class="margin-span-btn">{{$t('title_new_product')}}</span>
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </b-button>
                </div>
                <div class="btn-wrapper margin-right-20-percentage">
                  <b-button href="#" title="Add new Supplier" size="sm" variant="primary"  @click="showSupplierModal()">
                    <span class="margin-span-btn">{{$t('title_new_supplier')}}</span>
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </b-button>
                </div>
                <div class="btn-wrapper">
                  <b-button href="#" title="Add new WareHouse" size="sm" variant="primary"  @click="showWareHouseModal()">
                    <span class="margin-span-btn">{{$t('title_new_warehouse')}}</span>
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
              <span class="margin-span-btn">{{$t('stock_in')}}</span>
              <i class="fa fa-plus" aria-hidden="true"></i>
            </b-button>
          </div>
          <div class="display-inline-block full-with" v-if="isShowFormAddProductInPurchase && !loadingFields.productListLoading">
            <div class="display-inline-block content-field-purchase float-left" >
              <p class="text-danger" v-if="suppliers.length === 0 || products.length === 0">
                មិនអាចបញ្ចូលទំនិញក្នុងស្តុកបានទេ ព្រោះ
                <span v-if="suppliers.length === 0">មិនមានបញ្ចូលទិន្នន័យអ្នកផ្គត់ផ្គង់់, </span>
                <span v-if="products.length === 0">មិនមានបញ្ចូលទិន្នន័យទំនិញ, </span>
                សូមបង្កើត
                <span v-if="suppliers.length === 0">ទិន្នន័យអ្នកផ្គត់ផ្គង់់</span>
                <span v-if="products.length === 0">ទិន្នន័យទំនិញ</span>
              </p>
              <div>
                <label class="label-with">{{$t('title_supplier')}}</label>
                <b-form-select :disabled="suppliers.length === 0" class="form-control select-content-inline" v-model="purchase.supplier" :options="suppliers"></b-form-select>
              </div>
              <div class="margin-bottom-20">
                <label class="label-with">{{ $t('title_warehouse') }}</label>
                <b-form-select :disabled="warehouses.length === 0" class="form-control select-content-inline" v-model="purchase.warehouse" :options="warehouses"></b-form-select>
              </div>
              <div class="display-inline-block">
                <b-button
                  href="#" size="sm" variant="primary"
                  title="Add product to stock"
                  :disabled="(warehouses.length === 0 && suppliers.length === 0) || products.length === 0"
                  @click="showExistingProductModal()">
                  {{$t('title_add_product_to_stock')}}
                </b-button>
                <b-button
                  v-show="purchase.supplier && purchase.warehouse && this.items.length > 0"
                  href="#" size="sm" variant="success"
                  title="Save stock" @click="submitPurchase()">
                  {{$t('save_purchase')}}
                </b-button>
                <b-button
                  href="#" size="sm" variant="danger"
                  title="Discard stock" @click="discardPurchase()">
                  {{$t('title_discard_add_stock')}}
                </b-button>
              </div>
            </div>
            <div class="display-inline-block content-field-purchase float-right">
              <div>
                <label class="label-with">ពន្ធ</label>
                <b-form-select class="form-control select-content-inline" v-model="purchase.vat" :options="vats"></b-form-select>
              </div>
              <div class="margin-bottom-20">
                <label class="label-with">Batch</label>
                <b-form-input class="form-control select-content-inline display-inline-block" v-model="purchase.batch"></b-form-input>
              </div>
            </div>
          </div>
          <div class="margin-5" v-if="isShowFormAddProductInPurchase && !loadingFields.productListLoading">
            <h4 class="font-700">{{$t('product_list')}}</h4>
            <b-table :items="items"
              :fields="fields" stacked="md"
              show-empty small
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
          <div class="full-content">
            <div class="content-loading" v-if="loadingFields.stockLoading || loadingFields.productListLoading">
              <div class="spinner-grow text-muted"></div>
            </div>
            <b-table
              class="content-table-scroll"
              v-if="!loadingFields.stockLoading && isShowStockTable"
              sticky-header="true"
              :items="stockItems"
              :fields="stockFields"
              head-variant="light"
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
             @hidden="onResetSupplier" :cancel-title="$t('label_cancel_button')"
             @ok="handleOnSubmitSupplier" :ok-title="$t('label_save_button')" :title="$t('title_supplier')"
             no-close-on-backdrop
    >
      <b-form enctype="multipart/form-data" @submit.stop.prevent="onSubmitSupplier">
        <div class="full-content">
        </div>
        <div class="full-content">
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-name'" class="label-input">{{ $t('label_name') }}</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-name'" type="text" v-model="supplier.name" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-address'" class="label-input">{{$t('label_address')}}</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-address'" type="text" v-model="supplier.address" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-email'" class="label-input">{{$t('label_email')}}</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-email'" type="email" v-model="supplier.email" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-phone'" class="label-input">{{$t('label_phone')}}</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-phone'" class="input-content" v-model="supplier.phone"></b-form-input>
            </b-col>
          </b-row>
        </div>
      </b-form>
    </b-modal>
    <b-modal id="modal-create-warehouse" ref="warehouse-form-modal" size="lg"
             @hidden="onResetWareHouse" :cancel-title="$t('label_cancel_button')"
             @ok="handleOnSubmitWareHouse" :ok-title="$t('label_save_button')" :title="$t('title_new_warehouse')"
             no-close-on-backdrop
    >
      <b-form enctype="multipart/form-data" @submit.stop.prevent="onSubmitWareHouse">
        <div class="full-content">
        </div>
        <div class="full-content">
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-name'" class="label-input">{{ $t('label_name') }}</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-name'" type="text" v-model="warehouse.name" class="input-content"></b-form-input>
            </b-col>
          </b-row>
          <b-row class="my-1">
            <b-col sm="4"><label :for="'input-address'" class="label-input">{{$t('label_address')}}</label></b-col>
            <b-col sm="8">
              <b-form-input :id="'input-address'" type="text" v-model="warehouse.address" class="input-content"></b-form-input>
            </b-col>
          </b-row>
        </div>
      </b-form>
    </b-modal>
    <b-modal id="modal-create-existing-product" ref="existing-product-form-modal" size="lg"
      @hidden="onResetExistingProduct" :cancel-title="$t('label_cancel_button')"
      @ok="handleOnSubmitExistingProduct" :ok-title="$t('label_save_button')"
             :title="$t('title_add_product')" no-close-on-backdrop>
      <b-form enctype="multipart/form-data" @submit.stop.prevent="onSubmitExistingProduct(product_select)">
        <div class="full-content" v-if="products && products.length > 0">
          <div class="display-inline-block full-with">
            <div class="col-md-12 float-right">
              <div class="form-group form-content-detail">
                <label class="label-with" style="float: left; margin-top: 3px;">{{ $t('title_product') }}</label>
                <div class="select-content-inline display-inline-block multiple-select" style="width: 68% !important; float: left;">
                  <multiselect
                          v-model="product_select.product" :options="products"
                          track-by="name" label="name" :show-labels="false"
                          :placeholder="$t('label_search_by_product')"
                          @select="selectedProduct"
                          @remove="removeElement"></multiselect>
                </div>
<!--                <b-form-select class="form-control select-content-inline" v-model="product_select.product" :options="products" @change="selectedProduct(productList, product_select.product)"></b-form-select>-->
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">{{$t('import_price')}} ($)</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.import_price" :disabled="isDisabledImportPrice === true"></b-form-input>
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">{{$t('label_sale_price')}} ($)</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.sale_price" :disabled="true"></b-form-input>
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">{{$t('label_quantity')}}</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.qty"></b-form-input>
              </div>
            </div>
          </div>
        </div>
      </b-form>
    </b-modal>
    <b-modal
      id="modal-remove-existing-product" ref="remove-existing-product-form-modal" size="lg"
      cancel-title="No" @ok="removeProductAdd(product_select)" :ok-title="$t('label_yes_button')" no-close-on-backdrop>
      <h3 class="center">{{ $t('question_remove_existing_product') }}</h3>
    </b-modal>
    <b-modal
      id="modal-update-stock" ref="remove-update-stock-modal" size="lg"
      cancel-title="No" @ok="handleOnSubmitPurchase" :ok-title="$t('label_yes_button')" no-close-on-backdrop
    >
      <b-form enctype="multipart/form-data" @submit.stop.prevent="submitPurchase">
        <div class="full-content" v-if="purchase">
          <div class="display-inline-block full-with">
            <div class="col-md-12 float-right">
              <div class="form-group form-content-detail">
                <label class="label-with" style="float: left; margin-top: 3px;">{{ $t('title_product') }}</label>
                <div class="select-content-inline display-inline-block multiple-select" style="width: 68% !important; float: left;">
                  <multiselect
                          v-model="product_select.product" :options="products"
                          track-by="name" label="name" :show-labels="false"
                          :placeholder="$t('label_search_by_product')"
                          @select="selectedProduct"
                          @remove="removeElement"></multiselect>
                </div>
                <!--                <b-form-select class="form-control select-content-inline" v-model="product_select.product" :options="products" @change="selectedProduct(productList, product_select.product)"></b-form-select>-->
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">{{$t('import_price')}} ($)</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.import_price" :disabled="isDisabledImportPrice === true"></b-form-input>
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">{{$t('label_sale_price')}} ($)</label>
                <b-form-input class="select-content-inline display-inline-block" v-model="product_select.sale_price" :disabled="true"></b-form-input>
              </div>
              <div class="form-group form-content-detail">
                <label class="label-with">{{$t('label_quantity')}}</label>
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
  export default {
    data() {
      return {
        newProductModal: {showModal:false},
        purchaseModal:{show: false},
        loadingFields: {productListLoading: false, supplierListLoading: false, warehouseListLoading: false, stockLoading: true},
        items: [],
        fields: [
          { key: 'en_name', label: this.$t('label_name_english') },
          { key: 'kh_name', label: this.$t('label_name_khmer') },
          { key: 'code', label: this.$t('title_barcode') },
          { key: 'sale_price', label: this.$t('label_sale_price') + ' ($)' },
          { key: 'import_price', label: this.$t('import_price') + ' ($)' },
          { key: 'qty', label: this.$t('label_quantity') },
          { key: 'actions', label: this.$t('title_action') }
        ],
        purchaseItems: [],
        purchaseFields: [
          { key: 'en_name', label: this.$t('label_name_english') },
          { key: 'kh_name', label: this.$t('label_name_khmer') },
          { key: 'code', label: this.$t('title_barcode') },
          { key: 'sale_price', label: this.$t('label_sale_price') + ' ($)' },
          { key: 'import_price', label: this.$t('import_price') + ' ($)' },
          { key: 'product_qty', label: this.$t('label_quantity') },
          { key: 'store', label: this.$t('title_store') },
          { key : 'supplier', label: this.$t('title_supplier')},
          { key: 'actions', label: this.$t('title_action') }
        ],
        stockItems: [],
        stockFields: [
          { key: 'en_name', label: this.$t('label_name_english')},
          { key: 'kh_name', label: this.$t('label_name_khmer')},
          { key: 'image', label: this.$t('title_icon') },
          { key: 'code', label: this.$t('title_barcode')},
          { key: 'sale_price', label: this.$t('label_sale_price') + ' ($)'},
          { key: 'product_qty', label: this.$t('title_label_total_stock')},
          { key: 'store', label: this.$t('title_store'), tdClass: "col-sm-3" },
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
          batch: this.generateBatch(),
        },
        products: [],
        productList: [],
        suppliers: [{text : "ជ្រើសរើស អ្នកផ្គត់ផ្គង់", value : null}],
        warehouses: [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
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
        product_select_last_unit_price: {},
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
        purchases: [],
        searchInput: null,
        excelImportFile: null,
        warehouseList : [],
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
                let dataForSort = vm.cloneObject(vm.stockItems);
                vm.stockItems.sort(vm.sortByName);
              }
            }
          })
          .catch(function (error) {
            vm.$toast.error("getting data error ").goAway(2000);
            console.log(error);
          });
      },
      sortByName(a, b) {
        if (a.kh_name === b.kh_name){
          return a.en_name > b.en_name ? 1 : -1;
        }
        return a.kh_name > b.kh_name ? 1 : -1;
      },

      async onResetExistingProduct(){
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
        this.product_select_last_unit_price = {};
      },
      handleOnSubmitExistingProduct(bvModalEvent){
        bvModalEvent.preventDefault();
        this.onSubmitExistingProduct(this.product_select);
      },
      onSubmitExistingProduct($product){
        let items = [];
        if(this.items && this.items.length > 0){
          items = this.cloneObject(this.items);
          let dataItem = this.items.find(item => item.id === $product["value"]);
          let index = this.items.indexOf(dataItem);
          if(dataItem && dataItem.hasOwnProperty("id")){
            if(this.product_select["isUpdateProductAdd"] !== true){
              items[index]["qty"] = (parseInt(items[index]["qty"]) + parseInt($product["qty"]));
            }
          }
          else {
            items.unshift($product);
          }
        }
        else {
          items.unshift($product);
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
        this.$nextTick(() => {
          this.$refs['existing-product-form-modal'].hide();
        });
      },
      showExistingProductModal(){
        this.$refs['existing-product-form-modal'].show();
      },
      async selectedProduct($obj){
        this.isAddMoreProduct = true;
        let self = this;
        let itemProductAlreadyAdd = null;
        if(self.items.length > 0){
          itemProductAlreadyAdd = self.items.find(item => {return item.id === $obj["value"]});
        }
        if(!itemProductAlreadyAdd){
          if(self.productList &&  self.productList.length > 0){
            for(let index = 0; index < self.productList.length; index++) {
              if($obj["value"] === self.productList[index]["id"]){
                self.product_select.id = self.productList[index].id;
                self.product_select.en_name = self.productList[index].en_name;
                self.product_select.kh_name = self.productList[index].kh_name;
                self.product_select.code = self.productList[index].code;
                self.product_select.sale_price = parseFloat(self.productList[index].sale_price);
                if($obj.hasOwnProperty("value")){
                  await self.$axios.get('/api/showlastunitprice/' + $obj["value"]).then(function (responsePrice) {
                    if(responsePrice.data){
                      if(responsePrice.data.price.constructor === Object){
                        self.product_select.import_price = self.cloneObject(responsePrice.data.price.unitprice);
                      }
                      else {
                        self.product_select.import_price = 0;
                      }
                    }
                  }).catch(function (error) {
                    console.log(error);
                    self.$toast.success("Submit data getting error").goAway(3000);
                  });
                  self.productList.unshift(self.productList[index]);
                }
                self.isDisabledImportPrice = false;
                break;
              }
            }
          }
        }
        else if(itemProductAlreadyAdd && !itemProductAlreadyAdd.hasOwnProperty("import_price")){
          if(itemProductAlreadyAdd.hasOwnProperty("id")){
            await self.$axios.get('/api/showlastunitprice/' + itemProductAlreadyAdd["id"]).then(function (responsePrice) {
              if(responsePrice.data){
                if(responsePrice.data.price.constructor === Object){
                  itemProductAlreadyAdd.import_price = self.cloneObject(responsePrice.data.price.unitprice);
                }
                else {
                  itemProductAlreadyAdd.import_price = 0;
                }
              }
            }).catch(function (error) {
              console.log(error);
              self.$toast.success("Submit data getting error").goAway(3000);
            });
            //self.productList.unshift(self.productList[index]);
          }
        }
        this.$forceUpdate();
      },
      removeElement(){
        this.$forceUpdate();
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
          this.items.splice(removeItemId, 1);
        }
      },
      async getProductList(){
        let vm = this;
        vm.products = [];
        vm.productList = [];
        vm.loadingFields.productListLoading = true;

        const response = await this.$axios.get('/api/product');
        if(response){
          if(response && response.hasOwnProperty("data")){
            let dataResponse = response.data;
            if(dataResponse){
              dataResponse.sort(vm.sortByName);
              for(let index=0; index < dataResponse.length; index++){
                let itemProduct = vm.cloneObject(dataResponse[index]);
                vm.productList.unshift(itemProduct);
                vm.loadingFields.productListLoading = false;
                let productOptionItem =  { name: '', value: null};
                productOptionItem.name = (dataResponse[index].en_name + " - " + dataResponse[index].kh_name + " (" + dataResponse[index].code + ")");
                productOptionItem.value = dataResponse[index].id;
                vm.products.unshift(productOptionItem);
              }
            }
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
                //vm.warehouses.push(warehouseItem);
                vm.warehouses.unshift(warehouseItem);
                //vm.warehouseList.push(data[index]);
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
        vm.suppliers = [];
        vm.loadingFields.supplierListLoading = true;
        await vm.$axios.get('/api/supplier')
          .then(function (response) {
            vm.loadingFields.supplierListLoading = false;
            if(response && response.hasOwnProperty("data")){
              if(response.data){
                let data = response.data;
                for(let index=0; index < data.length; index++){
                  let supplierItem =  { text: '', value: null};
                  supplierItem.text = data[index]["name"] + "(" + data[index]["address"] + ")";
                  supplierItem.value = data[index]["id"];
                  //vm.suppliers.push(supplierItem);
                  vm.suppliers.unshift(supplierItem);
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
        this.supplier ={};
      },
      hideSupplierModal(){
        this.$refs['supplier-form-modal'].hide();
      },
      onResetSupplier(){},
      handleOnSubmitSupplier(bvModalEvent){
        bvModalEvent.preventDefault();
        this.onSubmitSupplier();
      },
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
              vm.suppliers.unshift(supplierItem);
            }
            vm.hideSupplierModal();
          })
          .catch(function (error) {
            vm.$toast.error("getting data error ").goAway(2500);
            console.log(error);
          });
      },
      showWareHouseModal(){
        this.warehouse = {};
        this.$refs['warehouse-form-modal'].show();
      },
      hideModalWareHouse(){
        this.$refs['warehouse-form-modal'].hide();
      },
      onResetWareHouse(){},
      handleOnSubmitWareHouse(bvModalEvent){
        bvModalEvent.preventDefault();
        this.onSubmitWareHouse();
      },
      async onSubmitWareHouse(){
        let vm = this;

        vm.loadingFields.warehouseListLoading = true;
        vm.$toast.info("Data starting submit").goAway(1500);

        await this.$axios.post('/api/warehouse', vm.warehouse)
          .then(function (response) {
            if(response.data.warehouse){
              vm.loadingFields.warehouseListLoading = false;
              vm.$toast.success("Submit data successfully").goAway(2000);
              let data = response.data.warehouse;
              let warehouseItem =  { text: '', value: null };
              warehouseItem.text = data["name"] + "(" + data["address"] + ")";
              warehouseItem.value = data["id"];
              vm.warehouses.unshift(warehouseItem);
              vm.hideModalWareHouse();
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
        this.items = [];
        this.purchase.supplier = null;
        this.purchase.vat = null;
        this.purchase.warehouse = this.$store.$cookies.get("storeItem");
        this.getAllSupplier();
      },
      discardPurchase(){
        this.isShowFormAddProductInPurchase = false;
        this.items = [];
        this.purchase.supplier = null;
        this.purchase.warehouse = null;
        this.purchase.vat = null;
        this.isShowStockTable = true;
      },
      handleOnSubmitPurchase(bvModalEvent){
        bvModalEvent.preventDefault();
        this.submitPurchase();
      },
      async submitPurchase(){
        let dataSubmit = {};
        let vm = this;
        dataSubmit["warehouse_id"] = vm.purchase.warehouse;
        dataSubmit["supplier_id"] = vm.purchase.supplier;
        dataSubmit["batch"] = vm.purchase.batch ? vm.purchase.batch : this.generateBatch();
        dataSubmit["vat"] = vm.purchase.vat;

        let purchaseDetail = [];
        let subtotal = 0;
        for(let index=0; index < vm.items.length; index++){
          let purchaseDetailItem = {};
          let productTotalPrice = 0;

          purchaseDetailItem['product_id']= vm.items[index]['id'];
          purchaseDetailItem['unitprice'] = vm.items[index]['import_price'];
          purchaseDetailItem['quantity'] = vm.items[index]['qty'];
          productTotalPrice = parseInt(vm.items[index]['qty']) * parseFloat(this.items[index]['import_price']);
          subtotal += productTotalPrice;
          //purchaseDetail.push(purchaseDetailItem);
          purchaseDetail.unshift(purchaseDetailItem);
        }
        let vat = vm.purchase.vat !== null ? vm.purchase.vat : 0;
        dataSubmit["purchases"] = purchaseDetail;
        dataSubmit["subtotal"] = subtotal;
        dataSubmit["grandtotal"] = (subtotal + (subtotal * parseFloat(vat)));

        vm.loadingFields.stockLoading = true;
        vm.isShowFormAddProductInPurchase = false;

        vm.$toast.info("Data starting submit").goAway(1500);
        await this.$axios.post('/api/purchase', dataSubmit)
          .then(function (response) {
            if(response && response.hasOwnProperty("data")){
              vm.isShowStockTable = true;
              vm.loadingFields.stockLoading = false;
              vm.purchase = {};
              vm.$toast.success("Submit data successfully").goAway(2000);
              if(response && response.data && response.data.message){
                vm.$axios.get('/api/stock')
                  .then(function (response) {
                    if(response.data){
                      vm.stockItems = [];
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
                         // vm.stockItems.push(vm.stock);
                          vm.stockItems.unshift(vm.stock);
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
      showAllPurchase(){
        this.purchaseModal.show = true;
      },

      renderProductOptionData(product){
        let productItem =  { name: '', value: null};
        productItem.name = product["en_name"] + " (" + product["kh_name"] + ")";
        productItem.value = product["id"];
        return productItem;
      },
      async checkingProductAdd($event){
        if($event){
          await this.products.unshift(this.renderProductOptionData($event["itemProduct"]));
          await this.productList.unshift($event["itemProduct"]);
        }
      },
      handleClick(e) {
        if (e.target.value === '' || e.target.value === null || e.target.value === undefined) {
          this.searchInput = '';
          this.showStockTable();
        }
      },
      async searchStock() {
        this.isLoading = true;
        this.items = [];
        let self = this;
        self.stockItems = [];
        self.loadingFields.stockLoading = true;
        await self.$axios.post('/api/stock/search', {search: self.searchInput}).then(function (response) {
          if(response.data){
            self.loadingFields.stockLoading = false;
            let dataStock = response.data;
            if(dataStock && dataStock.length > 0){
              for (let i=0; i < dataStock.length; i++){
                self.stock = {};
                let product = dataStock[i]["product"];
                self.stock.store = dataStock[i]["warehouse"]["name"] + " (" + dataStock[i]["warehouse"]["address"] + ")";
                self.stock.product_qty = dataStock[i]["total"].toString();
                self.stock.en_name = product["en_name"];
                self.stock.kh_name = product["kh_name"];
                self.stock.code = product["code"];
                self.stock.image = product["image"];
                self.stock.sale_price = product["sale_price"].toString();
                //self.stockItems.push(self.stock);
                self.stockItems.unshift(self.stock);
              }
            }
          }
        }).catch(function (error) {
            self.$toast.error("getting data error ").goAway(2000);
            console.log(error);
        });
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
      generateBatch(){
        return this.getFullDate() + "_v" + this.getFullDateAndTime();
      },
      getFullDateAndTime(){
        let today = new Date();
        let dd = today.getDate();
        let mm = today.getMonth() + 1; //January is 0!
        let day = (dd < 10) ? ('0' + dd) : dd;
        let month = (mm < 10) ? ('0' + mm) : mm;
        let yyyy = today.getFullYear();
        let hours = today.getHours();
        let minutes = today.getMinutes();
        let time = today.getTime();
        return (hours + "_" + "_" + minutes + "_" + time);
      },
      getFullDate(){
        let today = new Date();
        let dd = today.getDate();
        let mm = (today.getMonth() + 1); //January is 0!
        let day = (dd < 10) ? ("0" + dd) : dd;
        let month = (mm < 10) ? ("0" + mm) : mm;
        let yyyy = today.getFullYear();

        return (yyyy + "" + month + "" + day);
      },
      updatedDataStock(item, index, target){
        this.purchase = item;
      }
    },
    mounted() {
      this.getProductList();
      this.getAllWarehouse();
      this.showStockTable();
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
