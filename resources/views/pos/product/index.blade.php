@extends('layouts.master')
@section('content')
    


<section class="section pt-n">
 <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="panel border-primary no-border border-3-top">
                <div class="panel-heading">
                    <div class="panel-title col-xs-12">
                        <h5>Products <small>List All</small></h5>
                    </div>

                    <div class=" text-right">
                        <div class="text-center">
                            <a href="{{ route('product.create') }}" class="btn btn-primary btn-animated btn-wide">
                                <span class="visible-content">Add Product</span>
                                <span class="hidden-content"></i>Create</span>
                            </a>
                        
                        </div>

                       
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
                               <?php
                                    $count=1;
                               ?>
                                @foreach ($products as $product)
                                <tr>

                                    <th scope="row">{{$count++}}</th>
                                    <td>
                                        {{$product->en_name}}
                                    </td>
                                    <td>{{$product->kh_name}}</td>
                                    <td>
                                        {{-- <div class="mb-3"> {!! DNS1D::getBarcodeHTML($product->code, 'CODABAR') !!}</div> --}}
                                        <div class="mb-3"> {!! DNS1D::getBarcodeHTML($product->code, 'CODABAR') !!}</div>
                                        <div><small>{{$product->code}} </small>
                                       
                                    </td>
                                    <td>
                                        <img src="{{ asset('storage/img').'/' .$product->image }}" alt="" title="" width="50px" height="50px"></a>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success icon-only"><i class="fa fa-pencil"></i></button>
                                        <button type="button" class="btn btn-warning icon-only"><i class="fa fa-eye"></i></button>
                                        <button type="button" class="btn btn-danger icon-only"><i class="fa fa-trash-o"></i></button>
                                        
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                                            <!-- /.table-responsive -->

                                            <table id="example" class="display table table-striped table-bordered" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Invoice #</th>
                                                        <th>Invoice Date</th>
                                                        <th>Customer</th>
                                                        <th>Email</th>
                                                        <th>Amount</th>
                                                        <th>Location</th>
                                                        <th>Status</th>
                                                        <th class="ecomm-action-icon">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>61</td>
                                                        <td>2011/04/25</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$320,800</td>
                                                        <td>New York</td>
                                                        <td>
                                                            <span class="label label-info label-wide">Pending</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>60</td>
                                                        <td>2011/07/25</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$170,750</td>
                                                        <td>Tokyo</td>
                                                        <td>
                                                            <span class="label label-success label-wide">Paid</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>59</td>
                                                        <td>2016/10/02</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$270,750</td>
                                                        <td>Pune</td>
                                                        <td>
                                                            <span class="label label-danger label-wide">Cancel</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>66</td>
                                                        <td>2016/10/02</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$86,000</td>
                                                        <td>San Francisco</td>
                                                        <td>
                                                            <span class="label label-danger label-wide">Cancel</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>22</td>
                                                        <td>2012/03/29</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$433,060</td>
                                                        <td>San Francisco</td>
                                                        <td>
                                                            <span class="label label-danger label-wide">Cancel</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>33</td>
                                                        <td>2008/11/28</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$162,700</td>
                                                        <td>Tokyo</td>
                                                        <td>
                                                            <span class="label label-success label-wide">Paid</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>39</td>
                                                        <td>2012/12/02</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$372,000</td>
                                                        <td>New York</td>
                                                        <td>
                                                            <span class="label label-success label-wide">Paid</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>120</td>
                                                        <td>2012/08/06</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$137,500</td>
                                                        <td>San Francisco</td>
                                                        <td>
                                                            <span class="label label-info label-wide">Pending</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>158</td>
                                                        <td>2015/08/06</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$537,500</td>
                                                        <td>NY</td>
                                                        <td>
                                                            <span class="label label-info label-wide">Pending</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>168</td>
                                                        <td>2016/08/06</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$337,500</td>
                                                        <td>London</td>
                                                        <td>
                                                            <span class="label label-warning label-wide">On Hold</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>89</td>
                                                        <td>2016/08/09</td>
                                                        <td>Cedric Kelly</td>
                                                        <td>cedric.kelly@gmail.com</td>
                                                        <td>$387,500</td>
                                                        <td>NY</td>
                                                        <td>
                                                            <span class="label label-info label-wide">Pending</span>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-xs btn-labeled">Print<span class="btn-label btn-label-right"><i class="fa fa-print"></i></span></button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Order #</th>
                                                        <th>Purchased On</th>
                                                        <th>Customer</th>
                                                        <th>Email</th>
                                                        <th>Purchased Price</th>
                                                        <th>Location</th>
                                                        <th>Status</th>
                                                        <th class="ecomm-action-icon">Action</th>
                                                    </tr>
                                                </tfoot>
                                            </table>

                 </div>
             </div>
         <!-- /.panel -->
        </div>
         <!-- /.col-md-6 -->     
    </div>
 <!-- /.col-md-6 -->
 </div>
 <!-- /.row -->
 </div>
 <!-- /.container-fluid --> 
</section>

@endsection
@push('Script')
<script src="{{asset('backend/js/prism/prism.js')}}"></script>
<script src="{{asset('backend/js/DataTables/datatables.min.js')}}"></script>
<script src="{{asset('backend/js/waypoint/waypoints.min.js')}}"></script>
<script src="{{asset('backend/js/counterUp/jquery.counterup.min.js')}}"></script>


<script>
    $(function($) {
                // Counter for dashboard stats
                $('.counter').counterUp({
                    delay: 10,
                    time: 1000
                });
                // data table
                $('#example').DataTable();
                $('#example-memo').DataTable();

                $('#example2').DataTable( {
                    "scrollY":        "300px",
                    "scrollCollapse": true,
                    "paging":         false
                } );

                $('#example3').DataTable();
            });
</script>
@endpush
