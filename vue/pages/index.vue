<template>
  <div class="main-screen" >
    <div v-show="showSelectStoreModal">
      <b-modal
        id="modal-select-store-default"
        ref="select-store-default-modal" size="lg"
        :hide-header="true" :hide-footer="true"
      >
        <div class="content-loading" v-show="loadingField">
          <div class="spinner-grow text-muted"></div>
        </div>
        <div class="full-content" v-show="!loadingField && storeList && storeList.length > 0">
          <ul class="ul-no-style">
            <li class="content-li-menu-store" v-for="store in storeList">
              <b-button variant="dark" class="content-button" @click="selectStore(store)">
                <i class="fa fa-home fa-3x" ></i> <div>
                <span>{{ store.name }}</span>
              </div>
              </b-button>
            </li>
          </ul>
        </div>
      </b-modal>
    </div>
    <div>
      <div class="main-menu">
        <b-container class="col-6 mx-auto menu-wrapper">
          <b-row>
            <b-col>
              <b-button href="/users"  variant="dark">
                <i class="fa fa-user fa-3x" > </i> <div>
                User Management
              </div>
              </b-button>
            </b-col>
            <b-col>
              <b-button href="/pos"  variant="primary" >
                <i class="fa fa-desktop fa-3x" > </i>
                <div>
                  Point of Sale
                </div>
              </b-button>
            </b-col>
            <b-col>
              <b-button href="/inventory"  variant="success">
                <i class="fa fa-bar-chart fa-4x" > </i> <div>
                Inventory Management
              </div>
              </b-button>
            </b-col>
            <b-col>
              <b-button href="/report-daily"  variant="warning">
                <i class="fa fa-area-chart fa-4x" > </i> <div>
                Reporting
              </div>
              </b-button>
            </b-col>
          </b-row>
        </b-container>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  middleware: "local-auth",
  layout: "main",
  data(){
    return {
      showSelectStoreModal: false,
      loadingField: false,
      storeList : [],
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
    selectStore(store){
      let self = this;
      if(!self.$store.$cookies.get('storeItem')){
        self.$store.commit('auth/setStoreItem', store);
        self.$refs['select-store-default-modal'].hide();
      }
    },
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
  },
  mounted() {
    let self = this;
    console.log("Token in index : " + self.$store.$cookies.get("token") );
    self.showSelectStoreModal = !self.$store.$cookies.get("storeItem") ? true : false;
    // if (self.$store.$cookies.get("storeItem") === undefined) {
    //   if(self.$store.$cookies.get("token") !== undefined && self.$store.$cookies.get("token") !== null){
    //     self.getListStores();
    //   }
    //   self.$refs["select-store-default-modal"].show();
    // }
  }
};
</script>

<style  scoped>
  .main-menu {
    padding-top :100px;
  }
  .main-menu .btn {
    padding-top: 10px;
    min-width: 150px;
    min-height: 150px;
    margin:10px 2px;
  }
  .main-menu .btn i {
      margin-top: 5px;
  }
</style>
