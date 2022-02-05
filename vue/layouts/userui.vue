<template>
 <div>
   <div class="main-inventory" v-if="!isLoading">
     <user-topbar/>
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
