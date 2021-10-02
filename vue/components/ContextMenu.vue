<template>
  <ul id="right-click-menu" tabindex="-1" v-if="viewMenu">
    <li>Remove Item from list</li>
  </ul>
</template>
<script>
  export default {
    props:{
      'value':{
        type:Object,
        require:true
      },
    },
    data() {
      return {
        viewMenu: false,
      };
    },
    watch:{
      'value.showMenu':{
        handler(value){
          if(value==true){
            this.viewMenu = true;
          }
        }
      }
    },
    methods: {
    }
  }
</script>

<style>
  #right-click-menu{
    background: #FAFAFA;
    border: 1px solid #BDBDBD;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
    display: block;
    list-style: none;
    margin: 0;
    padding: 0;
    position: absolute;
    width: 200px;
    z-index: 999999;
    right: 20%;
    top: 20%;
  }

  #right-click-menu li {
    border-bottom: 1px solid #E0E0E0;
    margin: 0;
    padding: 5px 15px;
  }

  #right-click-menu li:last-child {
    border-bottom: none;
  }

  #right-click-menu li:hover {
    background: #1E88E5;
    color: #FAFAFA;
  }
</style>
