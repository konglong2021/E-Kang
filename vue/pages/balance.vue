<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="display-inline-block full-with">
        <div class="inventory-dashboard-content main-page-content">
          <div class="control-panel">
            <div class="panel-top">
              <div class="content-panel-left">
                <h3 class="head-title">{{ $t('content_title_balance') }}</h3>
              </div>
              <div class="content-panel-right">
                <b-container class="col-6 mx-auto menu-wrapper">
                  <b-row>
                    <b-col>
                      <div class="input-group input-group-sm search-content" style="margin-right: 10px;">
                        <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                        <input class="form-control input-search-box" type="search" placeholder="Search..."/>
                      </div>
                    </b-col>
                    <div class="btn-wrapper" style="margin-right: 10px;">
                      <b-button href="#"  title="Export as Excel" size="sm" variant="primary" @click="showModalIncome()">
                        {{ $t('title_balance_button_income') }}
                        <i class="fa fa-money" aria-hidden="true"></i>
                      </b-button>
                    </div>
                    <div class="btn-wrapper">
                      <b-button href="#"  title="Add new Category" size="sm" variant="primary" @click="showModalWithdraw()">
                        {{ $t('title_balance_button_withdraw') }}
                        <i class="fa fa-money" aria-hidden="true"></i>
                      </b-button>
                    </div>
                  </b-row>
                </b-container>
              </div>
              <div class="panel-bottom"></div>
            </div>
          </div>
          <div class="content-product">
            <div class="content-loading" v-if="loadingFields">
              <div class="spinner-grow text-muted"></div>
            </div>
            <div v-if="!loadingFields">
              <div v-if="items">
                <b-table
                  class="content-table-scroll-ware-house"
                  sticky-header="true"
                  :items="items"
                  :fields="fields"
                  head-variant="light">
                </b-table>
              </div>
            </div>
          </div>
          <div>
          </div>
        </div>
        <b-modal id="modal-add-balance-income" ref="add-balance-income-modal" size="lg"
                 @hidden="onResetBalance" cancel-title="Cancel" no-close-on-backdrop
                 @ok="onSubmitBalance" ok-title="Save" title="Edit balance">
          <b-form enctype="multipart/form-data">
            <div class="full-content">
            </div>
            <div class="full-content">
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-income'" class="label-input">Input more income ($)</label></b-col>
                <b-col sm="8">
                  <b-form-input :id="'input-income'" type="text" v-model="balanceIncome" class="input-content"></b-form-input>
                </b-col>
              </b-row>
            </div>
          </b-form>
        </b-modal>
        <b-modal id="modal-balance-withdraw" ref="balance-withdraw-modal" size="lg"
                 @hidden="onResetBalance" cancel-title="Cancel" no-close-on-backdrop
                 @ok="onSubmitBalance" ok-title="Save" title="Edit balance">
          <b-form enctype="multipart/form-data">
            <div class="full-content">
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-address'" class="label-input">Input withdraw number ($)</label></b-col>
                <b-col sm="8">
                  <b-form-input :id="'input-address'" type="text" v-model="balanceWithdraw" class="input-content"></b-form-input>
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
import moment from "moment";

export default {
  middleware: "local-auth",
  layout:'report',
  data(){
    return {
      items:[],
      fields: [
        { key: 'balance_date', label: this.$t('title_balance_balance_date') },
        { key: 'remain', label: this.$t('title_balance_remain') + ' ($)' },
        { key: 'income', label: this.$t('title_balance_income') + ' ($)' },
        { key: 'withdraw', label: this.$t('title_balance_withdraw') + ' ($)' },
        { key: 'balance', label: this.$t('title_balance_balance') + ' ($)' }
      ],
      balanceIncome: 0,
      balanceWithdraw: 0,
      loadingFields: true,
      perPage: 8,
      currentPage: 1,
      totalRows: 0,
      dataView: {},
      currentBalance : {},
    }
  },
  watch : {
    currentPage: {
      handler: function(value) {
        this.loadingFields = true;
        this.getListData().catch(error => {
          console.error(error)
        });
      }
    }
  },
  methods:{
    async getListData(){
      let vm = this;
      vm.items = [];
      await this.$axios.get('/api/balance').then(function (response) {
        vm.loadingFields = false;
        if(response && response.data.hasOwnProperty("balance")){
          let dataReturn = response.data.balance;
          if(dataReturn instanceof Object){
            let itemData = [];
            itemData["balance_date"] = dataReturn["balance_date"];
            itemData["remain"] = parseFloat(dataReturn["remain"]);
            itemData["income"] = parseFloat(dataReturn["income"]);
            itemData["withdraw"] = parseFloat(dataReturn["withdraw"]);
            itemData["balance"] = parseFloat(dataReturn["balance"]);
            vm.items.push(itemData);
          }
          else if(Array.isArray(dataReturn)){
            let itemList =[];
            for(let k=0; k < dataReturn.length; k++){
              let itemData = [];
              itemData["balance_date"] = dataReturn[k]["balance_date"];
              itemData["remain"] = parseFloat(dataReturn[k]["remain"]);
              itemData["income"] = parseFloat(dataReturn[k]["income"]);
              itemData["withdraw"] = parseFloat(dataReturn[k]["withdraw"]);
              itemData["balance"] = parseFloat(dataReturn[k]["balance"]);
              itemList.push(itemData);
            }
            vm.items = vm.cloneObject(itemList);
          }

          if(vm.items && vm.items.length > 0){
            for (let index=0; index < vm.items.length; index++){
              let currentBalanceDate = moment(vm.items[index].balance_date, "YYYY-MM-DD");
              let currentDate = vm.getFullDate();
              if(moment(currentBalanceDate, "DD/MM/YYYY").format('YYYYMMDD') === moment(currentDate, "DD/MM/YYYY").format('YYYYMMDD')){
                vm.currentBalance = vm.items[index];
                break;
              }
            }
          }
        }
      }).catch(function (error) {
        console.log(error);
        vm.$toast.error("Getting data error").goAway(3000);
      });
    },
    getFullDate(){
      let today = new Date();
      let dd = today.getDate();
      let mm = (today.getMonth() + 1); //January is 0!
      let day = (dd < 10) ? ("0" + dd) : dd;
      let month = (mm < 10) ? ("0" + mm) : mm;
      let yyyy = today.getFullYear();

      return (day + "/" + month + "/" + yyyy);
    },
    showModalIncome(){
      this.$refs['add-balance-income-modal'].show();
    },
    showModalWithdraw(){
      this.$refs['balance-withdraw-modal'].show();
    },
    onResetBalance(){

    },
    async onSubmitBalance(){
      let vm = this;
      if(vm.balanceIncome){
        vm.$toast.info("Data starting submit").goAway(1500);
        await vm.$axios.post('/api/balance/income', {income: vm.balanceIncome}).then(function (response) {
          vm.$toast.success("Submit data successfully").goAway(2000);
          vm.loadingFields = false;
          if(response && response.data.hasOwnProperty("balance")){
            if(response.data.balance){
              if(vm.items && vm.items.length > 0){
                for (let index=0; index < vm.items.length; index++) {
                  if(vm.items[index]["id"] === response.data.balance.id){
                    vm.items[index] = response.data.balance;
                    break;
                  }
                }
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          vm.$toast.error("Getting data error").goAway(3000);
        });
      }
      else if(vm.balanceWithdraw){
        vm.$toast.info("Data starting submit").goAway(1500);
        await vm.$axios.post('/api/balance/withdrawal', {withdrawal: vm.balanceWithdraw}).then(function (response) {
          vm.$toast.success("Submit data successfully").goAway(2000);
          vm.loadingFields = false;
          if(response && response.data.hasOwnProperty("balance")){
            if(response.data.balance){
              if(vm.items && vm.items.length > 0){
                for (let index=0; index < vm.items.length; index++) {
                  if(vm.items[index]["id"] === response.data.balance.id){
                    vm.items[index] = response.data.balance;
                    break;
                  }
                }
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          vm.$toast.error("Getting data error").goAway(3000);
        });
      }
      vm.balance = {};
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
    viewDetail(item, index, target){
      this.categoryView = item;
      this.$refs['brand-form-modal'].show();
    },
    editBalance(item, index, target){
      this.balance = item;
      console.log(this.balance);
      this.showModal();
    },
  },
  mounted() {
    this.loadingFields = true;
    this.getListData();
  }
}
</script>
<style scoped>
.content-table-scroll-ware-house{
  max-height: calc(100vh - 165px);
}
</style>
