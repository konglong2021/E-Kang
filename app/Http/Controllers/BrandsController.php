<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Brand;

class BrandsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$brands = Brand::orderBy('id', 'desc')->paginate(10);
          //
          $brands = Brand::with('categories')
          
          ->orderBy('id', 'desc')->paginate(10);

        return view('pos.brand.index',compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $categories = Category::pluck('name', 'id');

        return view('pos.brand.create',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
          $brand =Brand::create($request->all());
          $brand->categories()->sync($request->input('categories', []));
          return redirect()->route('brand.index')->with('success','You have successfully Created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $brand)
    {
        //
        return view('pos.brand.show','brand');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Brand $brand)
    {
        $categories = Category::pluck('name', 'id');
       
        // $categories = Categorie::pluck('name', 'id');

         $brand->load('categories');
        return view('pos.brand.edit',compact('brand','categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Brand $brand)
    {
        //
        $brand->update($request->all());
        $brand->categories()->sync($request->input('categories', []));

       

        return redirect()->route('brand.index')
        ->with('success','Brand updated successfully');
            
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $brand = Brand::find($id);
        $brand->destroy($id);
        return redirect()->route('brand.index')
                    ->with('message','Deleted');   
    }
}
