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
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>     
                                    <th>Khmer Name</th>
                                    <th>Categories</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                         $count=1;
                                ?>
                                     @foreach ($brands as $brand)
                                <tr>
                                    <th scope="row">{{$count++}}</th>
                                    <td>
                                        <b>{{$brand->name}}</b><br>
                                        <small class="text-muted">{{$brand->description}}</small>
                                    </td>
                                    <td><b>{{$brand->kh_name}}</b></td>

                                    <td>
                                        @foreach ($brand->categories as $key =>$item)
                                        <span class="label label-success label-bordered">{{$item->name}}</span>
                                        @endforeach
                                       

                                    </td>
                                    <td>
                                        
                                       
                                        <a href="{{ route('brand.edit', $brand->id) }}" class="btn btn-success icon-only"><i class="fa fa-pencil"></i></a>
                                            
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
                            
                        </table>
                        <div class="text-center">{{ $brands->links() }}</div> 
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