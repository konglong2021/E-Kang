<template>
  <div>
    <b-modal id="modal-select-store" ref="select-store-modal" size="lg" :hide-footer="true" no-close-on-backdrop>
      <div>
        <i class="fa fa-home fa-2x"></i>
      </div>
    </b-modal>
  </div>
</template>

<script>
  export default {
    watch:{
      'value.showModal':{
        //watch value change sent from parent component
        handler(value){
          if(value==true){
            this.$refs['select-store-modal'].show();
            this.getBrands();
            this.getCategories();
          }
        },
        deep:true
      },
    },
  }
</script>
