<template>
    <div class="pos-bar">
      <div class="content-menu-icon">
        <ul class="list-menu">
          <li class="list-menu-item line-height">
            <a href="/"><span><i class="fa fa-th font-size-28"></i></span></a>
          </li>
        </ul>
      </div>
      <div class="content-logout">
        <ul class="ul-style">
          <li class="li-style">
            <a>Logout</a>
          </li>
        </ul>
      </div>
      <div class="shopping-cart">
        <ul>
          <li>
            <a href="/"><span><i class="fa fa-shopping-cart font-size-28 color-white"></i></span></a>
          </li>
        </ul>
      </div>
    </div>
</template>
<style  scoped>
  .pos-bar{
     background-color:#232d3b;
     width: 100%;
     min-height: 50px;
     padding-left: 10px;
     padding-right: 10px;
  }
  .shopping-cart{
    display: inline-block;
    float: right;
    margin-right: 20px;
  }
  .shopping-cart ul{
    list-style: none;
    margin: 0;
    padding: 0;
  }
  .shopping-cart ul li{
    display: inline-block;
    position: relative;
    line-height: 55px;
    cursor: pointer;
    padding: 0 10px;
    height: 50px;
  }
</style>>
