<template>
  <div>
    <b-container fluid class="bv-example-row">
      <div>
        <b-modal id="modal-select-store" ref="select-store-modal" size="lg" :hide-header="true" :hide-footer="true">
          <div class="content-loading" v-if="loadingField">
            <div class="spinner-grow text-muted"></div>
          </div>
          <div class="full-content" v-if="!loadingField && storeList.length > 0">
             <ul class="ul-no-style">
               <li class="content-li-menu-store" v-for="store in storeList">
                 <b-button variant="dark" class="content-button">
                   <i class="fa fa-home fa-3x" ></i> <div>
                   <span>{{ store.name }}</span>
                 </div>
                 </b-button>
               </li>
             </ul>
          </div>
        </b-modal>
      </div>
      <div style="display:none;">
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
      storeList : [],
      loadingField : false,
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
    async getListStores(){
      let self = this;
      self.loadingField = true;
      await self.$axios.get('/api/warehouse').then(function (response) {
        self.loadingField = false;
        if(response && response.hasOwnProperty("data") && response.data.hasOwnProperty("data")){
          console.log(response.data.data);
          self.storeList = self.cloneObject(response.data.data);
          // self.$store.commit('auth/setToken', token);
        }
      }).catch(function (error) {
        self.$toast.error("getting data error ").goAway(2000);
      });
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
  },

  mounted() {
    let self = this;
    self.$refs['select-store-modal'].show();
    self.getListStores();
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
