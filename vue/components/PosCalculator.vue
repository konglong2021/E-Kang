<template>
    <div class="cal">
        <table class="tbl-cal col-12">
            <tbody>
            <tr>
                <td width="60%">
                    <i class="fa fa-user"> </i>
                    Customer
                </td>
                <td>
                    1
                </td>
                <td>
                    2
                </td>
                <td>
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
                <td>
                    4
                </td>
                <td>
                    5
                </td>
                <td>
                    6
                </td>
                <td>
                    Disc
                </td>
            </tr>
            <tr>

                <td>
                    7
                </td>
                <td>
                    8
                </td>
                <td>
                    9
                </td>
                <td>
                    Price
                </td>
            </tr>
             <tr>

                <td>
                    +/-
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
