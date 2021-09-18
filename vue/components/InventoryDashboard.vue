<template>
  <div class="inventory-dashboard-content">
    <div class="control-panel">
      <div class="panel-top">
        <div class="content-panel-left">
          <h6>Inventory Overview</h6>
        </div>
        <div class="content-panel-right">
          <div class="input-group input-group-sm search-content">
             <span class="input-group-addon button-search-box"><i class="fa fa-search"></i></span>
            <input class="form-control input-search-box" type="search" placeholder="Search..."/>
          </div>
        </div>
        <div class="panel-bottom"></div>
      </div>
    </div>
    <div class="content-card">
      <div class="card-item">
        <div class="card-item-header" >
          <div class="card-item-header-title-left">
            <a href="#"><span>Receipts</span></a>
          </div>
          <div class="card-item-header-section">
            <a href="#"><i class="fa fa-ellipsis-v"></i></a>
          </div>
        </div>
        <div class="card-content">
          <div class="row">
            <div class="col-sm-6">
              <button class="btn btn-sm btn-info font-weight-bolder">TO PROGRESS</button>
            </div>
            <div class="col-sm-6">
              <div><a href="#"><span>1</span>Late</a></div>
            </div>
          </div>
        </div>
      </div>
      <div class="card-item">
        <div class="card-item-header" >
          <div class="card-item-header-title-left">
            <a href="#"><span>Delivery Orders</span></a>
          </div>
          <div class="card-item-header-section">
            <a href="#"><i class="fa fa-ellipsis-v"></i></a>
          </div>
        </div>
        <div class="card-content">
          <div class="row">
            <div class="col-sm-6">
              <button class="btn btn-sm btn-info font-weight-bolder">TO PROGRESS</button>
            </div>
            <div class="col-sm-6" style="display: none">
              <div><a href="#"><span>1</span>Late</a></div>
            </div>
          </div>
        </div>
      </div>
      <div class="card-item">
        <div class="card-item-header" >
          <div class="card-item-header-title-left">
            <a href="#"><span>POS Orders</span></a>
          </div>
          <div class="card-item-header-section">
            <a href="#"><i class="fa fa-ellipsis-v"></i></a>
          </div>
        </div>
        <div class="card-content">
          <div class="row">
            <div class="col-sm-6">
              <button class="btn btn-sm btn-info font-weight-bolder">TO PROGRESS</button>
            </div>
            <div class="col-sm-6" style="display: none">
              <div><a href="#"><span>1</span>Late</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {};
    },
    methods: {}
  }
</script>
<style scoped>
  .inventory-dashboard-content{
    display: inline-block;
    width: 100%;
  }
  .control-panel{
    border-bottom: 1px solid #cccccc;
    display: inline-block;
    margin-bottom: 5px;
    padding: 5px 16px;
    width: 100%;
  }
  .content-panel-left{
    display: inline-block;
    width: 50%;
    float: left;
    color: #8f8f8f;
  }
  .content-panel-right{
    display: inline-block;
    width: 50%;
    float: left;
  }
  .panel-top{
    display: inline-block;
    width: 100%;
  }
  .search-content{
    border-bottom: 1px solid #ced4da;
  }
  .button-search-box{
    background-color: #fff;
    border: 1px solid #fff;
    line-height: 1.7;
  }
  .input-search-box{
    border: none;
  }
  .input-search-box:focus, .input-search-box:active{
    box-shadow: none;
  }

  .content-card{
    display: inline-block;
    padding: 5px 16px;
    width: 100%;
  }
  .card-item{
    border: 1px solid #ced4da;
    display: inline-block;
    padding: 8px 16px;
    margin: 5px 10px;
    min-width: 150px;
    width: 300px;
    height: 140px;
  }
  .card-item-header-title-left{
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 0;
    margin-top: 0;
    display: block;
    float: left;
  }
  .card-item-header-title-left a {
    color: #17a2b8;
  }
  .card-item-header-title-left a:hover{
    text-decoration: none;
  }
  .card-item-header-section{
    display: inline-block;
    float: right;
  }
  .card-item-header-section a {
    color: #666666;
  }

  .card-content{
    display: inline-block;
    margin-top: 16px;
    width: 100%;
  }
  .card-content a:hover{
    text-decoration: none;
  }
</style>

