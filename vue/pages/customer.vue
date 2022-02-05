<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Customers Overview</h3>
            </div>
            <div class="content-panel-right">
              <b-container class="col-6 mx-auto menu-wrapper">
                <b-row>
                  <b-col>
                    <div class="input-group input-group-sm search-content">
                      <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
                      <input class="form-control input-search-box" type="search" placeholder="Search..."/>
                    </div>
                  </b-col>
                  <div class="btn-wrapper">
                    <b-button href="#"  title="Add new Category" size="sm" variant="primary"
                              @click="showModal()">
                      New Customer
                      <i class="fa fa-plus" aria-hidden="true"></i>
                    </b-button>
                  </div>
                </b-row>
              </b-container>
            </div>
            <div class="panel-bottom"></div>
          </div>
        </div>
        <div class="content-product">
          <div class="content-loading" v-if="isLoading">
            <div class="spinner-grow text-muted"></div>
          </div>
          <div v-if="items && items.length > 0 && !isLoading">
            <b-table
              :items="items"
              :fields="fields"
              stacked="md"
              show-empty
              small>
              <template #cell(actions)="row">
                <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetailCustomer(row.item, row.index, $event.target)" class="mr-1">
                  <i class="fa fa-eye"></i>
                </b-button>
                <b-button size="sm" title="Adjust invetory stock" variant="success" @click="editCuatomer(row.item, row.index, $event.target)">
                  <i class="fa fa-edit"></i>
                </b-button>
              </template>
              <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
            </b-table>
          </div>
        </div>
        <div></div>
      </div>
      <b-modal id="modal-create-customer" ref="create-customer-form-modal" size="lg"
               @hidden="onReset" cancel-title="Cacnel" no-close-on-backdrop
               @ok="onSubmit" ok-title="Save" title="New User">
        <b-form enctype="multipart/form-data">
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-first-name'" class="label-input">Name</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-first-name'" type="text" v-model="customer.name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-user-name'" class="label-input">Phone number</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-user-name'" type="text" v-model="customer.phone" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-user'" class="label-input">Address</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-user'" class="form-control input-content" v-model="customer.address"></b-form-input></b-col>
            </b-row>

            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-member'" class="label-input">Member type</label></b-col>
              <b-col sm="8">
                <b-form-select :id="'input-member'" class="input-content" v-model="customer.member" :options="members"></b-form-select>
              </b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
    </b-row>
  </b-container>
</template>

<script>
  export default {
    middleware: "local-auth",
    layout: 'userui',
    data(){
      return {
        items:[],
        fields: [
          { key: 'name', label: 'Name' },
          { key: 'phone', label: 'Phone number' },
          { key:'address',label:'Address'} ,
          { key:'title',label:'Member type'},
          { key:'discount',label:'Discount'},
          { key: 'actions', label: 'Actions' },
        ],
        customer:{}, //new item for user
        roles: [],
        isLoading: false,
        members : [],
      }
    },
    methods:{
      async getListMembers(){
        let self = this;
        await self.$axios.get('/api/member').then(function (response) {
          if (response && response.hasOwnProperty("data")) {
            if(response.data.length > 0){
              self.members = [];

              for (let index=0; index < response.data.length; index++){
                self.members.push({text: response.data[index]["title"], value: response.data[index]["id"]});
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      },
      async getListCustomer(){
        let self = this;
        self.isLoading = true;

        await self.$axios.get('/api/customer').then(function (response) {
          self.isLoading = false;
          console.log(response);
          if (response && response.hasOwnProperty("data") && response.data.hasOwnProperty("customer")) {
            self.items = [];
            let customer = response.data.customer;
            if(customer.length > 0){
              for (let index=0; index < customer.length; index++){
                let item = {};
                item["id"] = customer[index]["id"];
                item["name"] = customer[index]["name"];
                item["phone"] = customer[index]["phone"];
                item["address"] = customer[index]["address"];
                item["title"] = customer[index]["title"];
                item["discount"] = customer[index]["discount"];
                self.items.push(item);
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      },
      showModal(){
        this.$refs['create-customer-form-modal'].show();
      },
      onReset($event){
        $event.preventDefault();
        this.customer = {};
      },
      async onSubmit(){
        let self = this, dataSubmit = {};
        dataSubmit = self.customer;
        dataSubmit["member_id"] = self.customer.member;
        self.isLoading = true;

        self.$toast.info("submit data in progress").goAway(1000);
        if(self.customer.hasOwnProperty("id") && self.customer.id){
          self.$axios.put('/api/customer/' + self.customer.id, dataSubmit)
            .then(function (response) {
              self.isLoading = false;
              let dataReturn = response.data;
              self.items.forEach((value, index ) => {
                if(value.id === dataReturn.id){
                  value = dataReturn;
                }
              });
              self.customer = {};
            })
            .catch(function (error) {
              self.$toast.success("Data is getting error").goAway(2000);
              console.log(error);
            });
        }
        else {
          await self.$axios.post('/api/customer', dataSubmit).then(function (response) {
            if(response){
              self.isLoading = false;
              self.items.push(response.customer);
              self.customer = {};
            }
          }).catch(function (error) {
            console.log(error);
            self.$toast.error("Submit data getting error").goAway(3000);
          });
        }
      },
      viewDetailCustomer(item, index, target) {
      },
      editCuatomer(item, index, target) {
      },
    },
    mounted() {
      this.getListMembers();
      this.getListCustomer();
    },
  }
</script>
