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
                <input class="form-control input-search-box" type="search" placeholder="Search..."/>
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
          <div v-if="items && items.length > 0 && !isLoading">
            <b-table
                :items="items"
                :fields="fields"
                stacked="md"
                show-empty
                small
            >
              <template #cell(image)="row">
                <div class="content-image">
                  <img :src="generateImageUrlDisplay(row.item.image)">
                </div>
              </template>
              <template #cell(actions)="row">
                <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                  <i class="fa fa-eye"></i>
                </b-button>
                <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustProduct(row.item, row.index, $event.target)">
                  <i class="fa fa-edit"></i>
                </b-button>
              </template>
            <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
            </b-table>
          </div>
        </div>
        <div>
        </div>
        <add-new-product-modal v-model="newProductModal" :productItemSelected="productItemSelected" @checkingProductAdd="checkingProductAdd($event)" /> <!--no need to import it will automatically rendering it -->
      </div>
    </b-row>
  </b-container>
</template>
<script>
  export default {
    middleware: "local-auth",
    layout:'inventoryui',
    data(){
      return {
         newProductModal:{
           showModal:false,
         },
        items:[],
        fields: [
          { key: 'name', label: 'Name' },
          { key: 'image', label: 'Icon' },
          { key: 'category', label: 'Category' },
          { key: 'brand', label: 'Brand' },
          { key: 'loyalty', label: 'Loyalty' },
          { key: 'actions', label: 'Actions' }
        ],
        category:{}, //new item for category
        isLoading: false,
        productItemSelected: {},
        responseProductList : [],
        brandList: [],
      }
    },
    watch:{
      newProductModal:{
        handler(val){
        },
        deep:true
      }
    },
    methods:{
      async  getListProducts(){
        this.isLoading = true;
        const response = await this.$axios.get('/api/product');
        if(response.data.hasOwnProperty("data")){
          this.isLoading = false;
          let items = [];
          this.responseProductList = response.data.data;
          for(let index=0; index < response.data.data.length; index++){
            let productItem = response.data.data[index];
            let newItem = {};
            let brands = [];

            if(productItem["brands"] && productItem["brands"].length > 0){
              for(let i =0; i < productItem["brands"].length; i++){
                brands.push(productItem["brands"][i]["name"]);
              }
            }
            newItem['id'] = productItem["id"];
            newItem['name'] = productItem["en_name"] + " (" + productItem["kh_name"] + ")";
            newItem['category'] = productItem["categories"]["name"];
            newItem['brand'] = brands.join(", ");
            newItem['loyalty'] = "N/A";
            newItem['image'] = productItem["image"];
            newItem['brands'] = productItem["brands"];
            newItem['categories'] = productItem["categories"];
            newItem['description'] = productItem["description"];
            newItem['sale_price'] = productItem["sale_price"];
            newItem['code'] = productItem["code"];
            newItem["en_name"] = productItem["en_name"];
            newItem["kh_name"] = productItem["kh_name"];
            items.push(newItem);
          }
          this.items = items;
        }
      },

      showModal(){
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component
        this.newProductModal.showModal = true;
      },
      viewDetail(item, index, target){

      },
      adjustProduct(item, index, target){
        this.newProductModal.showModal = true;
        this.productItemSelected = {};
        this.productItemSelected.id = item["id"];
        this.productItemSelected.en_name = item["en_name"];
        this.productItemSelected.kh_name = item["kh_name"];
        this.productItemSelected.category = item["categories"]["id"];
        this.productItemSelected.image = item["image"];
        let brandList = [];
        if(item["brands"] && item["brands"].length > 0){
          for (let index=0; index < item["brands"].length; index++){
            brandList.push({name: item["brands"][index]['name'], value: item["brands"][index]['id']});
          }
          this.productItemSelected.brand = brandList;
        }
        this.productItemSelected.description = item["description"];
        this.productItemSelected.sale_price = item["sale_price"];
        this.productItemSelected.code = item["code"];
      },
      async checkingProductAdd($event){
        if($event){
          await this.items.push($event);
        }
      },
      generateImageUrlDisplay(img){
        return  window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img;
      }
    },
    mounted() {
      this.getListProducts();

    }
  }
</script>

<style scoped>
  .content-image{
    display: table-cell;
    width: 100px;
    height: 100px;
    text-align: center;
  }
  .content-image img{
    max-width: 100%;
    max-height: 100%;
  }
</style>
