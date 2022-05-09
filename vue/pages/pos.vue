<template>
  <div>
    <b-container fluid class="bv-example-row main-page-content">
        <div class="display-inline-block pos-select-store" v-if="showSelectStoreModal">
          <default-ware-house @checkingWarehouseData="checkingWarehouseData($event)"></default-ware-house>
        </div>
        <div class="display-inline-block full-with"  v-if="!showSelectStoreModal">
          <div v-show="showModalCashBalance">
            <b-modal
              id="modal-input-cash-balance" ref="input-cash-balance-modal"
              title="ផ្ទៀងផ្ទាត់ទឹកប្រាក់" ok-only no-close-on-backdrop @ok="submitBalance"
            >
                <div class="full-content">
                  <b-row class="my-1" v-show="isCreatedBalance">
                    <b-col sm="4"><label :for="'input-cashBalance'" class="label-input">Create Balance ($)</label></b-col>
                    <b-col sm="8">
                      <b-form-input :id="'input-cashBalance'" type="text" v-model="cashBalance" class="input-content" required @keyup.enter="setCashBalance(cashBalance)"></b-form-input>
                    </b-col>
                  </b-row>
                  <div style="display:inline-block; margin-left: 45px;" v-show="!isCreatedBalance && cashBalanceData.balance">
                    <label class="color-black margin-right-80-px">ទឹកប្រាក់មាន : {{ cashBalanceData.balance + "$"}}</label>
                    <div class="display-inline-block" v-show="checkCurrentDateBalance(cashBalanceData)">
                      <b-form-checkbox
                        id="checkbox-1" v-model="add_balance" name="checkbox-1"
                        value="add_more_balance" unchecked-value="not_add_more_balance"
                      >បន្ថែមទឹកប្រាក់</b-form-checkbox>
                    </div>
                  </div>
                  <div style="display:inline-block; margin-left: 45px;" v-if="add_balance === 'add_more_balance'">
                    <label style="margin-right: 10px;">ចំនួនទឹកប្រាក់បន្ថែម ($)</label>
                    <b-form-input class="display-inline-block input-content width-60-percentage" v-model="balance_income"></b-form-input>
                  </div>
                </div>
            </b-modal>
          </div>
          <div v-show="!showModalCashBalance">
            <b-row>
              <b-col cols="6" class="content-product-select">
                <PosSelectProduct :products="productSelectList" @selectedItem="selectedItem" :warehouseSelectedId ="warehouseSelectedId" @updateListProduct="updateListProduct" :cashBalance="cashBalanceData.balance" />
              </b-col>
              <b-col cols="6" class="product-list">
                <PosProductList @selectProduct="selectProduct($event)" @selectWarehouse="selectWarehouse($event)" :cashBalance="cashBalanceData.balance" />
              </b-col>
            </b-row>
          </div>
        </div>
    </b-container>
  </div>
</template>

<script>
  import moment from 'moment';
export default {
  middleware: "local-auth",
  layout:'posui',
  data(){
    return {
      productSelectList: [],
      productItem: {},
      calculateItem: {},
      productSelectItem: {},
      warehouseSelectedId: null,
      loadingField : false,
      cashBalance: 0,
      showModalCashBalance: false,
      cashBalanceData: {},
      isCreatedBalance: false,
      showSelectStoreModal: false,
      isLoading: false,
      add_balance : null,
      cash_in: 0,
      verify_balance_input : 0,
      balance_income: 0
    }
  },
  methods: {
    checkCurrentDateBalance(cashBalanceData){
      let balance_dateObj = moment(cashBalanceData.balance_date,"YYY-MM-DD");
      let balance_dateConvert = balance_dateObj.format("DD/MM/YYYY");
      let currentDate = this.getFullDate();
      return this.compareDate(currentDate, balance_dateConvert);
    },
    compareDate(dateTimeBegin, dateTimeEnd) {
      let momentBegin = moment(dateTimeBegin,"DD/MM/YYYY");
      let momentEnd = moment(dateTimeEnd,"DD/MM/YYYY");
      if (momentBegin > momentEnd) return true;
      else return false;
    },
    selectProduct($data){
      if($data){
        if(!$data.hasOwnProperty("qty")){
          if(this.productSelectList.length === 0){
            $data["qty"] = 1;
            this.productSelectList.push($data);
          }
          else {
            let foundItem = false;
            for(let i=0; i < this.productSelectList.length; i++){
              if(this.productSelectList[i]["id"] === $data["id"]){
                let itemTemp = JSON.parse(JSON.stringify(this.productSelectList[i]));
                itemTemp["qty"] = parseInt(itemTemp['qty']) + 1;
                this.$set(this.productSelectList, i, itemTemp);
                foundItem = true;
                break;
              }
            }
            if(foundItem === false){
              $data["qty"] = 1;
              this.productSelectList.unshift($data);
            }
          }
        }
        else {
          let foundItem = false;
          for(let i=0; i < this.productSelectList.length; i++){
            if(this.productSelectList[i]["id"] === $data["id"]){
              let itemTemp = JSON.parse(JSON.stringify(this.productSelectList[i]));
              itemTemp["qty"] = Number(itemTemp['qty']) + 1;
              this.$set(this.productSelectList, i, itemTemp);
              foundItem = true;
              break;
            }
          }
          if(foundItem === false){
            $data["qty"] = 1;
            this.productSelectList.unshift($data);
          }
        }
      }
    },
    selectedItem($item){
      this.calculateItem = $item;
    },
    updateListProduct($event){
      this.productSelectList = $event;
    },
    increaseQty($event){
      this.productSelectItem = $event;
      for(let index=0; index < this.productSelectList.length; index++) {
        if (this.productSelectList[index]["id"] === $event["id"]) {
          let itemTemp = JSON.parse(JSON.stringify(this.productSelectList[index]));
          itemTemp["qty"] = Number($event["qty"]);
          this.$set(this.productSelectList, index, itemTemp);
          this.calculateItem = itemTemp;
        }
      }
    },
    selectWarehouse($event){
      this.warehouseSelectedId = $event;
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
    setCashBalance(cashBalance){
      if(cashBalance){
        this.$store.commit('auth/setCashBalance', cashBalance);
      }
    },
    closeModal(e){
      e.preventDefault();
    },
    async submitBalance(){
      let data = {}, self = this;
      if(self.cashBalance !== 0){
        data["remain"] = 0;
        data["income"] = 0;
        data["withdraw"] = 0;
        data["balance"] = parseFloat(self.cashBalance);
        data["warehouse_id"] =  self.$store.$cookies.get('storeItem');
        data["user_id"] =  self.$store.$cookies.get('user').id;

        await self.$axios.post('/api/balance', data).then(function (response) {
          if(response && response.hasOwnProperty("data") && response.data.balance){
            self.$store.commit('auth/setCashBalance', parseFloat(response.data.balance.balance));
            self.cashBalanceData = response.data.balance;
            self.showModalCashBalance = false;
            if(self.$store.$cookies.get('cashBalance')){
              self.$refs['input-cash-balance-modal'].hide();
            }
            self.cashBalance = 0;
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      }
      else if(self.cashBalanceData && self.cashBalanceData.balance){
        data["balance"] = parseFloat(self.cashBalanceData.balance);
        try{
          let responseVerifyBalance = await self.$axios.post('/api/balance/verifybalance', data);
          if(
            responseVerifyBalance && responseVerifyBalance.hasOwnProperty("data")
            && responseVerifyBalance.data.success === true
            && responseVerifyBalance.data.balance
            && self.add_balance === 'add_more_balance'
          ){
            await self.$axios.post('/api/balance/income', {income: self.balance_income}).then(function (response) {
              if(response.data && response.data.balance){
                self.$store.commit('auth/setCashBalance', parseFloat(response.data.balance.balance));
                self.showModalCashBalance = false;
                if(self.$store.$cookies.get('cashBalance')){
                  self.$refs['input-cash-balance-modal'].hide();
                }
              }
            }).catch(function (error) {
              console.log(error);
              self.$toast.error("Submit data getting error").goAway(3000);
            });
          }
          else if(
            responseVerifyBalance && responseVerifyBalance.hasOwnProperty("data")
            && responseVerifyBalance.data.success === true
            && responseVerifyBalance.data.balance
            && self.add_balance !== 'add_more_balance'
          ){
            self.showModalCashBalance = false;
            if(self.$store.$cookies.get('cashBalance')){
              self.$refs['input-cash-balance-modal'].hide();
            }
          }
        }catch(err){
          console.log(err)
        }
      }
    },
    async getBalanceData(){
      let self = this;
      await self.$axios.get('/api/showbalance').then(function (response) {
        if(
          response && response.hasOwnProperty("data")
          && response.data && !response.data.hasOwnProperty("original")
          && response.data.hasOwnProperty("balance")
        ){
          self.cashBalanceData = response.data;
          let balanceDateObj = moment(response.data.balance_date, "YYYY-MM-DD");
          let currentDate = self.getFullDate();
          //let isBalanceDateBeforeCurrentDate = ;
          if(moment(balanceDateObj, "DD/MM/YYYY").format('YYYYMMDD') >= moment(currentDate, "DD/MM/YYYY").format('YYYYMMDD')){
            self.$store.commit('auth/setCashBalance', parseFloat(response.data.balance));
            self.showModalCashBalance = false;
            if(self.$store.$cookies.get('cashBalance')){
              self.$refs['input-cash-balance-modal'].hide();
            }
          }
          else{
            self.showModalCashBalance = !self.$store.$cookies.get('cashBalance') ? true : false;
            if(!self.$store.$cookies.get('cashBalance')){
              self.$refs['input-cash-balance-modal'].show();
            }
          }
        }
        else if(
          response && response.hasOwnProperty("data") && response.data
          && !response.data.hasOwnProperty("balance") && response.data.hasOwnProperty("original")
        ){
          self.isCreatedBalance = !response.data.original.success;
          self.showModalCashBalance = !self.$store.$cookies.get('cashBalance') ? true : false;
          if(!self.$store.$cookies.get('cashBalance')){
            self.$refs['input-cash-balance-modal'].show();
          }
        }
      }).catch(function (error) {
        console.log(error);
        self.$toast.error("Submit data getting error").goAway(3000);
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
    checkingWarehouseData($event){
      let self = this;
      if($event !== undefined && $event !== null){
        self.warehouseSelectedId = $event;
        self.showModalCashBalance = self.$store.$cookies.get('cashBalance') === 0 ? true : false;
        if(!self.$store.$cookies.get('cashBalance')){
          self.$refs['input-cash-balance-modal'].show();
        }
      }
    }
  },
  mounted() {
    let self = this;
    self.showSelectStoreModal = (self.$store.$cookies.get('storeItem') === null || self.$store.$cookies.get('storeItem') === undefined || self.$store.$cookies.get('storeItem') === 'undefined') ? true : false;
    if(self.showSelectStoreModal === false){
      self.getBalanceData();
    }
    // self.showModalCashBalance = self.$store.$cookies.get('cashBalance') === 0 ? true : false;
    // if(!self.$store.$cookies.get('cashBalance')){
    //   self.$refs['input-cash-balance-modal'].show();
    // }
    /*window.addEventListener('keyup', function(ev) {
      if(ev.keyCode === 12){
        for(let i=0; i < self.productSelectList.length; i++){
          if(self.productSelectList[i]["id"] === self.calculateItem["id"]){
            let itemTemp = JSON.parse(JSON.stringify(self.productSelectList[i]));
            itemTemp["qty"] = Number(itemTemp['qty']) + 5;
            self.$set(self.productSelectList, i, itemTemp);
            break;
          }
        }
      }
    });*/
  },
  computed:{
    rows() {
      return this.items.length
    }
  },
}
</script>

<style scoped>
  .product-list{
      border-left: 2px solid #000;
      background: #eff3f6;
    height: calc(100vh - 70px);
  }
  .content-product-select .user-select-none{
    user-select: none !important;
    -ms-user-select: none !important;
    -moz-user-select: none !important;
  }
</style>
