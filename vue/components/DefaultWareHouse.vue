<template>
  <div>
    <b-modal
      id="modal-select-store-default"
      ref="select-store-default-modal" size="lg"
      title="Select default Warehouse" :hide-footer="true" no-close-on-backdrop
    >
      <div class="content-loading" v-show="loadingField">
        <div class="spinner-grow text-muted"></div>
      </div>
      <div class="full-content" v-show="!loadingField && storeList && storeList.length === 0">
        <p class="text-center text-danger font-size-22">
          Not has ware house in database!! please input ware house from inventory
          <a href="/ware-house"> Go to create warehouse</a>
        </p>
      </div>
      <div class="display-inline-block" v-show="!loadingField && storeList && storeList.length > 0">
        <ul class="ul-no-style">
          <li class="content-li-menu-store" v-for="store in storeList">
            <b-button variant="dark" class="content-button" style="min-height: 135px;" @click="selectStore(store)">
              <i class="fa fa-home fa-3x" ></i> <div>
              <span>{{ store.name }}</span>
            </div>
            </b-button>
          </li>
        </ul>
      </div>
    </b-modal>
  </div>
</template>
<script>
  export default {
    data(){
      return {
        loadingField: false,
        storeList : [],
      }
    },
    methods: {
      async getListStores(){
        let self = this;
        self.loadingField = true;
        await self.$axios.get('/api/warehouse').then(function (response) {
          self.loadingField = false;
          if(
            response && response.hasOwnProperty("data")
            && response.data
            && response.data.hasOwnProperty("data")
          ){
            self.storeList = response.data.data;
          }
        }).catch(function (error) {
          self.$toast.error("getting data error").goAway(2000);
        });
      },
      async selectStore(store){
        let self = this, dataSubmit = {};
        dataSubmit["warehouse_id"] =  store.id;
        dataSubmit["user_id"] = self.$store.$cookies.get('user').id;

        if(
          self.$store.$cookies.get('storeItem') === null
          ||
          self.$store.$cookies.get('storeItem') === undefined
          ||
          self.$store.$cookies.get('storeItem') === 'undefined'
        ){
          await self.$axios.post('api/user/warehouse', dataSubmit).then(function (response) {
            if(response && response.hasOwnProperty("data")){
              if(response.data.success === false){
              //   window.open(window.location.origin + "/" + $url,"_blank");
              }
              else {
                if(response.data && response.data.profile){
                  self.$store.commit('auth/setStoreItem', response.data.profile.warehouse_id);
                  self.$emit("checkingWarehouseData", response.data.profile.warehouse_id);
                }
              }
            }
            else {
              self.$store.commit('auth/setStoreItem', null);
            }
          }).catch(function (error) {
            self.$store.commit('auth/setStoreItem', null);
            self.$toast.error("getting data error").goAway(2000);
          });
          self.$refs['select-store-default-modal'].hide();
        }
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
    },
    mounted() {
      this.getListStores();
      this.$refs["select-store-default-modal"].show();
    },
  }
</script>
