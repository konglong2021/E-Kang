<?php

namespace App\Http\Controllers\Api;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\BrandResource;
use Illuminate\Http\Resources\Json\JsonResource;

class BrandsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $brands = Brand::withCount('categories')
        ->withCount('products')
        ->orderBy('id', 'desc')->paginate(10);

        // return response()->json([
        // 'brands' =>   $brands,
        // ]);

        return BrandResource::collection($brands)->response();
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
            $brand = Brand::create([
            'name' => $request['name'],
            'kh_name' => $request['kh_name'],
            'description' => $request['description']
        ]);

        $categories = json_encode($request->categories);

        $brand->categories()->sync(json_decode($categories));



        return response()->json([
            "success" => true,
            "message" => "Brand successfully Created",
            "brand" =>  $brand
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $brand = Brand::with('categories')
        ->with('products')->find($id);
        // $brand =Brand::find($id);
        return response()->json($brand);
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
    public function update(Request $request,Brand $brand)
    {
        $input = $request->all();
        $brand->update($input);
        $categories = json_encode($request->categories);
        $brand->categories()->sync(json_decode($categories));
            return response()->json([

            "message" => "Successfully Updated",
            "brand" =>  $brand
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
        $brand = Brand::find($id);

        $brand->destroy($id);
        return response()->json([

            "message" => "Successfully Deleted",
            "brand" =>  $brand
        ]);
    }
}
