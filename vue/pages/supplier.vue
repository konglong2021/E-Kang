<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="display-inline-block full-with">
        <div class="inventory-dashboard-content main-page-content">
          <div class="control-panel">
            <div class="panel-top">
              <div class="content-panel-left">
                <h3 class="head-title">Supplier Overview</h3>
              </div>
              <div class="content-panel-right">
                <b-container class="col-6 mx-auto menu-wrapper">
                  <b-row>
                    <b-col>
                      <div class="input-group input-group-sm search-content">
                        <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                        <input class="form-control input-search-box" type="search" placeholder="Search..." v-model="searchInput" @keyup.enter="searchingFunction()" @change="handleClick"/>
                      </div>
                    </b-col>
                    <div class="btn-wrapper">
                      <b-button href="#"  title="Add new Supplier" size="sm" variant="primary"
                                @click="showModal()">
                        New Supplier
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
            <div class="content-loading" v-if="isLoading">
              <div class="spinner-grow text-muted"></div>
            </div>
            <div v-if="!isLoading">
              <div v-if="items">
                <b-table
                  class="content-table-scroll-supplier"
                  sticky-header="true"
                  :items="items" :fields="fields"
                  head-variant="light"
                >
                    <template #cell(actions)="row">
                      <b-button size="sm" variant="primary" title="View Supplier data Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                        <i class="fa fa-eye"></i>
                      </b-button>
                      <b-button size="sm" title="Adjust Supplier data" variant="success" @click="editData(row.item, row.index, $event.target)">
                        <i class="fa fa-edit"></i>
                      </b-button>
                    </template>
                </b-table>
              </div>
            </div>
          </div>
        </div>
        <b-modal id="modal-create-supplier" ref="supplier-form-modal" size="lg"
                 @hidden="onResetSupplier" cancel-title="Cancel" no-close-on-backdrop
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
        items:[],
        fields: [
          { key: 'name', label: 'Name' },
          { key: 'address', label: 'Address' },
          { key: 'email', label: 'Email' },
          { key: 'phone', label: 'Phone' },
          { key: 'actions', label: 'Actions' }
        ],
        supplier: {},
        perPage: 8,
        currentPage: 1,
        totalRows: 0,
        isLoading : true,
        maskDate: [/\d/, /\d/, '/', /\d/, /\d/, '/', /\d/, /\d/, /\d/, /\d/],
        searchInput: null,
      }
    },
    watch : {
      currentPage: {
        handler: function(value) {
          this.getAllSupplier().catch(error => {
            console.error(error)
          });
        }
      }
    },
    methods:{
      showModal(){
        this.$refs['supplier-form-modal'].show();
      },
      hideModalSupplier(){
        this.$refs['supplier-form-modal'].hide();
      },
      async getAllSupplier(){
        let vm = this;
        await this.$axios.get('/api/supplier')
          .then(function (response) {
            vm.isLoading = false;
            if(response && response.hasOwnProperty("data")){
              vm.items = vm.cloneObject(response.data);
            }
          }).catch(function (error) {
            console.log(error);
            vm.$toast.error("Getting data error").goAway(3000);
          });
      },
      onSubmitSupplier(){
        let vm = this;
        vm.isLoading = true;
        vm.$toast.info("Submit data is starting").goAway(1500);
       if(!vm.supplier.hasOwnProperty("id")){
         this.$axios.post('/api/supplier/', vm.supplier)
           .then(function (response) {
             vm.isLoading = false;
             vm.$toast.success("Submit data is successful").goAway(2000);
             if(response.data.hasOwnProperty("supplier")){
               let data = response.data.supplier;
               vm.items.push(data);
               vm.supplier = {};
             }
           }).catch(function (error) {
           vm.$toast.error("getting data error ").goAway(2500);
           console.log(error);
         });
       }
       else {
         this.$axios.put('/api/supplier/' + vm.supplier.id, vm.supplier)
           .then(function (response) {
             vm.isLoading = false;
             vm.$toast.success("Submit data is successful").goAway(2000);
             if(
               response.data.hasOwnProperty("supplier")
               && response.data.hasOwnProperty("success")
               && response.data.success === true
             ){
               let data = response.data.supplier;
               vm.items.push(data);
               vm.hideModalSupplier();
               vm.supplier = {};
             }
           }).catch(function (error) {
           vm.$toast.error("getting data error ").goAway(2500);
           console.log(error);
         });
       }
      },
      onResetSupplier(){
        this.supplier = {};
      },
      viewDetail(item, index, target){},
      editData(item, index, target){
        this.supplier = item;
        this.$refs['supplier-form-modal'].show();
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
      async searchingFunction(){
        let self = this;
        self.isLoading = true;
        self.items = [];
        await this.$axios.post('/api/supplier/search', {search: this.searchInput}).then(function (response) {
          if(response && response.hasOwnProperty("data")){
            self.items = vm.cloneObject(response.data);
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      },
      handleClick(e) {
        if (e.target.value === '' || e.target.value === null || e.target.value === undefined) {
          this.searchInput = null;
          this.getAllSupplier();
        }
      },
    },
    mounted() {
      this.getAllSupplier().catch(error => {
        console.error(error)
      });
    }
  }
</script>

<style scoped>
  .content-table-scroll-supplier{
    max-height: calc(100vh - 165px);
  }
</style>
