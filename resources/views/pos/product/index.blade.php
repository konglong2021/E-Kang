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
                                        <button type="button" class="btn btn-success btn-xs btn-labeled">Approve<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                        <button type="button" class="btn btn-danger btn-xs btn-labeled">Reject<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                                            <!-- /.table-responsive -->


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