<template>
  <div>
    <b-container fluid class="bv-example-row">
      <div class="display-inline-block pos-select-store" v-if="showSelectStoreModal">
        <default-ware-house></default-ware-house>
      </div>
      <div class="display-inline-block full-with"  v-if="!showSelectStoreModal">
        <div v-show="showModalCashBalance">
          <b-modal id="modal-input-cash-balance" ref="input-cash-balance-modal"
                   size="lg" title="ទឹកប្រាក់នៅសល់" ok-only
                   no-close-on-backdrop
                   @ok="submitBalance"
          >
            <b-form enctype="multipart/form-data">
              <div class="full-content">
                <b-row class="my-1" v-show="isCreatedBalance">
                  <b-col sm="4"><label :for="'input-cashBalance'" class="label-input">Create Balance ($)</label></b-col>
                  <b-col sm="8">
                    <b-form-input :id="'input-cashBalance'" type="text" v-model="cashBalance" class="input-content" required @keyup.enter="setCashBalance(cashBalance)"></b-form-input>
                  </b-col>
                </b-row>
                <b-row class="my-1" v-show="!isCreatedBalance">
                  <b-col sm="12"><label>{{ cashBalanceData.balance }}</label></b-col>
                </b-row>
              </div>
            </b-form>
          </b-modal>
        </div>
        <div v-if="!showModalCashBalance">
          <b-row>
            <b-col cols="6" class="content-product-select">
              <PosSelectProduct :products="productSelectList" @selectedItem="selectedItem" :warehouseSelectedId ="warehouseSelectedId" @updateListProduct="updateListProduct" />
            </b-col>
            <b-col cols="6" class="product-list">
              <PosProductList @selectProduct="selectProduct($event)" @selectWarehouse="selectWarehouse($event)" />
            </b-col>
          </b-row>
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
      loading: false,
    }
  },
  watch:{
    newSelectModal:{
      handler(val){
      },
      deep:true
    }
  },
  methods: {

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
              this.productSelectList.push($data);
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
            this.productSelectList.push($data);
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
      if(this.cashBalance !== 0){
        let data = {}, self = this;
        data["remain"] = 0;
        data["income"] = 0;
        data["withdraw"] = 0;
        data["balance"] = parseFloat(self.cashBalance);
        data["warehouse_id"] =  self.$store.$cookies.get('storeItem');
        data["user_id"] =  self.$store.$cookies.get('user').id;

        await self.$axios.post('/api/balance', data).then(function (response) {
          if(response && response.hasOwnProperty("data") && response.data.balance){
            this.$store.commit('auth/setCashBalance', parseFloat(response.data.balance.balance));
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      }
    },
    async getBalanceData(){
      let self = this;
      await self.$axios.get('/api/showbalance').then(function (response) {
        console.log(response.data);
        if(
          response && response.hasOwnProperty("data")
          && response.data && !response.data.hasOwnProperty("original")
          && response.data.hasOwnProperty("balance")
        ){
          self.$store.commit('auth/setCashBalance', parseFloat(response.data.balance));
          self.cashBalanceData = response.data;
        }
        else if(
          response && response.hasOwnProperty("data") && response.data
          && !response.data.hasOwnProperty("balance") && response.data.hasOwnProperty("original")
        ){
          self.isCreatedBalance = !response.data.original.success;
        }
      }).catch(function (error) {
        console.log(error);
        self.$toast.error("Submit data getting error").goAway(3000);
      });
    },
  },
  mounted() {
    let self = this;
    self.getBalanceData();
    self.showSelectStoreModal = (self.$store.$cookies.get('storeItem') === null || self.$store.$cookies.get('storeItem') === undefined || self.$store.$cookies.get('storeItem') === 'undefined') ? true : false;
    self.showModalCashBalance = self.$store.$cookies.get('cashBalance') === 0 ? true : false;
    if(!self.$store.$cookies.get('cashBalance')){
      self.$refs['input-cash-balance-modal'].show();
    }
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
