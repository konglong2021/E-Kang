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

    </b-row>
  </b-container>
</template>
<script>
  export default {
    layout:'inventoryui',
    data(){
      return {
         newProductModal:{
          showModal:false
        },
       items:[
          {
            name:'Iphone XS ',
            category:'Phone ទូរសព្ទ័',
            brand:'iPhone',
            loyalty:'NA'

          }
        ],
         fields: [
          { key: 'name', label: 'Name' },
          { key: 'category', label: 'Category' },
          
          { key: 'brand', label: 'Brand' },
          
          { key: 'loyalty', label: 'Loyalty' },
          { key: 'actions', label: 'Actions' }
        ],
        category:{}, //new item for category
    }
    },
    methods:{
        showModal(){
        //just put v-b-modal.modal-create-product this in button also work but we do this to understand about concept of component

        this.newProductModal.showModal = true;
        alert('Debug me , I am going to popup the modal');
        console.log('modal data' ,this.newProductModal);


      },
    }
  }
</script>
