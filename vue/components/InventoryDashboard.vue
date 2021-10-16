<template>
  <div class="inventory-dashboard-content main-page-content">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h3 class="head-title">Inventory Overview</h3>
        </div>
        <div class="content-panel-right">
           <b-container class="col-10 mx-auto menu-wrapper">
            <b-row>
              <b-col>
                <div class="input-group input-group-sm search-content">
                  <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                  <input class="form-control input-search-box" type="search" placeholder="Search..."/>
                </div>
              </b-col>
              <div class="btn-wrapper">
                <b-button href="#" size="sm" variant="primary" title="Import product from Supplier">
                  Import<i class="fa fa-cart-plus" aria-hidden="true"></i>
                </b-button>
              </div>
              <div class="btn-wrapper margin-right-20-percentage">
                <b-button href="#" title="Add new Product" size="sm" variant="primary" @click="showModal()">
                  New Product<i class="fa fa-plus" aria-hidden="true"></i>
                </b-button>
              </div>
              <div class="btn-wrapper margin-right-20-percentage">
                <b-button href="#" title="Add new Supplier" size="sm" variant="primary"  @click="showSupplierModal()">
                  New Supplier<i class="fa fa-plus" aria-hidden="true"></i>
                </b-button>
              </div>
              <div class="btn-wrapper">
                <b-button href="#" title="Add new WareHouse" size="sm" variant="primary"  @click="showWareHouseModal()">
                  New WareHouse<i class="fa fa-plus" aria-hidden="true"></i>
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
    <add-new-product-modal v-model="newProductModal"/> <!--no need to import it will automatically rendering it -->
    <b-modal id="modal-create-supplier" ref="supplier-form-modal" size="lg"
             @hidden="onResetSupplier" cancel-title="Cacnel"
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
             @hidden="onResetWareHouse" cancel-title="Cacnel"
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
</template>

<script>
  export default {
    data() {
      return {
        newProductModal:{
          showModal:false
        },
        items:[
          {
            name_en:'IPhone SX',
            name_kh:'អាយផូន SX',
            sell_price:10.0,
            import_price:20.0,
            qty:10,
            store:'Main Store'
          }
        ],
        fields: [
          { key: 'name_en', label: 'Name' },
          { key: 'name_kh', label: 'Name(KH)' },
          { key: 'sell_price', label: 'Sell Price' },
          { key: 'import_price', label: 'Import Price' },
          { key: 'qty', label: 'Qty' },
          { key: 'store', label: 'Store' },

          { key: 'actions', label: 'Actions' }
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
      };
    },
    watch:{
      newProductModal:{
          handler(val){
              console.log('I am watching modal value',this.newProductModal);
          },
          deep:true
      }
    },
    methods: {
      getAllData(){
        this.$axios.get('/api/purchase')
          .then(function (response) {
            console.log(response.data);
          })
          .catch(function (error) {
            console.log(error);
          });
      },
      viewDetail(item,index,target){
        this.$toast.error('Error while authenticating');
        alert('detail click '+index);
      },
      adjustStock( item,index,target ){
           alert('adjust stock click '+index);
      },
      showModal(){
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component
        this.newProductModal.showModal = true;
        //alert('Debug me , I am going to popup the modal');
        //console.log('modal data' ,this.newProductModal);
      },
      showSupplierModal(){
        this.$refs['supplier-form-modal'].show();
      },
      onResetSupplier(){},
      onSubmitSupplier(){},
      showWareHouseModal(){
        this.$refs['warehouse-form-modal'].show();
      },
      onResetWareHouse(){},
      onSubmitWareHouse(){},
    },
    mounted() {
      this.getAllData();
    }
  }
</script>

