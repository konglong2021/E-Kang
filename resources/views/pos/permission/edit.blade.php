@extends('layouts.master')
@section('content')
    


<section class="section pt-n">
 <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="panel border-primary no-border border-3-top">
                <div class="panel-heading">
                    <div class="panel-title col-xs-12">
                        <h5>Permissions <small>Create Permission</small></h5>
                    </div>
                    <div class=" text-right">
                        <div class="text-center">
                            <a href="{{ route('permission.index') }}" class="btn btn-primary btn-animated btn-wide">
                                <span class="visible-content">Permission List</span>
                                <span class="hidden-content"></i>Back</span>
                            </a>
                        
                        </div>
                    </div>
                </div>
                 <div class="panel-body">
                    <div class="col-auto">
                    <form method="POST" action="{{ route('permission.update', $permission->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group  col-md-6 ">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" id="title" name="title"  value="{{$permission->title}}">
                            <div class="col-md-6"> 
                                <button type="submit" class="btn bg-success btn-wide"><i class="fa fa-check"></i>Save</button>
                                
                            </div>
                        </div>
                        
                       
                        

                       
                    </form>
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