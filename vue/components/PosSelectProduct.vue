<template>
    <div>
        <div v-for="p in products" :key="p.id"  class="p-item">
            <div style="width:85%" class="pull-left">
                    <div class="p-name">{{p.name}}  </div>
                    <div class="p-qty"> {{p.qty}}  / Unit</div>
                </div>
            <div style="width:15%; text-align:right" class="pull-right p-price" >
                {{p.price}} {{p.currency}}
            </div>
            <div class="clearboth"></div>

        </div>
        <div>
            <div class="total-wrapper pull-right">
                <div class="total">Total : xxx USD </div>
                <div class="total"> Total : xx Riel </div>
                <div class="tax"> Taxes: 100</div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
    return {
      products : [
          {
              id:1,
              name : 'Prod1',
              qty :10,
              price: 10.9,
              currency : 'USD',
              img :'/images/default-prod.png'
          },
          {
              id : 2,
              name : 'Prod2',
              qty :10,
              price : 20,
              currency:'Riel',
              img :'/images/default-prod.png'
          },
          {
              id: 3,
              name : 'Prod3',
              qty :10,
              price : 20,
              currency:'USD',
              img :'/images/default-prod.png'
          }
      ]
    };
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();
      alert(JSON.stringify(this.form));
    }
  }

}
</script>
<style  scoped>
    .p-name {
        font-weight: bold;
        font-size: 20px;
    }
    .p-qty {
        margin-right: 10px;
        color: #555;
    }
    .p-price {
        font-weight: bold;
        font-size: 15px;
    }
    .p-item {
        border-bottom: solid 1px #ccc;
        cursor: pointer;
    }
    .p-item:hover{
        background-color: #ccc;
    }
    .total-wrapper {
        border-top: 2px solid #000;
        margin-top: 10px;
        padding:10px;
    }
    .total {
        font-weight: bold;
        font-size: 30px;
    }
</style>
