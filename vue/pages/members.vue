<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-col>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Members Overview</h3>
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
          <div  v-if="items && items.length > 0 && !isLoading">
            <b-table
              :items="items"
              :fields="fields"
              stacked="md"
              show-empty
              small>
              <template #cell(actions)="row">
                <b-button size="sm" variant="primary" title="View Inventory History Detail"  @click="viewDetail(row.item, row.index, $event.target)" class="mr-1">
                  <i class="fa fa-eye"></i>
                </b-button>
                <b-button size="sm" title="Adjust invetory stock" variant="success" @click="updateMember(row.item, row.index, $event.target)">
                  <i class="fa fa-edit"></i>
                </b-button>
              </template>
              <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
            </b-table>
          </div>
        </div>
      </div>
      <b-modal id="modal-member" ref="member-form-modal" size="lg"
               @hidden="onReset" cancel-title="Cancel" no-close-on-backdrop
               @ok="onSubmit" ok-title="Save" title="New User">
        <b-form enctype="multipart/form-data">
          <div class="full-content">
          </div>
          <div class="full-content">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-title'" class="label-input">Member Title</label></b-col>
              <b-col sm="8"><b-form-input :id="'input-title'" type="text" v-model="member.title" class="input-content"></b-form-input></b-col>
            </b-row>

            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-discount'" class="label-input">Discount</label></b-col>
              <b-col sm="8">
                <b-form-select :id="'input-discount'" class="form-control input-content" v-model="member.discount" :options="discountList"></b-form-select>
              </b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
      <b-modal
        id="modal-view-member" ref="view-member-form-modal" size="lg" no-close-on-backdrop
        @hidden="onResetView" title="Member View" title-class="text-center mx-auto" hide-footer
      >
        <b-form enctype="multipart/form-data" v-if="memberView !== null && memberView !== undefined">
          <div class="product-data data">
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-title'" class="label-input label-margin-top">Member Title</label></b-col>
              <b-col sm="4">
                <b-form-input :id="'input-title'" type="text" v-model="memberView.title" class="input-content input-no-background" disabled></b-form-input>
              </b-col>
            </b-row>
            <b-row class="my-1">
              <b-col sm="4"><label :for="'input-khname'" class="label-input label-margin-top">Discount (%)</label></b-col>
              <b-col sm="4">
                <b-form-input :id="'input-khname'" type="text" v-model="memberView.discount" class="input-content input-no-background" disabled></b-form-input>
              </b-col>
            </b-row>
          </div>
        </b-form>
      </b-modal>
    </b-col>
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
           { key: 'title', label: 'Title' },
           { key: 'discount_percentage', label: 'Discount (%)' },
           { key: 'actions', label: 'Actions' },
        ],
        member:{},
        isLoading: false,
        discountList : [
          {text: '0%', value: 0},
          {text: '5%', value: 0.05},
          {text: '10%', value: 0.1},
          {text: '15%', value: 0.15},
          {text: '20%', value: 0.2},
          {text: '25%', value: 0.25},
          {text: '30%', value: 0.30},
          {text: '35%', value: 0.35},
          {text: '40%', value: 0.40},
          {text: '45%', value: 0.45},
          {text: '50%', value: 0.50}
        ],
        memberView : {},
    }
    },

    methods:{
      async getListMembers(){
        let self = this;
        self.isLoading = true;

        await self.$axios.get('/api/member').then(function (response) {
          self.isLoading = false;
          if (response && response.hasOwnProperty("data")) {
            self.items = [];
            let members = response.data;
            if(members.length > 0){
              for (let index=0; index < members.length; index++){
                let item = {};
                item["id"] = members[index]["id"];
                item["title"] = members[index]["title"];
                item["discount"] = parseFloat(members[index]["discount"]);
                item["discount_percentage"] = (parseFloat(members[index]["discount"]) * 100) + "%";
                self.items.push(item);
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("Submit data getting error").goAway(3000);
        });
      },
      onReset($event){
        $event.preventDefault();
        this.member = {};
        this.$refs['member-form-modal'].hide();
      },
      onResetView($event){
        $event.preventDefault();
        this.memberView = {};
        this.$refs['view-member-form-modal'].hide();
      },
      onSubmit(){

      },
      showModal(){
        this.$refs['member-form-modal'].show();
      },
      viewDetail(item, index, target){
        this.memberView = item;
        this.memberView.discount = (item.discount * 100);
        this.$refs['view-member-form-modal'].show();
      },
      updateMember(item, index, target){
        this.member = item;
        this.member.discount = (item.discount / 100);
        this.$refs['member-form-modal'].show();
      },
    },
    mounted() {
      this.getListMembers();
    },
  }
</script>
