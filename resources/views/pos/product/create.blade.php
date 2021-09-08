@push('style')
    <link rel="stylesheet" href="{{asset('backend/css/custom.css')}}" media="screen" >
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
                        <h5>Products <small>Create Product</small></h5>
                    </div>
                    <div class=" text-right">
                        <div class="text-center">
                            <a href="{{ route('product.index') }}" class="btn btn-primary btn-animated btn-wide">
                                <span class="visible-content">Product List</span>
                                <span class="hidden-content"></i>Back</span>
                            </a>
                        
                        </div>
                    </div>
                </div>
                 <div class="panel-body">
                    <div class="col-auto">
                    <form method="POST" action="{{ route('product.store') }}" enctype="multipart/form-data">
                        @csrf
            
                        <div class="form-group  col-md-6">
                            <label for="en_name">English Name</label>
                            <input type="text" class="form-control" id="en_name" name="en_name"  placeholder="Enter English Name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="kh_name">Khmer Name</label>
                            <input type="text" class="form-control" id="kh_name" name="kh_name" placeholder="Enter Khmer Name">
                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="predefined" class="col-sm-2 col-md-6 control-label">Category Select</label>
                            <div class="col-sm-12">
                                <select class="form-control" name="categorie_id">
                                   
                                    
                                    @foreach($categories as $id => $category)

                                        <option value="{{$id}}"
                                        {{ in_array($id,old('categories',[]))? 'selected' : ''}}>
                                        {{$category}}

                                     @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="input-group col-md-6">
                            <label class="input-group-text" for="image">Upload Image</label>
                            <input type="file" class="form-control" name="image" id="image">
                        </div>

                        <div class="form-group col-md-12">
                            <select class="form-control select2 {{ $errors->has('roles') ? 'is-invalid' : '' }}" name="brands[]" id="brands" multiple required>
                                @foreach($brands as $id => $brand)
                                    <option value="{{ $id }}" {{ in_array($id, old('brands', [])) ? 'selected' : '' }}>{{ $brands }}</option>
                                @endforeach
                            </select>
                        </div>
                       
                        <div class="form-group col-md-12">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                        </div>

                       <div class="text-center"> 
                        <button type="submit" class="btn bg-success btn-wide"><i class="fa fa-check"></i>Save</button>
                        
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
@push('Script')
               
<script src="{{asset('backend/js/soft-ui-dashboard.min.js')}}"></script>
@endpush