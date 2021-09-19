<template>
<b-container fluid class="bv-example-row">
  <b-row>
    <b-col cols="4">
      <PosSelectProduct />
      <PosCalculator />
    </b-col>
    <b-col cols="8" class="product-list">
        <PosProductList />
    </b-col>
  </b-row>
</b-container>
</template>
<script>
export default {
    layout:'posui'
}
</script>
<style scoped>
.product-list{
    border-left: 2px solid #000;
    background: #eff3f6;
    height: 95vh;
}
</style>
