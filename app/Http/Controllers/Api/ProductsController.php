<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Categorie;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
//        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $products = Product::with('brands')
            ->with('categories')
            ->orderBy('id', 'desc')->paginate(15);
       return response()->json($products);
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

         $request->validate([
            'en_name'     => [
                'string',
                'required',
            ],
            'kh_name'    => [
                'required',
            ],
            'sale_price'    => [
                'required',
            ],
            // 'image' => ['nullable', 'mimes:jpg,jpeg,png', 'max:10048'],

        ]);
        //  dd($request);


         $prefix = date("ymd");
         $code = IdGenerator::generate(['table' => 'products', 'field' => 'code','length' => 12, 'prefix' =>$prefix]);
        // $code = IdGenerator::generate(['table' => 'products','field'=>'code', 'length' => 12, 'prefix' =>date('P')]);

        if ($image = $request->file('image')) {
            $destination_path = 'public/img';
            // $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            // $product['image'] = "$image_name";
        }
        else{
            $image_name ="no image";
        }


        $product = Product::create([

            'en_name' => $request['en_name'],
            'kh_name' => $request['kh_name'],
            'code' => $code,
            'description' => $request['description'],
            'category_id' => $request['category_id'],
            'sale_price' => $request['sale_price'],
            'image' =>  $image_name,

        ]);

        $product->brands()->sync(json_decode($request->input('brands', [])));
        // return response()->json($product);
        return response()->json([
            "success" => true,
            "message" => "File successfully uploaded",
            "product" =>  $product
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
        $product=Product::with('brands')->find($id);
        return response()->json($product);
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
    public function update(Request $request, Product $product)
    {
        //  return response()->json($id);



        // $request->validate([
        //     'en_name'     => [
        //         'string',
        //         'required',
        //     ],
        //     'kh_name'    => [
        //         'required',
        //     ]
        // ]);
        // return response()->json($product);

        $input = $request->all();
        // return response()->json($input);


        if ($image = $request->file('image')) {
            $destination_path = 'public/img';


            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            $input['image'] = $image_name;
        }else{
            unset($input['image']);
        }

        $product->update($input);
        $product->brands()->sync(json_decode($request->input('brands', [])));

            return response()->json([

            "message" => "Successfully Updated",
            "product" =>  $product
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

        $product = Product::find($id);
        if(\Storage::exists('public/img'.'/'.$product->image)){
            \Storage::delete('public/img'.'/'.$product->image);
            $product->destroy($id);
            return response()->json(["message" => "Successfull Delected"] );
          }else{

            return response()->json(["message" => "File does not exists."]


            );
          }
    }
}
