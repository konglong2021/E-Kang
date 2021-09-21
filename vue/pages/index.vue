<template>
  <div class="main-screen">
      <div>
        <b-button variant="info"><i class="fa fa-backward"></i></b-button>
        <div class="main-menu">
          <b-container class="col-6 mx-auto">
            <b-row>
              <b-col>
                <b-button href="#"  variant="dark">
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
                <b-button href="#"  variant="warning">
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
  layout: "main"
};
</script>
<style  scoped>
  .main-menu {
    padding-top :100px;
  }
  .main-menu .btn {
    min-width: 200px;
    min-height: 150px;
  }
</style>
