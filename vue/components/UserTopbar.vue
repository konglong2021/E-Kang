<template>
  <b-navbar toggleable="lg" class="inventory-bar">
    <div class="content-menu-icon">
      <ul class="list-menu">
        <li class="list-menu-item line-height">
          <a href="/"><span><i class="fa fa-th font-size-23"></i></span></a>
        </li>
      </ul>
    </div>
    <div class="content-menu-text">
      <ul class="list-menu-text">
        <li class="menu-text-item">
          <a href="/users">
            <span><i class="fa fa-users" aria-hidden="true"></i> Users</span>
          </a>
        </li>
        <li class="menu-text-item">
          <a href="/roles">
            <span> <i class="fa fa-cogs" aria-hidden="true"></i> Roles</span>
          </a>
        </li>
        <li class="menu-text-item">
          <a href="/members">
            <span> <i class="fa fa-user" aria-hidden="true"></i> Members</span>
          </a>
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
  </b-navbar>
</template>
<style >
  .inventory-bar{
    background-color:#232d3b;
    padding-left: 10px;
    padding-right: 10px;
    display: inline-block;
    width: 100%;
  }

  .content-menu-icon{
    display: inline-block;
    float: left;
  }
  .content-menu-icon .list-menu{
    list-style: none;
    margin: 0;
  }
  .content-menu-icon .list-menu .list-menu-item {
    display: inline-block;
    position: relative;
    line-height: 55px;
    cursor: pointer;
    padding: 0 10px;
    height: 50px;
  }

  .content-menu-icon .list-menu .list-menu-item a {
    display: inline-block;
    position: relative;
    color: #ffffff;
  }
  .content-menu-icon .list-menu .list-menu-item a span{
    display: inline-block;
  }

  .content-menu-text{
    display: inline-block;
    float: left;
  }
  .content-menu-text .list-menu-text{
    list-style: none;
    color: #ffffff;
    margin: 0;
  }
  .content-menu-text .list-menu-text .menu-text-item {
    display: inline-block;
    line-height: 45px;
    cursor: pointer;
    padding: 0 15px;
    height: 50px;
  }
  .content-menu-text .list-menu-text .menu-text-item a {
    color: #FFFFFF !important;
  }
    .content-menu-text .list-menu-text .menu-text-item:hover{
 background-color: #000;
    }
  .content-menu-text .list-menu-text .menu-text-item a:hover{
    text-decoration: none;

  }
  .font-size-23{
    font-size: 23px;
  }
</style>
