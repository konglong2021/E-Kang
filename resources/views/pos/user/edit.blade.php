@extends('layouts.master')
@section('content')
    


<section class="section pt-n">
 <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="panel border-primary no-border border-3-top">
                <div class="panel-heading">
                    <div class="panel-title col-xs-12">
                        <h5>User <small>Create User</small></h5>
                    </div>
                    <div class=" text-right">
                        <div class="text-center">
                            <a href="{{ route('user.index') }}" class="btn btn-primary btn-animated btn-wide">
                                <span class="visible-content">User List</span>
                                <span class="hidden-content"></i>Back</span>
                            </a>
                        
                        </div>
                    </div>
                </div>
                 <div class="panel-body">
                    <div class="col-auto">
                    <form method="POST" action="{{ route('user.update',$user->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group  col-md-6 ">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name"  value="{{$user->name}}">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email"  value="{{$user->email}}">
                            

                            <div class="col-md-6 ">
                                <label><strong>Role :</strong></label>
                                <select class="selectpicker" multiple data-live-search="true" name="roles[]">
                                   
                                    @foreach($roles as $id => $role)

                                     <option value="{{ $id }}" {{ (in_array($id, old('roles', [])) || $user->roles->contains($id)) ? 'selected' : '' }}>{{ $role }}</option>
                                    @endforeach

                                </select>
                            </div>

                            <br/>
                            <div class="col-md-12">  <br/>
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

@push('JsScript')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
    <style type="text/css">
        .dropdown-toggle{
            height: 40px;
            width: 400px !important;
        }
    </style>
@endpush

@push('Script')
        $(document).ready(function() {
            $('select').selectpicker();
        });     
@endpush