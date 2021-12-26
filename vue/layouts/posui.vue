<template>
  <div>
    <div class="main-pos" v-if="!isLoading">
      <PosTopBar/>
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

<style scoped>
 .main-pos {
   background-color: #dedede;
   height: 100vh;
 }
</style>
