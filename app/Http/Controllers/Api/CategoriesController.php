<?php

namespace App\Http\Controllers\Api;
use App\Models\Category;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::withCount('products')
        ->orderBy('id', 'desc')->paginate(10);
        return response()->json($categories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $categories = Category::create([
            'name' => $request->name,
            'kh_name' => $request->kh_name,
            'description' => $request->description,
        ]);
        $brands = json_encode($request->brands);
        $categories->brands()->sync(json_decode($brands));
        return response()->json([
            "success" => true,
            "message" => "Category successfully Created",
            "product" =>  $categories
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        $category->with('products')->get();
        return response()->json($category);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $input = $request->all();
        $category->update($input);
        $brands = json_encode($request->brands);
        $category->brands()->sync(json_decode($brands));
       
            return response()->json([
           
            "message" => "Successfully Updated",
            "category" =>  $category
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);

        $category->destroy($id);
        return response()->json([
           
            "message" => "Successfully Deleted",
            "category" =>  $category
        ]);
    }
}
