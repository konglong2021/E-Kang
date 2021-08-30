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
                                       {{$product->code}}
                                    </td>
                                    <td>
                                       {{$product->image}}
                                    </td>
                                    <td>
                                       
                                        <img src="{{ storage_path("app/img/").$product->image }}" alt="" title=""></a>
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