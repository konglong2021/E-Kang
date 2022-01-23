<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
          <div class="control-panel">
            <div class="panel-top">
              <div class="content-panel-left">
                <h3 class="head-title">Categories Overview</h3>
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
                       <b-button href="#"  title="Add new Category" size="sm" variant="primary" @click="showModal()">
                         New Category
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
              <b-table class="content-table-scroll-category"
                       sticky-header="true"
                       :items="items"
                       :fields="fields"
                       :per-page="0"
                       :current-page="currentPage"
                       head-variant="light"
                >
                <template #cell(actions)="row">
                  <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                    <i class="fa fa-eye"></i>
                  </b-button>
                  <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustCategory(row.item, row.index, $event.target)">
                    <i class="fa fa-edit"></i>
                  </b-button>
                </template>
                  <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
              </b-table>
            </div>
          </div>
      </div>
      <b-modal id="modal-create-category" ref="category-form-modal" size="lg"
                 @hidden="onReset" cancel-title="Cacnel"
                 @ok="onSubmit" ok-title="Save" title="New Category">
          <b-form enctype="multipart/form-data">
            <div class="full-content">
            </div>
            <div class="full-content">
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-enname'" class="label-input">Name</label></b-col>
                <b-col sm="8"><b-form-input :id="'input-enname'" type="text" v-model="category.en_name" class="input-content"></b-form-input></b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-khname'" class="label-input">Name(KH)</label></b-col>
                <b-col sm="8"><b-form-input :id="'input-khname'" type="text" v-model="category.kh_name" class="input-content"></b-form-input></b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-category-brand'" class="label-input">Brands</label></b-col>
                <b-col sm="8">
                  <multiselect
                    class="input-category-brand"
                    v-model="category.brand" :options="brands"
                    track-by="name" label="name" :multiple="true"
                    :show-labels="false" aria-placeholder="Select brands"
                    @select="selectionChange"
                    @remove="removeElement"
                  ></multiselect>
                </b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-description'" class="label-input">Description</label></b-col>
                <b-col sm="8"><b-form-textarea :id="'input-description'" class="input-content" v-model="category.description"></b-form-textarea></b-col>
              </b-row>
            </div>
          </b-form>
        </b-modal>
      <b-modal id="modal-view-product" ref="view-product-form-modal" size="lg"
        title="Product View" title-class="text-center mx-auto" hide-footer
      >
        <b-form enctype="multipart/form-data" v-if="categoryView !== null && categoryView !== undefined">
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-enname'" class="label-input">Name</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-enname'" type="text" v-model="categoryItemSelected.en_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-khname'" class="label-input">Name(KH)</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-khname'" type="text" v-model="categoryItemSelected.kh_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-category'" class="label-input">Brands</label></b-col>
              <b-col sm="8">
<!--                <multiselect class="input-content" v-model="category.brand" :options="brands" track-by="name" label="name" :multiple="true" :show-labels="false" aria-placeholder="Select brands"></multiselect>-->
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-description'" class="label-input">Description</label></b-col>
              <b-col sm="8"><b-form-textarea :id="'input-description'" class="input-content" v-model="categoryItemSelected.description"></b-form-textarea></b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
    </b-row>
  </b-container>
</template>
<script>
  import {empty} from "../.nuxt/utils";

  export default {
    middleware: "local-auth",
    layout:'inventoryui',
    data(){
      return {
        categories:[],
        perPage: 8,
        currentPage: 1,
        items:[],
        fields: [
          { key: 'name', label: 'Name' },
          { key: 'parent', label: 'Parent' },
          { key: 'brand', label: 'Brand' },
          { key: 'total_product', label: 'Total Product' },
          { key: 'actions', label: 'Actions' }
        ],
        category: {}, //new item for category
        brands: [],
        isLoading: false,
        categoryItemSelected: {},
        categoryView : {},
        totalRows: 0,
      }
    },
    watch : {
      currentPage: {
        handler: function(value) {
          this.getCategories().catch(error => {
            console.error(error)
          });
        }
      }
    },
    methods:{
      async onGetBrand(){
        let self = this;
        await self.$axios.get('/api/brand')
          .then(function (response) {
            if(response.hasOwnProperty("data")){
              for(let index=0; index < response.data.brands.length; index++){
                self.brands.push({name : response.data.brands[index]["name"], value : response.data.brands[index]["id"]});
              }
            }
          }).catch(function (error) {
            self.$toast.error("getting data error ").goAway(2000);
            console.log(error);
          });
      },
      async getCategories(){
        let self = this;
        self.isLoading = true;
        self.items = [];

        await self.$axios.get('/api/category').then(function (response) {
          if(response.hasOwnProperty("data") && response.data && response.data.hasOwnProperty("data")){
            self.isLoading = false;
            let items = [];
            let responseData = self.cloneObject(response.data.data);
            for(let index=0; index < responseData.length; index++){
              let categoryItem = responseData[index];
              let brands = [];
              let item = {};

              if(categoryItem["brands"] && categoryItem["brands"].length > 0){
                for(let i =0; i < categoryItem["brands"].length; i++){
                  brands.push(categoryItem["brands"][i]["name"]);
                }
              }
              item["brands"] = self.cloneObject(categoryItem["brands"]);
              item['id'] = categoryItem["id"];
              item['kh_name'] = categoryItem["kh_name"];
              item['en_name'] = categoryItem["en_name"];
              item['name'] = categoryItem["name"];
              item['parent'] = "--ROOT--";
              item['brand'] = brands.join(", ");
              item['products_count'] = categoryItem["products_count"];
              items.push(item);
            }
            self.items = self.cloneObject(items);
          }
        }).catch(function (error) {
          self.$toast.error("getting data error ").goAway(2000);
          console.log(error);
        });
      },
      onReset(){},
      async onSubmit(){
        let dataSubmit = {};
        let brands = [];
        if(this.category.brand && this.category.brand.length > 0){
          for(let index=0; index < this.category.brand.length; index++){
            brands.push(this.category.brand[index]["value"]);
          }
        }

        dataSubmit["en_name"] = this.category.en_name;
        dataSubmit["kh_name"] = this.category.kh_name;
        dataSubmit["brand"] = JSON.stringify(brands);
        dataSubmit["description"] = this.category.description;

        if(this.product.hasOwnProperty("id") && this.product.id){
          formData.append("_method", "PUT");

          this.$toast.info("Data starting submit").goAway(1500);
          await this.$axios.post('/api/category' + this.category.id, dataSubmit)
            .then(function (response) {
              if(response){
                this.$toast.success("Submit data successfully").goAway(2000);
              }
            })
            .catch(function (error) {
              console.log(error);
              this.$toast.error("Submit data getting error").goAway(3000);
            });
        }
        else{
          this.$toast.info("submit data in progress").goAway(1000);
          await this.$axios.post('/api/category', dataSubmit)
            .then(function (response) {
              if(response.data.hasOwnProperty("data")){
                let categoryItem = response.data.data;
                let brands = [];
                let item = {};

                if(categoryItem["brands"] && categoryItem["brands"].length > 0){
                  for(let i =0; i < categoryItem["brands"].length; i++){
                    brands.push(categoryItem["brands"][i]["name"]);
                  }
                }
                item['name'] = categoryItem["name"];
                item['parent'] = "--ROOT--";
                item['brand'] = brands.join(", ");
                item['products_count'] = categoryItem["products_count"];
                this.items.push(item);
                this.$toast.success("submit data is successfully").goAway(1500);
                this.hideModal();
              }
            })
            .catch(function (error) {
              this.$toast.success("submit data is getting error").goAway(2000);
              console.log(error);
            });
        }
      },
      showModal(){
        this.$refs['category-form-modal'].show();
      },
      viewDetail(item, index, target){
        this.categoryView = item;
        this.$refs['view-category-form-modal'].show();
      },
      adjustCategory(item, index, target){
        this.$refs['category-form-modal'].show();
        this.category = {};
        console.log(item);
        if(!empty(item)){
          this.category["id"] = item.hasOwnProperty("id") ? JSON.parse(item["id"]) : null;
          this.category["name"] = item.hasOwnProperty("name") ? JSON.parse(JSON.stringify(item["name"])) : null;
          this.category["kh_name"] = item.hasOwnProperty("kh_name") ? JSON.parse(item["kh_name"]) : null;
          this.category["en_name"] = item.hasOwnProperty("name") ? JSON.parse(JSON.stringify(item["name"])) : null;
          this.category["description"] = item.hasOwnProperty("description") ? JSON.parse(item["description"]) : null;

          let brandList = [];
          if(item.hasOwnProperty("brands")){
            //let brandsArray = item["brand"].split(',');
            for (let index=0; index < item["brands"].length; index++){
              brandList.push({name: item["brands"][index]['name'], value: item["brands"][index]['id']});
            }
            this.category["brand"] = this.cloneObject(brandList);
          }
          console.log(this.category);
        }
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
      selectionChange($obj){
        this.$forceUpdate();
      },
      removeElement($obj){
        this.$forceUpdate();
      }
    },
    mounted() {
      this.onGetBrand();
      this.getCategories();
    },
    computed:{
      rows() {
        return this.items.length
      }
    },
  }
</script>
<style scoped>
  .content-table-scroll-category {
    max-height: calc(100vh - 165px);
  }
</style>

