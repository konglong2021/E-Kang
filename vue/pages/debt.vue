<template>
    <div>
        <b-container fluid class="bv-example-row" style="display: none;">
            <div class="main-page-content">
                <div class="control-panel">
                    <div class="panel-top">
                        <div class="content-panel-left" style="width: 20%;">
                            <h3 class="head-title">អំពី ការទូទាត់ទឹកប្រាក់</h3>
                        </div>
                        <div  class="content-panel-right content-panel-right-full-width" style="display: none; vertical-align: text-bottom; width: 80%;">
                            <div class="float-right">
                                <b-form-select  class="form-control input-content input-select-warehouse min-height-43-px" v-model="warehouse" :options="warehouses" @change="selectedWarehouse(warehouse)"></b-form-select>
                            </div>
                            <div class="float-right" style="margin-right: 8px">
                                <div class="content-search" >
                                    <multiselect class="input-content content-multiple-select"
                                                 v-model="customer_select" :options="customerOptions"
                                                 track-by="name" label="name" :show-labels="false"
                                                 :placeholder="$t('label_search_by_customer')"
                                                 @select="selectionChangeCustomer"
                                                 @remove="removeElement"></multiselect>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-product content-order-list">
                    <div class="content-loading" v-if="isLoading">
                        <div class="spinner-grow text-muted"></div>
                    </div>
                    <div v-if="!isLoading">
                        <div v-if="transactions">
                          <b-table style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;" table-class="table-product-detail"
                                   :items="transactions"
                                   :fields="fields"
                                   :per-page="0"
                                   stacked="md"
                                   show-empty
                                   small
                          ></b-table>
                        </div>
                    </div>
                </div>
            </div>
        </b-container>
      <div class="page-section border-bottom-2">
        <div class="row">
          <div class="col-lg-4">
            <div class="card border-1 border-left-3 border-left-accent text-center mb-lg-0">
              <div class="card-body">
                <h4 class="h2 mb-0">&dollar;1,569.00</h4>
                <div v-text="'Earnings this month'" />
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card text-center mb-lg-0">
              <div class="card-body">
                <h4 class="h2 mb-0">&dollar;3,917.80</h4>
                <div v-text="'Account Balance'" />
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card text-center mb-lg-0">
              <div class="card-body">
                <h4 class="h2 mb-0">&dollar;10,211.50</h4>
                <div v-text="'Total Sales'" />
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
</template>
<script>
    export default {
        middleware: "local-auth",
        layout:'posui',
        data(){
            return {
              warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
              warehouse: null,
              isLoading: false,
              items : [],
              fields: [
                {key: 'customer'},
                {key: 'invoice_id'},
                {key: 'paid'},
                {key : 'grandtotal'}
              ],
              customer_select : null,
              customerOptions: [],
              transactions: [],
              transactionList: [],
              customers : []
            }
        },
        methods: {
            async getListAllDebt(){
                let self = this;
                await self.$axios.get('/api/transaction').then(function (response) {
                    if(response.data.hasOwnProperty("data")){
                        self.transactionList = self.cloneObject(response.data.data);
                        let dataResponse = response.data.data;
                        for(let index=0; index < dataResponse.length; index++){
                          let item = dataResponse[index];
                          let dataItem = [];
                          dataItem["customer"] = item["customer"]["name"];
                          dataItem["invoice_id"] = item["order"]["invoice_id"];
                          dataItem["paid"] = item["paid"];
                          dataItem["grandtotal"] = item["order"]["grandtotal"];
                          self.transactions.push(dataItem);
                        }
                    }
                }).catch(function (error) {
                    self.$toast.error("getting data error ").goAway(2000);
                    console.log(error);
                });
            },
            async getCustomerList(){
                let self = this;
                await self.$axios.get('/api/customer').then(function (response) {
                    if(response.hasOwnProperty("data") && response.data.hasOwnProperty("customer")){
                        self.customersList = self.cloneObject(response.data.customer);
                        for(let index=0; index < response.data.customer.length; index++){
                            self.customers.push({text : response.data.customer[index]["name"], value : response.data.customer[index]["id"]});
                            self.customerOptions.push({name: response.data.customer[index]["name"], value: response.data.customer[index]["id"]})
                        }
                    }
                })
                    .catch(function (error) {
                        self.$toast.error("getting data error ").goAway(2000);
                        console.log(error);
                    });
            },
            selectedWarehouse(warehouse){
                this.$emit('selectWarehouse', warehouse);
                if(warehouse){
                    this.getListProduct(warehouse);
                }
            },
            selectionChangeCustomer(){

            },
          removeElement(){},
          cloneObject($obj){
            return JSON.parse(JSON.stringify($obj));
          }
        },
        mounted() {
            this.getCustomerList();
            this.getListAllDebt();
        }
    }
</script>
