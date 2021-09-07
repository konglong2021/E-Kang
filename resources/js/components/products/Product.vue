<template>
    <default>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-product-list">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>English</th>
                                        <th>Khmer</th>
                                        <th>Barcode</th>
                                        <th>Image</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr v-for="product in productList">
                                    <td></td>
                                    <td>{{ (product.en_name) }}</td>
                                    <td>{{ (product.kh_name) }}</td>
                                    <td>
                                        <barcode v-bind:value="product.code" font-options="bold" format="CODE128" width="2" height="30" fontSize ="15"></barcode>
                                    </td>
                                    <td>-</td>
                                    <td>
                                        <div style="display: inline-block; overflow: hidden;">
                                            <span style="display: inline-block; overflow: hidden; margin: 0 10px;">
                                                <i class="fa fa-trash-o fa-2x"></i>
                                            </span>
                                            <span style="display: inline-block; overflow: hidden; margin: 0 10px;">
                                                <i class="fa fa-edit fa-2x"></i>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="display: none;" class="col-auto">
                            <div class="form-group  col-md-6">
                                <label for="en_name">English Name</label>
                                <input type="text" class="form-control" id="en_name" name="en_name"  placeholder="Enter English Name" v-model="en_name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="kh_name">Khmer Name</label>
                                <input type="text" class="form-control" id="kh_name" name="kh_name" placeholder="Enter Khmer Name" v-model="kh_name">
                            </div>
                            <div class="form-group col-md-6 ">
                                <label class="control-label">Category Select</label>
                                <select class="form-control" name="categorie_id" v-model="selected_category">
                                    <option v-for="item in items" :value="item.id">{{ (item.name) }}</option>
                                </select>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3" v-model="description"></textarea>
                            </div>
                            <div class="text-center">
                                <button class="btn bg-success btn-wide" @click="savingData()"><i class="fa fa-check"></i>Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </default>
</template>
<script>
    import Vue from "vue"
    import axios from "axios"
    Vue.prototype.$http = axios;
    import VueBarcode from 'vue-barcode';

    import Default from "../layout/Default";
    import {apiUrlConfig} from "../configuration/api-config"

    export default {
        name: 'Product',
        components: {Default, 'barcode': VueBarcode},
        data: () => ({
            productList : [],
            apiUrlConfig: apiUrlConfig,
            items: [{name:'test 1', id:'1'},{name:'test 2', id:'2'}],
            en_name: null,
            kh_name: null,
            selected_category: null,
            description: null,
        }),
        methods: {
            async getProductData(){
                try {
                    const response = await this.$http.get(this.apiUrlConfig.products);
                    if(response.data.length > 0){
                        this.productList = response.data;
                    }
                } catch (error) {
                    console.log(error);
                }
            },
            async savingData(){
                /*try {
                    const response = await this.$http.get(this.apiUrlConfig.products);
                    console.log(response.data);
                    //this.posts = response.data;
                } catch (error) {
                    console.log(error);
                }*/
                const dataSubmit = {en_name : this.en_name, kh_name : this.kh_name, categorie_id : this.selected_category, description: this.description};
                try {
                    const response = await this.$http.post(this.apiUrlConfig.products, dataSubmit);
                    if(response.data.success){
                        console.log(response.data.product);
                    }
                } catch (error) {
                    console.log(error);
                }
            }
        },
        mounted() {
            console.log(this.getProductData());
        }
    }
</script>

<style>
    .table-product-list tbody tr td{
        text-align: center;
    }
    .table-product-list thead tr th{
        text-align: center;
    }
</style>
