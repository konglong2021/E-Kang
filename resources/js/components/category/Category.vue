<template>
    <default>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel border-primary no-border border-3-top">
                        <div class="panel-heading">
                            <div class="panel-title col-xs-12">
                                <h5>Categories <small>List All</small></h5>
                            </div>
                            <div class=" text-right">
                                <i class="fa  dropdown-toggle" role="button" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered">
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
                                    <tr>
                                        <td>#</td>
                                        <td>English</td>
                                        <td>Khmer</td>
                                        <td>Barcode</td>
                                        <td>Image</td>
                                        <td>Action</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-auto">
                                <div class="form-group  col-md-6">
                                    <label for="en_name">English Name</label>
                                    <input type="text" class="form-control" id="en_name" name="name"  placeholder="Enter English Name" v-model="en_name">
                                </div>
                                <div class="text-center">
                                    <button class="btn bg-success btn-wide" @click="savingData()"><i class="fa fa-check"></i>Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-md-6 -->
            </div>
            <!-- /.col-md-6 -->
        </div>
    </default>
</template>

<script>
    import Vue from "vue"
    import axios from "axios"
    Vue.prototype.$http = axios;
    import Default from "../layout/Default";
    import {apiUrlConfig} from "../configuration/api-config"

    export default {
        name: 'Category',
        components: {Default},
        data: () => ({
            apiUrlConfig: apiUrlConfig,
            name: null,
        }),
        methods: {
            async savingData () {
                try {
                    const dataSubmit = {name: this.name};
                    const response = await this.$http.post(this.apiUrlConfig.products, dataSubmit);
                    if(response.data.success){
                        console.log(response.data.product);
                    }
                } catch (error) {
                    console.log(error);
                }
            }
        }
    }
</script>
