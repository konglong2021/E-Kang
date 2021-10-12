<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
        <div class="inventory-dashboard-content main-page-content">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h3 class="head-title">Daily Sale Transaction </h3>
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
                   <b-button href="#"  title="Export as Excel" size="sm" variant="primary" 
                   @click="showModal()">
                     Excel 
                 <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                  </b-button>
              </div>
                 <div class="btn-wrapper">
                   <b-button href="#"  title="Add new Category" size="sm" variant="primary" 
                   @click="showModal()">
                    Print
                <i class="fa fa-print" aria-hidden="true"></i>
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
 
    </b-row>
  </b-container>
</template>
<script>
  export default {
    layout:'report',
    data(){
      return {
       items:[
          {
            name:'iPhone',
            date:'2021-01-01',
            qty:10,
            sale_by:'Mr.Test'

          }
        ],
         fields: [
          { key: 'name', label: 'Name' },
          { key: 'date', label: 'Sall Date' },
          
          { key: 'qty', label: 'Total Product' },
          {key:'sale_by',label:'Sale By'}
          
          
        ],
        category:{}, //new item for category
    }
    },
    methods:{
      showModal(){
        this.$refs['brand-form-modal'].show();
      }
    }
  }
</script>
