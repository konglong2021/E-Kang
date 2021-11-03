<template>
  <b-container fluid class="bv-example-row main-page-content">
    <b-row>
      <div class="inventory-dashboard-content main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">Roles Overview</h3>
            </div>
            <div class="content-panel-right">
              <b-container class="col-6 mx-auto menu-wrapper">
                <b-row>
                  <b-col>
                    <div class="input-group input-group-sm search-content">
                      <span class="input-group-addon button-search-box"
                        ><i class="fa fa-search"></i
                      ></span>
                      <input
                        class="form-control input-search-box"
                        type="search"
                        placeholder="Search..."
                      />
                    </div>
                  </b-col>
                </b-row>
              </b-container>
            </div>
            <div class="panel-bottom"></div>
          </div>
        </div>
        <div class="content-product">
          <b-table
            :items="items"
            :fields="fields"
            stacked="md"
            show-empty
            small
          >
            <template #cell(actions)="row">
              <b-button
                size="sm"
                variant="primary"
                title="View Inventory History Detail"
                @click="viewDetail(row.item, row.index, $event.target)"
                class="mr-1"
              >
                <i class="fa fa-eye"></i>
              </b-button>
            </template>
            <!-- check this url : https://bootstrap-vue.org/docs/components/table#tables -->
          </b-table>
        </div>
        <div></div>
      </div>
    </b-row>
  </b-container>
</template>
<script>
export default {
  middleware: "local-auth",
  layout: "userui",
  data() {
    return {
      items: [
        {
          name: "Admin",
          description: "Allow to login and do some actions "
        }
      ],
      fields: [
        { key: "name", label: "Name" },

        { key: "description", label: "Description" },
        { key: "actions", label: "Actions" }
      ],
      category: {} //new item for category
    };
  },
  methods: {
    showModal() {
      //this.$refs['brand-form-modal'].show();
    }
  }
};
</script>
