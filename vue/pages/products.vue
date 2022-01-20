<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Products Overview</h3>
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
                        New Product
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
          <div v-if="numberPrint > 0" :id="'barcode-' + barcodeItem.code" class="display-inline-block">
            <div v-for="item in barcodeListToPrint" class="display-inline-block">
              <barcode :value="item"></barcode>
            </div>
          </div>
        </div>
        <div>
        </div>
        <add-new-product-modal v-model="newProductModal" :productItemSelected="productItemSelected" @checkingProductAdd="checkingProductAdd($event)" /> <!--no need to import it will automatically rendering it -->
        <b-modal
          id="modal-view-product" ref="view-product-form-modal" size="lg"
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
          id="modal-input-number-barcode" ref="input-number-barcode-modal" size="lg"
          title="Product View"  @ok="barcodePrint" ok-title="Save" title-class="text-center mx-auto">
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
          {key: 'name', label: 'Name'},
          {
            key: 'code', label: 'BarCode',
            tdAttr: (_, __, {name, code}) => ({
              id: `${code}`
            }), tdClass: 'td-code'
          },
          {key: 'category_name', label: 'Category'},
          {key: 'brand', label: 'Brand'},
          {key: 'loyalty', label: 'Loyalty'},
          {key: 'actions', label: 'Actions'}
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
        this.isLoading = true;
        const response = await this.$axios.get('/api/product');
        if (response.hasOwnProperty("data")) {
          this.isLoading = false;
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
      },
      showModal() {
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component
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
        let foundItem = false, indexItem = null;
        if ($event) {
          let brands = $event.brands;
          let itemProduct = $event.itemProduct;
          if (this.items.length > 0) {
            for (let i = 0; i < this.items.length; i++) {
              if (itemProduct.id === this.items[i].id) {
                foundItem = true;
                this.items[indexItem] = itemProduct;
                let newBrands = [];

                if (brands && brands.length > 0) {
                  console.log(this.brand);
                  // for(let i =0; i < productItem["brands"].length; i++){
                  //   brands.push(productItem["brands"][i]["name"]);
                  // }
                }
              }
              break;
            }
          }
        }
        if (!foundItem) {
          await this.items.push(itemProduct);
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
      const response = await this.$axios.post('/api/product/search', {search: this.searchInput});
      if (response) {
        this.isLoading = false;
        if (response.hasOwnProperty('data')) {
          this.perPage = response.data["per_page"];
          this.currentPage = response.data['current_page'];
          this.totalRows = response.data['total'];
        }
        if (response.data && response.data.hasOwnProperty("data") && response.data.length > 0) {
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
            newItem['category_id'] = productItem["category_id"];
            newItem['description'] = productItem["description"];
            newItem['sale_price'] = productItem["sale_price"];
            newItem['code'] = productItem["code"];
            newItem["en_name"] = productItem["en_name"];
            newItem["kh_name"] = productItem["kh_name"];
            items.push(newItem);
          }
          this.items = this.cloneObject(items);
        } else {
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
    },
    barcodeInputNumberPrint(item) {
      this.barcodeItem = item;
      this.$refs['input-number-barcode-modal'].show();
    },
    updateNumberBarcodePrint(input) {
      if (input > 0) {
        for (let i = 1; i <= input; i++) {
          this.barcodeListToPrint.push(this.barcodeItem.code);
        }
      }
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
