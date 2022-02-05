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
              <b-container class="col-8 mx-auto menu-wrapper">
                <b-row>
                  <b-col>
                    <div class="input-group input-group-sm search-content">
             <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
            <input class="form-control input-search-box" type="search" placeholder="Search..."/>
          </div>
                  </b-col>
                  <div class="btn-wrapper">
                    <b-button href="#"  title="Export as Excel" size="sm" variant="primary" @click="showModal()">
                      Excel
                      <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                    </b-button>
                  </div>
                  <div class="btn-wrapper">
                    <b-button href="#"  title="Add new Category" size="sm" variant="primary" @click="showModal()">
                      Print
                      <i class="fa fa-print" aria-hidden="true"></i>
                    </b-button>
                  </div>
<!--                  <div style="display:inline-block; margin-left: 15px;">-->
<!--                    <b-form-input type="date" class="form-control select-content-inline display-inline-block full-with" v-model="dateFilter" @keyup.enter="filterReport()"></b-form-input>-->
<!--                  </div>-->
                </b-row>
              </b-container>
            </div>
            <div class="panel-bottom"></div>
          </div>
        </div>
        <div class="content-product">
          <div class="content-report-input-filter">
            <div class="display-inline-block width-50-percentage float-left">
<!--              <label class="width-20-percentage"> Input date filter</label>-->
              <b-form-input type="date" class="form-control select-content-inline display-inline-block" v-model="dateFilter" @keyup.enter="filterReport()"></b-form-input>
            </div>
          </div>
          <div class="content-table">
            <div class="content-loading" v-if="isLoading">
              <div class="spinner-grow text-muted"></div>
            </div>
            <div v-if="!isLoading">
              <div v-if="items && dateFilter">
                <b-table
                  id="content-table"
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
        </div>
      </div>
    </b-row>
  </b-container>
</template>
<script>
    export default {
        middleware: "local-auth",
        layout:'report',
        data(){
            return {
                items:[],
                fields: [
                    { key: 'name', label: 'Name' },
                    { key: 'date', label: 'Sall Date' },
                    { key: 'qty', label: 'Total Product' },
                    {key:'sale_by',label:'Sale By'}
                ],
                category:{},
                products : [],
                isLoading: false,
                dateFilter: new Date().toISOString().slice(0, 10),
            }
        },
        methods:{
            showModal(){
                this.$refs['brand-form-modal'].show();
            },
            async getProductList(){
                let self = this;
                self.products = [];
                await self.$axios.get('/api/product').then(function (response) {
                    if(response && response.hasOwnProperty("data")){
                        for(let i=0; i < response.data.length; i++){
                            self.products.push(response.data[i]);
                        }
                    }
                }).catch(function (error) {
                    console.log(error);
                    self.$toast.error("getting data error ").goAway(2000);
                });
            },
            async getAllOrderData($dateFilter){
                if($dateFilter){
                    let self = this;
                    self.items = [];
                    self.isLoading = true;
                    await self.$axios.post('/api/sale/search', {dateFilter: $dateFilter}).then(function (response) {
                        self.isLoading = false;
                        if(response && response.hasOwnProperty("data")){
                            self.orders = response.data;
                            for(let index =0; index < self.orders.length; index++){
                                let itemOrder = [];
                                if(self.orders[index].hasOwnProperty("orderdetails")){
                                    let orderdetails = self.orders[index].orderdetails;
                                    if(orderdetails.length > 0){
                                        for (let i=0; i < orderdetails.length; i++){
                                            let productData = self.cloneObject(self.filterProduct(orderdetails[i]));
                                            if(productData !== null && productData !== undefined){
                                                let createdDate = new Date(orderdetails[i].created_at);
                                                let dd = createdDate.getDate();
                                                let mm = createdDate.getMonth() + 1;
                                                let day = (dd < 10) ? ('0' + dd) : dd;
                                                let month = (mm < 10) ? ('0' + mm) : mm;
                                                let yyyy = createdDate.getFullYear();
                                                itemOrder["date"] = (day + "/" + month + "/" + yyyy);
                                                let user = self.cloneObject(self.$store.$cookies.get('user'));
                                                itemOrder["sale_by"] = user["name"];
                                                itemOrder["name"] = productData["en_name"] + " (" + productData["kh_name"] + ")";
                                                itemOrder["qty"] = parseInt(orderdetails[i].quantity);
                                                self.items.push(itemOrder);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }).catch(function (error) {
                        console.log(error);
                        self.$toast.error("getting data error ").goAway(2000);
                    });
                }
       /*else {
         await self.$axios.get('/api/sale').then(function (response) {
           self.isLoading = false;
           if(response && response.hasOwnProperty("data")){
             self.orders = response.data;

             for(let index =0; index < self.orders.length; index++){
               let itemOrder = [];
               if(self.orders[index].hasOwnProperty("orderdetails")){
                 let orderdetails = self.orders[index].orderdetails;

                 if(orderdetails.length > 0){
                   for (let i=0; i < orderdetails.length; i++){
                     let productData = self.cloneObject(self.filterProduct(orderdetails[i]));
                     if(productData !== null && productData !== undefined){

                       let createdDate = new Date(orderdetails[i].created_at);
                       let dd = createdDate.getDate();
                       let mm = createdDate.getMonth() + 1; //January is 0!
                       let day = (dd < 10) ? ('0' + dd) : dd;
                       let month = (mm < 10) ? ('0' + mm) : mm;
                       let yyyy = createdDate.getFullYear();

                       itemOrder["date"] = (day + "/" + month + "/" + yyyy);

                       let user = self.cloneObject(self.$store.$cookies.get('user'));
                       itemOrder["sale_by"] = user["name"];

                       itemOrder["name"] = productData["en_name"] + " (" + productData["kh_name"] + ")";
                       itemOrder["qty"] = parseInt(orderdetails[i].quantity);

                       self.items.push(itemOrder);
                     }
                   }
                 }
               }
             }
           }
         }).catch(function (error) {
           console.log(error);
           self.$toast.error("getting data error ").goAway(2000);
         });
       }*/
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },

      filterProduct(orderdetails){
        if(this.products && this.products.length > 0){
          for(let index=0; index < this.products.length; index++){
            if(orderdetails.product_id === this.products[index].id){
              return this.products[index];
            }
          }
        }
      },
      filterReport(){
        this.getAllOrderData(this.dateFilter);
      },
      showModal(){
        this.$htmlToPaper("content-table");
      }
    },
    mounted() {
      this.getProductList();
      this.getAllOrderData();
    }
  }
</script>
