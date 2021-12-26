<template>
  <div>
    <div class="main-inventory" v-if="!isLoading">
      <report-topbar/>
      <Nuxt />
    </div>
    <loading v-if="isLoading"></loading>
  </div>
</template>
<script>
  export default {
    data(){
      return {
        isLoading: true,
      }
    },
    mounted() {
      let self = this;
      setTimeout(function(){
        self.isLoading = false;
      }, 500);
    }
  }
</script>
<style>
  .main-inventory{
    background-color: #eff3f6;
       height: 100vh;
  }
</style>
