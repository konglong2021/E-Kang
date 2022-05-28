<template>
    <div>
        <b-container fluid class="bv-example-row">
            <div class="main-page-content">
                <div class="control-panel">
                    <div class="panel-top">
                        <div class="content-panel-left" style="width: 20%;">
                            <h3 class="head-title">អំពី បំណុល</h3>
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
                        </div>
                    </div>
                </div>
            </div>
        </b-container>
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
                customer_select : null,
                customerOptions: [],
                transactions: []
            }
        },
        methods: {
            async getListAllDebt(){
                let self = this;
                await self.$axios.get('/api/transaction/customer/').then(function (response) {
                    console.log(response)
                    if(response.data.hasOwnProperty("data")){
                        self.transactions = response.data.data.transaction;
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
        },
        mounted() {
            this.getCustomerList();
            this.getListAllDebt();
        }
    }
</script>