<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">{{ $t('content_title_product')}}</h3>
            </div>
            <div class="content-panel-right">
               <b-container class="col-6 mx-auto menu-wrapper">
                <b-row>
                  <b-col>
                    <div class="input-group input-group-sm search-content">
                       <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                      <input class="form-control input-search-box" type="search" placeholder="Search..." v-model="searchInput" @keyup.enter="searchProduct()" @change="handleClick" />
                    </div>
                  </b-col>
                  <div class="btn-wrapper">
                       <b-button href="#"  title="Add new Category" size="sm" variant="primary"
                       @click="showModal()">
                        {{ $t('title_new_product') }}
                        <i class="fa fa-plus" aria-hidden="true"></i>
                      </b-button>
                  </div>

                </b-row>
               </b-container>
            </div>
            <div class="panel-bottom"></div>
          </div>
        </div>
        <div class="content-product" v-bind:class="{ 'content-product-full-height': isLoading }">
          <div class="content-loading" v-if="isLoading">
            <div class="spinner-grow text-muted"></div>
          </div>
          <div v-if="!isLoading">
            <div v-if="items">
              <b-table class="content-table-scroll-product"
                       id="tableau"
                       sticky-header="true"
                       :items="items"
                       :fields="fields"
                       :per-page="0"
                       :current-page="currentPage"
                       head-variant="light"
              >
                <template #cell(code)="row">
                  <div style="display: inline-block; overflow : hidden;">
                    <barcode :value="row.item.code" height ='30' width = '1.9' marginTop="0" marginBottom="0" fontSize="12" textMargin="1"></barcode>
                  </div>
                </template>
                <template #cell(actions)="row">
                  <b-button size="sm" variant="primary" title="View Inventory History Detail" @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                    <i class="fa fa-eye"></i>
                  </b-button>
                  <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustProduct(row.item, row.index, $event.target)">
                    <i class="fa fa-edit"></i>
                  </b-button>
                  <b-button size="sm" title="Print barcode" variant="primary" @click="barcodeInputNumberPrint(row.item)">
                    <i class="fa fa-print"></i>
                  </b-button>
                </template>
                <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
              </b-table>
            </div>
          </div>
          <div style="width: 60mm; height: 35mm; display:inline-block;" v-if="numberPrint > 0" :id="'barcode-' + barcodeItem.code">
            <div v-if="barcodeItem.code.length > 12">
              <div v-for="item in barcodeListToPrint">
                <span style="text-align: center !important;">{{ barcodeItem.name }}</span>
                <barcode :value="item" height ='75' width="2" paddingTop="0" marginTop="0" marginBottom="0" fontSize="12" paddingBottom="0" marginLeft="0"></barcode>
              </div>
            </div>
            <div style="width: 60mm; height: 35mm; display:inline-block;" v-if="barcodeItem.code.length === 12">
              <div v-for="item in barcodeListToPrint">
                <span style="margin-left:12px; text-align: center !important; display: block;">{{ barcodeItem.name }}</span>
                <barcode :value="item" height ='80' width="2" marginTop="0" marginBottom="0" fontSize="12"></barcode>
              </div>
            </div>
          </div>
        </div>
        <add-new-product-modal v-model="newProductModal" :productItemSelected="productItemSelected" @checkingProductAdd="checkingProductAdd($event)" /> <!--no need to import it will automatically rendering it -->
        <b-modal
          id="modal-view-product" ref="view-product-form-modal" size="lg" no-close-on-backdrop
          title="Product View" title-class="text-center mx-auto" hide-footer
        >
          <b-form enctype="multipart/form-data" v-if="productView !== null && productView !== undefined">
            <div class="product-data data">
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-enname'" class="label-input label-margin-top">ឈ្មោះទំនិញជាអង់គ្លេស</label></b-col>
                <b-col sm="4">
                  <b-form-input :id="'input-enname'" type="text" v-model="productView.en_name" class="input-content input-no-background" disabled></b-form-input>
                </b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-khname'" class="label-input label-margin-top">ឈ្មោះទំនិញជាខ្មែរ</label></b-col>
                <b-col sm="4">
                  <b-form-input :id="'input-khname'" type="text" v-model="productView.kh_name" class="input-content input-no-background" disabled></b-form-input>
                </b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-category'" class="label-input label-margin-top">ប្រភេទទំនិញ</label></b-col>
                <b-col sm="4">
                  <b-form-input :id="'input-category'" class="input-content input-no-background" v-model="productView.category" disabled></b-form-input>
                </b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-sale_price'" class="label-input label-margin-top">តម្លៃលក់</label></b-col>
                <b-col sm="4">
                  <b-form-input :id="'input-sale_price'" type="number" class="input-content input-no-background" v-model="productView.sale_price" disabled></b-form-input>
                </b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-description'" class="label-input label-margin-top">ការពិពណ៌នា</label></b-col>
                <b-col sm="4">
                  <b-form-textarea :id="'input-description'" class="input-content input-no-background" v-model="productView.description" disabled></b-form-textarea>
                </b-col>
              </b-row>
            </div>
            <div v-if="productView.image !== null" class="product-data image">
              <div class="pro-item">
                <img :src="generateImageUrlDisplay(productView.image)">
              </div>
            </div>
          </b-form>
        </b-modal>
        <b-modal
          id="modal-input-number-barcode" ref="input-number-barcode-modal" size="lg" no-close-on-backdrop
          title="Product View"  @ok="barcodePrint" ok-title="Save" title-class="text-center mx-auto" no-close-on-backdrop>
            <b-form>
              <div class="product-data data">
                <b-row class="my-1">
                  <b-col sm="4"><label :for="'input-number-barcode'" class="label-input label-margin-top">ចំនួនព្រីនចេញ</label></b-col>
                  <b-col sm="4">
                    <b-form-input :id="'input-number-barcode'" type="text" v-model="numberPrint" @change="updateNumberBarcodePrint(numberPrint)" class="input-content input-no-background"></b-form-input>
                  </b-col>
                </b-row>
              </div>
            </b-form>
        </b-modal>
      </div>
    </b-row>
  </b-container>
</template>
<script>
  export default {
    middleware: "local-auth",
    layout: 'inventoryui',
    data() {
      return {
        newProductModal: {
          showModal: false,
        },
        searchInput: null,
        perPage: 3,
        currentPage: 1,
        items: [],
        fields: [
          {key: 'name', label: this.$t('label_name')},
          {
            key: 'code', label: this.$t('title_barcode'),
            tdAttr: (_, __, {name, code}) => ({
              id: `${code}`
            }), tdClass: 'td-code'
          },
          {key: 'category_name', label: this.$t('title_category')},
          {key: 'brand', label: this.$t('title_brand')},
          {key: 'loyalty', label: 'Loyalty'},
          {key: 'actions', label: this.$t('title_action')}
        ],
        category: {}, //new item for category
        isLoading: false,
        productItemSelected: {},
        responseProductList: [],
        brandList: [],
        productView: {},
        totalRows: 0,
        numberPrint: 0,
        barcodeItem: null,
        barcodeListToPrint: [],
      }
    },
    watch: {
      newProductModal: {
        handler(val) {
        },
        deep: true
      },
      currentPage: {
        handler: function (value) {
          this.getListProducts().catch(error => {
            console.error(error)
          });
        }
      }
    },
    methods: {
      async getListProducts() {
        let self = this;
        self.isLoading = true;
        await self.$axios.get('/api/product').then(function (response) {
        if (response.hasOwnProperty("data")) {
          self.isLoading = false;
          let items = [];
          self.responseProductList = response.data;
          for (let index = 0; index < response.data.length; index++) {
            let productItem = response.data[index];
            let newItem = {};
            let brands = [];
            if (productItem["brands"] && productItem["brands"].length > 0) {
              for (let i = 0; i < productItem["brands"].length; i++) {
                brands.push(productItem["brands"][i]["name"]);
              }
            }
            newItem['id'] = productItem["id"];
            newItem['name'] = productItem["en_name"] + " (" + productItem["kh_name"] + ")";
            newItem['brand'] = brands.join(", ");
            newItem['loyalty'] = "N/A";
            newItem['image'] = productItem["image"];
            newItem['brands'] = productItem["brands"];

            if (productItem.hasOwnProperty("categories")) {
              newItem['category_name'] = productItem["categories"]["name"];
              newItem["categories"] = self.cloneObject(productItem["categories"]);
            }
            newItem['description'] = productItem["description"];
            newItem['sale_price'] = productItem["sale_price"];
            newItem['code'] = productItem["code"];
            newItem["en_name"] = productItem["en_name"];
            newItem["kh_name"] = productItem["kh_name"];
            items.push(newItem);
          }
          self.items = self.cloneObject(items);
          self.items.sort(self.sortByName);
        }
        })
          .catch(function (error) {
            console.log(error);
            self.$toast.error("Submit data getting error").goAway(3000);
          });
      },
      sortByName(a, b) {
        if (a.name < b.name)
          return -1;
        if (a.name > b.name)
          return 1;
        return 0;
      },
      showModal() {
        this.newProductModal.showModal = true;
        this.productItemSelected = {};
      },
      viewDetail(item, index, target) {
        this.productView = item;
        this.$refs['view-product-form-modal'].show();
      },
      adjustProduct(item, index, target) {
        this.newProductModal.showModal = true;
        this.productItemSelected = {};
        this.productItemSelected.id = item["id"];
        this.productItemSelected.en_name = item["en_name"];
        this.productItemSelected.kh_name = item["kh_name"];
        this.productItemSelected.image = item["image"];
        let brandList = [];
        if (item["brands"] && item["brands"].length > 0) {
          for (let index = 0; index < item["brands"].length; index++) {
            brandList.push({name: item["brands"][index]['name'], value: item["brands"][index]['id']});
          }
          this.productItemSelected.brand = brandList;
        }
        if (item.hasOwnProperty("categories") && item["categories"]["id"]) {
          this.productItemSelected.category = item["categories"]["id"];
        }
        this.productItemSelected.description = item["description"];
        this.productItemSelected.sale_price = item["sale_price"];
        this.productItemSelected.code = item["code"];
      },
      async checkingProductAdd($event) {
        let foundItem = false, indexItem = null, self = this;
        if ($event && $event.hasOwnProperty("brands") && $event.hasOwnProperty("itemProduct")) {
          let brands = $event.brands;
          let itemProduct = this.cloneObject($event.itemProduct);
          if (self.items.length > 0) {
            for (let i = 0; i < self.items.length; i++) {
              if (itemProduct.id === self.items[i].id) {
                foundItem = true;
                self.items[indexItem] = itemProduct;
                break;
              }
            }
          }
          if (foundItem === false) {
            self.items.unshift(itemProduct);
          }
        }
      },
      generateImageUrlDisplay(img) {
        if (typeof window !== "undefined") {
          return window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img;
        }
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
      async searchProduct() {
        this.isLoading = true;
        this.items = [];
        const response = await this.$axios.post('/api/product/search', {search: this.searchInput});
        if (response) {
          this.isLoading = false;
          if (response.data && response.hasOwnProperty("data") && response.data.length > 0) {
            let items = [];
            this.responseProductList = response.data;
            for (let index = 0; index < response.data.length; index++) {
              let productItem = response.data[index];
              let newItem = {};
              let brands = [];
              if (productItem["brands"] && productItem["brands"].length > 0) {
                for (let i = 0; i < productItem["brands"].length; i++) {
                  brands.push(productItem["brands"][i]["name"]);
                }
              }
              newItem['id'] = productItem["id"];
              newItem['name'] = productItem["en_name"] + " (" + productItem["kh_name"] + ")";
              newItem['brand'] = brands.join(", ");
              newItem['loyalty'] = "N/A";
              newItem['image'] = productItem["image"];
              newItem['brands'] = productItem["brands"];

              if (productItem.hasOwnProperty("categories")) {
                newItem['category_name'] = productItem["categories"]["name"];
                newItem["categories"] = this.cloneObject(productItem["categories"]);
              }

              newItem['description'] = productItem["description"];
              newItem['sale_price'] = productItem["sale_price"];
              newItem['code'] = productItem["code"];
              newItem["en_name"] = productItem["en_name"];
              newItem["kh_name"] = productItem["kh_name"];
              items.push(newItem);
            }
            this.items = this.cloneObject(items);
          }
          else {
            this.items = [];
          }
        }
      },
      handleClick(e) {
        if (e.target.value === '' || e.target.value === null || e.target.value === undefined) {
          this.searchInput = '';
          this.getListProducts();
        }
      },
      barcodePrint() {
        this.$htmlToPaper(("barcode-" + this.barcodeItem.code));
        this.barcodeItem = {};
        this.numberPrint = 0;
      },
      barcodeInputNumberPrint(item) {
        this.barcodeItem = item;
        this.$refs['input-number-barcode-modal'].show();
      },
      updateNumberBarcodePrint(input) {
        this.barcodeListToPrint = [];
        if (input > 0) {
          for (let i = 1; i <= input; i++) {
            this.barcodeListToPrint.push(this.barcodeItem.code);
          }
        }
      },
    },
    mounted() {
      this.getListProducts();
    },
    computed:{
      rows() {
        return this.items.length
      }
    },
  }
</script>

<style scoped>
  .product-data{
    display: inline-block;
    float: left;
  }
  .data{
    width: 70%;
    margin: 5px;
  }
  .image{
    width: 28%;
  }
  .pro-item {
    width:100%;
    height:250px;
    justify-content:center;
    align-items:center;
    overflow:hidden
  }
  .pro-item img {
    flex-shrink:0;
    -webkit-flex-shrink: 0;
    height: 100%;
  }
  #tableau .td-code {
    width: 20vw;
  }

  #tableau div #barcodecontainer {
    width: 100%;
  }
  .content-table-scroll-product{
    max-height: calc(100vh - 165px);
  }
</style>
