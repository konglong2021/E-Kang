<template>
  <b-navbar toggleable="lg" class="pos-bar">
        <div class="content-menu-icon" style="display: none;">
          <ul class="list-menu">
            <li class="list-menu-item line-height">
              <a class="content-link" href="/"><span><i class="fa fa-th font-size-28"></i></span></a>
            </li>
          </ul>
        </div>
        <div style="display: inline-block; overflow: hidden; float: right; width: 100%;">
          <div class="content-logout" style="float: right;">
            <ul class="ul-style">
              <li class="li-style" style="overflow: hidden;" v-if="routePath !== '/pos'">
                <a class="content-link" href="/pos">
                  <span>{{ $t('title_pos') }}</span>
                </a>
              </li>
              <li class="li-style" style="overflow: hidden;">
                <a class="content-link" href="/transaction">
                  <span>{{ $t('title_transaction') }}</span>
                </a>
              </li>
              <li class="li-style" style="overflow: hidden;">
                <a class="cursor-default no-cursor content-user-profile">
            <span class="content-user-img">
              <img :src="getUrlDisplayImgUser()" alt="" />
            </span>
                  <span>{{ $store.$cookies.get('user').name }}</span>
                </a>
              </li>
              <li class="li-style" style="overflow: hidden;">
                <b-button class="button-no-background" @click="logOut()">
                  <span>Logout</span>
                </b-button>
              </li>
            </ul>
          </div>
          <div class="shopping-cart" style="float: right;">
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
  </b-navbar>
</template>

<script>
  export default {
    data(){
      return {
        isLoading: false,
        routePath: null,
      }
    },
    methods: {
      async logOut(){
        let response = await this.$axios.post('/api/logout');
        if(response && response.data.hasOwnProperty("message") && response.data.message.toLocaleLowerCase() === "logged out"){
          await this.$router.push('/login');
        }
      },
      getUrlDisplayImgUser(){
        return this.$store.$cookies.get('user').image ? this.$store.$cookies.get('user').image : "images/no_icon.png";
      },
    },
    mounted() {
      let self = this;
      self.routePath = self.$route.path;
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
  .content-link{
    color:white;
  }

  .content-link:hover{
    outline: none;
    text-decoration: none;
  }

</style>
