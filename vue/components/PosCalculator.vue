<template>
    <div class="cal" style="position: relative !important;">
        <table class="tbl-cal col-12">
            <tbody>
            <tr>
                <td width="60%">
                    <i class="fa fa-user"> </i>
                    Customer
                </td>
                <td @click="submitNumberIncrease(1)">
                    1
                </td>
                <td @click="submitNumberIncrease(2)">
                    2
                </td>
                <td @click="submitNumberIncrease(3)">
                    3
                </td>
                <td>
                    Qty
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <i class="fa fa-money"> </i>
                    Payment
                </td>
                <td @click="submitNumberIncrease(4)">
                    4
                </td>
                <td @click="submitNumberIncrease(5)">
                    5
                </td>
                <td @click="submitNumberIncrease(6)">
                    6
                </td>
                <td>
                    Disc
                </td>
            </tr>
            <tr>

                <td @click="submitNumberIncrease(7)">
                    7
                </td>
                <td @click="submitNumberIncrease(8)">
                    8
                </td>
                <td @click="submitNumberIncrease(9)">
                    9
                </td>
                <td>
                    Price
                </td>
            </tr>
             <tr>

                <td @click="increaseQty()">
                    +
                </td>
                <td>
                    0
                </td>
                <td>
                    .
                </td>
                <td>
                    <i class="fa fa-remove"></i>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

</template>

<script>
  export default {
    props: {
      productItem: Object,
    },
    watch: {
      productItem: {
        handler(value){
          console.log(value);
          this.dataSelected = JSON.parse(JSON.stringify(value));
        }
      }
    },
    data(){
      return {
        dataSelected: null,
        numberIncrease: 0,
      }
    },
    methods: {
      submitNumberIncrease($number){
        this.numberIncrease = Number($number);
      },
      increaseQty(){
        let itemTemp = JSON.parse(JSON.stringify(this.dataSelected));
        itemTemp["qty"] = Number(itemTemp['qty']) + Number(this.numberIncrease);
        this.$emit("listenAction", itemTemp);
      },
    },
  }
</script>

<style scoped>
    .cal {
        position: fixed;
        bottom: 0px;
        min-height: 100px;
        border-top: 2px solid #000;
        width: 100%;
        padding: 5px;
    }
    .tbl-cal{
        display: inline-block;
        border-collapse: collapse;
    }
    .tbl-cal tr , .tbl-cal td {
        border-collapse: collapse;
        border:2px solid #b0b0b0;
    }
    .tbl-cal td {
        min-width: 60px;
        height: 60px;
        padding:10px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
    }
    .tbl-cal td:hover {
        background-color: #007bff;
        color: #fff;
    }
</style>
