<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Users Overview</h3>
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
                      New User
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
                <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetailUser(row.item, row.index, $event.target)" class="mr-1">
                  <i class="fa fa-eye"></i>
                </b-button>
                <b-button size="sm" title="Adjust invetory stock" variant="success" @click="editUser(row.item, row.index, $event.target)">
                  <i class="fa fa-edit"></i>
                </b-button>
              </template>
              <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
            </b-table>
          </div>
        </div>
        <div></div>
      </div>
      <b-modal id="modal-create-user" ref="create-user-form-modal" size="lg"
               @hidden="onReset" cancel-title="Cacnel" no-close-on-backdrop
               @ok="onSubmit" ok-title="Save" title="New User">
        <b-form enctype="multipart/form-data">
          <div class="full-content">
          </div>
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-first-name'" class="label-input">First Name</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-first-name'" type="text" v-model="user.first_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-last-name'" class="label-input">Last Name</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-last-name'" type="text" v-model="user.last_name" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-user-name'" class="label-input">User Name</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-user-name'" type="text" v-model="user.username" class="input-content"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-user'" class="label-input">Email</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-user'" class="form-control input-content" type="email" v-model="user.email"></b-form-input></b-col>
            </b-row>

            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-description'" class="label-input">Password</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-password'" class="input-content" type="password" v-model="user.password"></b-form-input></b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-role'" class="label-input">Roles</label></b-col>
              <b-col sm="8">
<!--                <multiselect class="input-content"-->
<!--                             v-model="user.role"-->
<!--                             :options="roles" track-by="name" label="name"-->
<!--                             :multiple="true" :show-labels="false" aria-placeholder="Select User roles"-->
<!--                             @select="selectionChange"-->
<!--                             @remove="removeElement"></multiselect>-->
                <b-form-select :id="'input-role'" class="input-content" v-model="user.role" :options="roles" required></b-form-select>
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
    layout:'userui',
    data(){
      return {
        items:[],
        fields: [
           { key: 'username', label: 'Username' },
           { key: 'name', label: 'Name' },
           {key:'state',label:'Status'} ,
           {key:'last_login',label:'Last Login'},
           {key:'roles',label:'Roles'},
          { key: 'actions', label: 'Actions' },
        ],
        user:{}, //new item for user
        roles: [],
        isLoading: false,
    }
    },
    methods:{
      async getAllRoles(){
        let self = this;
        self.roles = [];

        await self.$axios.get('/api/role').then(function (response) {
          if (response && response.hasOwnProperty("data")) {
            if(response.data.length > 0){
              for (let index=0; index < response.data.length; index++){
                self.roles.push({text: response.data[index]["title"], value: response.data[index]["id"]});
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      },
      async getUsers(){
        let self = this;
        self.items = [];
        self.isLoading = true;

        await self.$axios.get('/api/user').then(function (response) {
          self.isLoading = false;
          if (response && response.hasOwnProperty("data")) {
            let data = response.data;
            data.forEach((value, index ) => {
              let item = {};
              item["username"] = value["email"];
              item["name"] = value["name"];
              item["state"] = "Active";
              item["last_login"] = "";
              item["email"] = value["email"];
              item["id"] = value["id"];

              if (value.hasOwnProperty("roles") && value["roles"]["length"] > 0) {
                value.roles.forEach((valueRole, indexRole ) => {
                  item["role"] = valueRole["id"];
                  item["roles"] = valueRole["title"];
                });
              }
              self.items.push(item);
            });
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      },
      async onSubmit(){
        let self = this, dataSubmit = {}, roles = [];
        dataSubmit["name"] = (self.user["first_name"] + " " + self.user["last_name"]);
        dataSubmit["password"] = self.user["password"];
        dataSubmit["email"] = self.user["email"];
        dataSubmit["role"] = self.user["role"];
        self.$toast.info("submit data in progress").goAway(1000);
        if(self.user.hasOwnProperty("id") && self.user.id){
          self.$axios.put('/api/user/' + self.user.id, dataSubmit)
            .then(function (response) {
              let dataReturn = response.data;
              let roles = response.roles;

              self.items.forEach((value, index ) => {
                if(value.id === dataReturn.id){
                  value["username"] = dataReturn["email"];
                  value["name"] = dataReturn["name"];
                  value["state"] = "Active";
                  value["last_login"] = "";
                  value["email"] = dataReturn["email"];
                  value["id"] = dataReturn["id"];
                  if (dataReturn.hasOwnProperty("roles") && dataReturn["roles"]["length"] > 0) {
                    dataReturn.roles.forEach((valueRole, indexRole ) => {
                      value["role"] = valueRole["id"];
                      value["roles"] = valueRole["title"];
                    });
                  }
                }
              });
              self.user = {};
            })
            .catch(function (error) {
              self.$toast.success("Data is getting error").goAway(2000);
              console.log(error);
            });
        }
        else {
          await self.$axios.post('/api/user', dataSubmit).then(function (response) {
            console.log(response);
            if(response){
              self.user = {};
            }
          }).catch(function (error) {
            console.log(error);
            self.$toast.error("Submit data getting error").goAway(3000);
          });
        }
      },
      showModal(){
        this.$refs['create-user-form-modal'].show();
      },
      selectionChange(){
        this.$forceUpdate();
      },
      removeElement(){
        this.$forceUpdate();
      },
      viewDetailUser(item, index, target){

      },
      editUser(item, index, target){
        let userObj = {};
        console.log(item);
        userObj["id"] = item.id;
        userObj["username"] = item.username;
        userObj["email"] = item.email;
        userObj["role"] = item.role;
        this.user = userObj;
        this.showModal();
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
      onReset(event) {
        event.preventDefault();
        this.user = {};
      },
    },
    mounted() {
      this.getAllRoles();
      this.getUsers();
    }
  }
</script>
