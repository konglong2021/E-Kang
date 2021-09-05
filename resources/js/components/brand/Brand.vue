<template>
    <default>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel border-primary no-border border-3-top">
                        <div class="panel-heading">
                            <div class="panel-title col-xs-12">
                                <h5>Brand <small>List All</small></h5>
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
    import Default from "../layout/Default";
    export default {
        name: 'Brand',
        components: {Default}
    }
</script>
