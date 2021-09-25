<template>
  <div class="inventory-dashboard-content main-page-content">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h3 class="head-title">Inventory Overview</h3>
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
                  <b-button href="#"  size="sm" variant="primary" title="Import product from Supplier">
                    Import 
                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                  </b-button>
              </div>
               <b-col>
                  <b-button href="#"  title="Add new Product" size="sm" variant="primary" @click="showModal()">
                    New Product 
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </b-button>
              </b-col>
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
    <add-new-product-modal v-model="newProductModal"/> <!--no need to import it will automatically rendering it -->
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
      viewDetail(item,index,target){
        console.log(item, index, target);
        alert('detail click '+index);
      },
      adjustStock( item,index,target ){
           console.log(item, index, target);
           alert('adjust stock click '+index);
      },
      showModal(){
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component

        this.newProductModal.showModal = true;
        alert('Debug me , I am going to popup the modal');
        console.log('modal data' ,this.newProductModal);


      },
      onSubmit(event) {
        event.preventDefault();
        let formData = new FormData();
        formData.append("en_name", this.product.en_name);
        formData.append("kh_name", this.product.kh_name);
        formData.append("category_id", this.product.category);
        formData.append("brands", this.product.brand);
        formData.append("description", this.product.description);
        formData.append("image", this.product.image);

        this.$axios.post('/api/product', formData)
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            console.log(error);
          });
      },
      onReset(event) {
        event.preventDefault();
        // Reset our form values
        this.product.en_name = '';
        this.product.kh_name = '';
        this.product.category = null;
        this.product.description = '';
        this.product.brand = null;
        this.product.image = null;
        this.product.sale_price= 0;
        this.product.code= null;
      },
    }
  }
</script>

<style scoped>

</style>

