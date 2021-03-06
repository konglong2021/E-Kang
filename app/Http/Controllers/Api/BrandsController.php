<?php

namespace App\Http\Controllers\Api;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\BrandResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Gate;
use Symfony\Component\HttpFoundation\Response;

class BrandsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        abort_if(Gate::denies('brand_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        if (empty($request->all())) {
            $brands = Brand::with('categories')
                    ->withCount('products')
                    ->orderBy('id', 'desc')->get();
        }
        else {
          $query = $request->input('search');
//          $brands= Brand::where('name','like','%'.$query.'%')
//                        ->orwhere('kh_name','like','%'.$query.'%')
//                        ->orderBy('id','desc')->get();
                        // paginate(8)->appends(request()->query());;
            $brandQuery = Brand::query();
            $brandQuery->where('name','like','%'.$query.'%');
            $brandQuery->orWhere('kh_name','like','%'.$query.'%');
            $brandQuery->with('categories');
            $brandQuery->orderBy('id', 'desc');
            $brands = $brandQuery->get();
        }



        return response()->json([
        'brands' =>   $brands,
        ]);
        // return new BrandResource($brands->paginate(request('per_page')));
        // return BrandResource::collection($brands->paginate(8));
    //    return new BrandResource($brands);
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
         abort_if(Gate::denies('brand_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
            $brand = Brand::create([
            'name' => $request['name'],
            'kh_name' => $request['kh_name'],
            'description' => $request['description']
        ]);

        $categories = ($request->categories);

        $brand->categories()->sync(($categories));



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
        abort_if(Gate::denies('brand_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
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
        abort_if(Gate::denies('brand_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $input = $request->all();
        $brand->update($input);
        $categories = ($request->categories);
        $brand->categories()->sync($categories);
            return response()->json([
            "success" => true,
            "message" => "Successfully Updated",
            "brand" =>  $brand,
            "categories" => $categories
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
        abort_if(Gate::denies('brand_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $brand = Brand::find($id);

        $brand->destroy($id);
        return response()->json([
            "message" => "Successfully Deleted",
            "brand" =>  $brand
        ]);
    }
}
