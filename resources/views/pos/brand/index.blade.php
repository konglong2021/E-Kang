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
                        <h5>Brands <small>List All</small></h5>
                    </div>

                    <div class=" text-right">
                        <div class="text-center">
                            <a href="{{ route('brand.create') }}" class="btn btn-primary btn-animated btn-wide">
                                <span class="visible-content">Add Brand</span>
                                <span class="hidden-content"></i>Create</span>
                            </a>

                            @if ($message = Session::get('success'))
                            <div class="alert alert-success">
                                <p>{{ $message }}</p>
                            </div>
                        @endif
                        
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
                                        <th>Name</th>                                       
                                        <th>Categories</th>                                       
                                        <th class="ecomm-action-icon">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php
                                                $count=1;
                                    ?>
                                     @foreach ($brands as $brand)
                                    <tr>
                                        <td>{{$count++}}</td>
                                        <td>{{$brand->name}}</td>                                        
                                        <td>
                                            @foreach ($brand->categories as $key =>$item)
                                           <small> <span class="badge bg-info"> {{$item->name}}</span></small>
                                            @endforeach
                                        </td>                  
                                        
                                        <td>
                                            <a href="{{ route('brand.edit', $brand->id) }}" class="btn btn-success icon-only"><i class="fa fa-pencil"></i></a>
                                            <a href="#" class="btn btn-warning icon-only"><i class="fa fa-eye"></i></a>
                                            {{-- <a href="" class="btn btn-danger icon-only"><i class="fa fa-trash-o"></i></a> --}}
                                            <form class="inline-block fa" action="{{ route('brand.destroy', $brand->id) }}" method="POST" onsubmit="return confirm('Are you sure?');">
                                                <input type="hidden" name="_method" value="DELETE">
                                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                {{-- <input type="submit" class="btn btn-danger icon-only" value="Delete"><i class="fa fa-trash-o"></i> --}}
                                                <button type="submit" class="btn btn-danger icon-only"><i class="fa fa-trash-o"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                   
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                      
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

