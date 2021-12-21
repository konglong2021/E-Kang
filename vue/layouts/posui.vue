<template>
<div class="main-pos">
    <PosTopBar/>
  <Nuxt />
</div>
</template>
<script>
  export default {
    mounted() {
      let self = this;
      self.$nextTick(() => {
        self.$nuxt.$loading.start();
        setTimeout(() => self.$nuxt.$loading.finish(), 700)
      });
    }
  }
</script>
<style scoped>
 .main-pos {
   background-color: #dedede;
   height: 100vh;
 }
</style>
