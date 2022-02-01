<template>
  <div>
    <b-container fluid class="bv-example-row">
      <div v-show="showModalCashBalance">
        <b-modal id="modal-input-cash-balance" ref="input-cash-balance-modal" size="lg" :hide-header="true" :hide-footer="true">
          <b-form enctype="multipart/form-data">
            <div class="full-content">
              <b-row class="my-1">
                <b-col sm="4"><label :for="'input-cashBalance'" class="label-input">បញ្ចូលចំនួនលុយដែលមាន</label></b-col>
                <b-col sm="8">
                  <b-form-input :id="'input-cashBalance'" type="text" v-model="cashBalance" class="input-content" required @keyup.enter="setCashBalance(cashBalance)"></b-form-input>
                </b-col>
              </b-row>
            </div>
          </b-form>
        </b-modal>
      </div>
      <div v-if="!showModalCashBalance">
        <b-row>
          <b-col cols="6" class="content-product-select">
            <PosSelectProduct :products="productSelectList" @selectedItem="selectedItem" :warehouseSelectedId ="warehouseSelectedId" />
          </b-col>
          <b-col cols="6" class="product-list">
            <PosProductList @selectProduct="selectProduct($event)" @selectWarehouse="selectWarehouse($event)" />
          </b-col>
        </b-row>
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
  },
  mounted() {
    let self = this;
    self.showModalCashBalance = self.$store.$cookies.get('cashBalance') === 0 ? true : false;
    //self.warehouseSelectedId =
    if(!self.$store.$cookies.get('cashBalance')){
      self.$refs['input-cash-balance-modal'].show();
    }
    window.addEventListener('keyup', function(ev) {
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
    });
  }
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
