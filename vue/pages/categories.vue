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
                         New Category<i class="fa fa-plus" aria-hidden="true"></i>
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
              <b-row class="my-1" style="display: none;">
                <b-col sm="4"><label :for="'input-category'" class="label-input">Parent</label></b-col>
                <b-col sm="8"><b-form-select :id="'input-category'" class="form-control input-content" v-model="category.category" :options="categories"></b-form-select></b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-category'" class="label-input">Brands</label></b-col>
                <b-col sm="8">
                  <multiselect class="input-content" v-model="category.brand" :options="brands" track-by="name" label="name" :multiple="true" :show-labels="false" aria-placeholder="Select brands"></multiselect>
                </b-col>
              </b-row>
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-description'" class="label-input">Description</label></b-col>
                <b-col sm="8"><b-form-textarea :id="'input-description'" class="input-content" v-model="category.description"></b-form-textarea></b-col>
              </b-row>
            </div>
          </b-form>
        </b-modal>
    </b-row>
  </b-container>
</template>
<script>
  export default {
    layout:'inventoryui',
    data(){
      return {
        categories:[],
        items:[
          // {
          //   name:'Phone ',
          //   parent:'--ROOT--',
          //   total_product:10,
          //
          // }
        ],
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
      }
    },
    methods:{
      async onGetBrand(){
        const response = await this.$axios.get('/api/brand');
        if(response.data.data){
          for(let index=0; index < response.data.data.length; index++){
            this.brands.push({name : response.data.data[index]["name"], value : response.data.data[index]["id"]});
          }
        }
      },
      async getCategories(){
        this.isLoading = true;
        const response = await this.$axios.get('/api/category');
        if(response.data.hasOwnProperty("data")){
          this.isLoading = false;
          let items = [];
          for(let index=0; index < response.data.data.length; index++){
            let categoryItem = response.data.data[index];
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
            item['total_product'] = categoryItem["products"].length;
            items.push(item);
          }
          this.items = items;
        }
      },
      onReset(){},
      onSubmit(){
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

        this.$toast.info("submit data in progress").goAway(1000);
        this.$axios.post('/api/category', dataSubmit)
          .then(function (response) {
            if(response.data.hasOwnProperty("data")){
              this.$toast.success("submit data is successfully").goAway(1500);
              this.hideModal();
            }
          })
          .catch(function (error) {
            this.$toast.success("submit data is getting error").goAway(2000);
            console.log(error);
          });
      },
      showModal(){
        this.$refs['category-form-modal'].show();
      }
    },
    mounted() {
      this.onGetBrand();
      this.getCategories();
    }
  }
</script>

