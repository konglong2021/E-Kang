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
              <b-button class="button-no-background" @click="logOut()">
                <span>Logout</span>
              </b-button>
            </li>
          </ul>
        </div>
        <div class="shopping-cart">
          <ul>
            <li>
              <b-button class="button-no-background btn-card">
              <span>
                <i class="fa fa-shopping-cart font-size-28 color-white"></i>
              </span>
              </b-button>
            </li>
          </ul>
        </div>
    </div>
</template>

<script>
  export default {
    data(){
      return {
        isLoading: false
      }
    },
    methods: {
      async logOut(){
        let response = await this.$axios.post('/api/logout');
        if(response && response.data.hasOwnProperty("message") && response.data.message.toLocaleLowerCase() === "logged out"){
          await this.$router.push('/login');
        }
      },
    },
    mounted() {
      let self = this;
      self.$nextTick(() => {
          self.$nuxt.$loading.start();
          setTimeout(() => self.$nuxt.$loading.finish(), 700)
        });
    },
  }
</script>

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

  .btn-card{
    display: inline-block;
    overflow: hidden;
    position: relative;
    padding-bottom: 17px;
  }
</style>
