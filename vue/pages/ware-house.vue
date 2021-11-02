<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="display-inline-block full-with">
        <div class="content-loading" v-if="loadingFields">
          <div class="spinner-grow text-muted"></div>
        </div>
        <div class="inventory-dashboard-content main-page-content" v-if="!loadingFields">
          <div class="control-panel">
            <div class="panel-top">
              <div class="content-panel-left">
                <h3 class="head-title">WareHouse Overview</h3>
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
                      <b-button href="#"  title="Add new WareHouse" size="sm" variant="primary"
                                @click="showModal()">
                        New Loyalty
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
          <div>
          </div>
        </div>
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
          { key: 'actions', label: 'Actions' }
        ],
        warehouse: {},
        loadingFields: false,
        perPage: 8,
        currentPage: 1,
        totalRows: 0,
      }
    },
    watch : {
      currentPage: {
        handler: function(value) {
          this.getListData().catch(error => {
            console.error(error)
          });
        }
      }
    },
    methods:{
      async getListData(){
        let vm = this;
        vm.loadingFields = true;
        await this.$axios.get('/api/warehouse').then(function (response) {
          vm.loadingFields = false;
          if(response.data.hasOwnProperty('meta')){
            vm.perPage = response.data.meta["per_page"];
            vm.currentPage = response.data.meta['current_page'];
            vm.totalRows = response.data.meta['total'];
          }
          if(response && response.hasOwnProperty("data")){
            if(response.data){
              vm.items = this.cloneObject(response.data);
            }
          }
        }).catch(function (error) {
          console.log(error);
          vm.$toast.error("Getting data error").goAway(3000);
        });
      },
      showModal(){
        this.$refs['warehouse-form-modal'].show();
      },

      onResetWareHouse(){},
      onSubmitWareHouse(){},
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      }
    },
    mounted() {
      this.getListData();
    }
  }
</script>
