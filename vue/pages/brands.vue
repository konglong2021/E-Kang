<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
          <div class="control-panel">
            <div class="panel-top">
              <div class="content-panel-left">
                <h3 class="head-title">Brands Overview</h3>
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
                        New Brand
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
              <b-table class="content-table-body"
                       :items="items"
                       :fields="fields"
                       :per-page="0"
                       :current-page="currentPage"
                       stacked="md"
                       show-empty
                       small
              >
                <template #cell(actions)="row">
                  <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                    <i class="fa fa-eye"></i>
                  </b-button>
                  <b-button size="sm" title="Adjust invetory stock" variant="success" @click="adjustBrand(row.item, row.index, $event.target)">
                    <i class="fa fa-edit"></i>
                  </b-button>
                </template>
                <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
              </b-table>
              <div class="content-pagination">
                <b-pagination v-model="currentPage" :per-page="perPage" :total-rows="totalRows" align="right"></b-pagination>
              </div>
            </div>
          </div>
      </div>
      <b-modal id="modal-create-category" ref="brand-form-modal" size="lg"
               @hidden="onReset" cancel-title="Cacnel"
               @ok="onSubmit" ok-title="Save" title="New Brand">
        <b-form enctype="multipart/form-data">
          <div class="full-content">
          </div>
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-enname'" class="label-input">Name</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-enname'" type="text" v-model="brand.en_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1" style="display: none;">
              <b-col sm="4"><label :for="'input-khname'" class="label-input">Name(KH)</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-khname'" type="text" v-model="brand.kh_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1" >
              <b-col sm="4"><label :for="'input-category'" class="label-input">Category</label></b-col>
              <b-col sm="8">
                <multiselect class="input-content" v-model="brand.category" :options="categories" track-by="name" label="name" :multiple="true" :show-labels="false" aria-placeholder="Select categories"></multiselect>
              </b-col>
            </b-row>

            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-description'" class="label-input">Description</label></b-col>
              <b-col sm="8"><b-form-textarea :id="'input-description'" class="input-content" v-model="brand.description"></b-form-textarea></b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
    </b-row>
  </b-container>
</template>
<script>
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
          { key: 'total_product', label: 'Total Product' },
          { key: 'categories', label: 'Categories' },
          { key: 'actions', label: 'Actions' }
        ],
        brand:{},
        isLoading: false,
        totalRows: 0,
      }
    },
    watch : {
      currentPage: {
        handler: function(value) {
          this.getBrands().catch(error => {
            console.error(error)
          });
        }
      }
    },
    mounted() {
      this.getCategories();
      this.getBrands();
    },
    methods:{
      async getCategories(){
        const response = await this.$axios.get('/api/category');
        if(response.data.hasOwnProperty("data")){
          for(let index=0; index < response.data.data.length; index++){
            this.categories.push({name : response.data.data[index]["name"], value : response.data.data[index]["id"]});
          }
        }
      },
      async getBrands(){
        this.isLoading = true;
        const response = await this.$axios.get('/api/brand');
        if(response.data.hasOwnProperty("brands")){
          this.isLoading = false;
          let items = [];
          for(let index=0; index < response.data.brands.length; index++){
            let brandItem = response.data.brands[index];
            let categories = [];
            let item = {};
            if(brandItem["categories"] && brandItem["categories"].length > 0){
              for(let i =0; i < brandItem["categories"].length; i++){
                categories.push(brandItem["categories"][i]["name"]);
              }
            }
            item['name'] = brandItem["name"] + (brandItem["kh_name"] ? "(" + brandItem["kh_name"] + ")": "");
            item['categories'] = categories.join(", ");
            item['parent'] = "--ROOT--";
            item['total_product'] = brandItem["products_count"];
            items.push(item);
          }
          this.items = this.cloneObject(items);
        }
      },
      onReset(){},
      onSubmit(){
        let dataSubmit = {};
        let categories = [];
        if(this.brand.category.length > 0){
          for(let i =0; i < this.brand.category.length; i++){
            categories.push(this.brand.category[i]["value"]);
          }
        }
        dataSubmit["kh_name"] = this.brand.kh_name;
        dataSubmit["name"] = this.brand.en_name;
        dataSubmit["categories"] = JSON.stringify(categories);
        dataSubmit["description"] = this.brand.description;

        this.$toast.info("submit data in progress").goAway(1000);
        this.$axios.post('/api/brand', dataSubmit)
          .then(function (response) {
            if(response.data.hasOwnProperty("data")){
              this.$toasted.success("Data successfully added..!").goAway(1500);
              this.hideModal();
            }
          })
          .catch(function (error) {
            this.$toast.success("Data is getting error").goAway(2000);
            console.log(error);
          });
      },
      showModal(){
        this.$refs['brand-form-modal'].show();
      },
      viewDetail(item, index, target){
        this.categoryView = item;
        this.$refs['view-category-form-modal'].show();
      },
      adjustBrand(item, index, target){
        this.$refs['category-form-modal'].show();
        this.categoryItemSelected = {};
        this.categoryItemSelected.id = item["id"];
        this.categoryItemSelected.kh_name = item["kh_name"];
        this.categoryItemSelected.en_name = item["en_name"];
        this.categoryItemSelected.parent = "--ROOT--";
        this.categoryItemSelected.products_count = item["products_count"];
        let brandList = [];
        if(item["brands"] && item["brands"].length > 0){
          for (let index=0; index < item["brands"].length; index++){
            brandList.push({name: item["brands"][index]['name'], value: item["brands"][index]['id']});
          }
          this.categoryItemSelected.brand = brandList;
        }
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      }
    },
    computed:{
    },

  }
</script>
