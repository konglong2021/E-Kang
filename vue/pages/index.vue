<template>
  <div class="main-screen" >
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
              <b-button href="/pos" variant="primary" >
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
import DefaultWareHouse from "../components/DefaultWareHouse";
export default {
  components: {DefaultWareHouse},
  middleware: "local-auth",
  layout: "main",
  data(){
    return {
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
    cloneObject(obj) {
      return JSON.parse(JSON.stringify(obj));
    },
  },
  mounted() {
    let self = this;
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
