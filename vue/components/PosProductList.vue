<template>
    <div>
        <div class="product-list-header">
                    <div class="pull-left">
                        <icon class="fa fa-home fa-3x"></icon>
                    </div>
                    <div v-for="c in categories" :key="c.id" class="pull-left category-item">
                        {{c.name}}
                    </div>
            <div class="clearboth"></div>

        </div>
        <div class="product-list-body">
                <div  v-for="p in products" :key="p.id"  
                class="pro-item" >
                <div class="pro-img" :style="{ backgroundImage: `url('${p.img}')` }">
                    <div class="pro-price">
                        {{p.price}} {{p.currency}}
                    </div>
                </div>
                <div class="pro-name">
                        {{p.name}}
                    </div>
                <div class="clearboth"></div>
                </div>
            <div class="clearboth"></div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
    return {
      categories : [
          {
              id : 1,
              name : 'Phone'
          },
          {
              id: 2,
              name : 'Computer'
          },
          {
              id: 3,
              name : 'Printer'
          }
      ],
      products : [
          {
              id:1,
              name : 'Prod1',
              price: 10.9,
              currency : 'USD',
              img :'/images/default-prod.png'
          },
          {
              id : 2,
              name : 'Prod2',
              price : 20,
              currency:'Riel',
              img :'/images/default-prod.png'
          },
          {
              id: 3,
              name : 'Prod3',
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
<style scoped>
.category-item {
    padding: 10px;
    text-align: left;
    vertical-align: center;
    cursor: pointer;
    min-width: 100px;

}
.category-item:hover {
    background-color: #000;
    color:#fff;
}
.product-list-header 
{
    border-bottom: 2px solid #000;
    display: inline-block;
    width: 100%;
    z-index: 1000;
}
.pro-item {
    float: left;
    background:#fff;
    padding: 5px;
    border-radius: 10px;
    margin: 2px;
    min-width: 150px;
    cursor: pointer;
}
.pro-img {
    background-repeat: no-repeat;
    padding: 50px;

}
.pro-price{
    color :#fff;
    background-color: #000;
    border-radius: 5px;
    position: absolute;
    margin-top: -53px;
    margin-left: -10px;
}
</style>