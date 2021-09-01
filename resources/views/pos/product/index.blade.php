@push('style')
<link rel="stylesheet" href="{{asset('backend/js/DataTables/datatables.min.css')}}" >
@endpush


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
                        
                    
                                            <!-- /.table-responsive -->

                            <table id="example" class="display table table-striped table-bordered" width="100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>English Name</th>
                                        <th>Khmer Name</th>
                                        <th>Barcode</th>
                                        <th>Image</th>
                                        <th class="ecomm-action-icon">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                                $count=1;
                                        ?>
                                     @foreach ($products as $product)
                                    <tr>
                                        <td>{{$count++}}</td>
                                        <td>{{$product->en_name}}</td>
                                        <td>{{$product->kh_name}}</td>
                                        <td>
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
                                <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>English Name</th>
                                        <th>Khmer Name</th>
                                        <th>Barcode</th>
                                        <th>Image</th>
                                        <th class="ecomm-action-icon">Action</th>
                                    </tr>
                                </tfoot>
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
 <!-- /.row -->
 </div>
 <!-- /.container-fluid --> 
</section>

@endsection

@push('JsScript')
<script src="{{asset('backend/js/prism/prism.js')}}"></script>
<script src="{{asset('backend/js/DataTables/datatables.min.js')}}"></script>
<script src="{{asset('backend/js/counterUp/jquery.counterup.min.js')}}"></script>
@endpush

@push('Script')
                // Counter for dashboard stats
              

                // data table
                $('#example').DataTable();
            
@endpush

