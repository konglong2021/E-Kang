<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\product;
use App\Models\categorie;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = product::orderBy('id', 'desc')->get();
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
        $prefix = date("ymd"); 
        $code = IdGenerator::generate(['table' => 'products', 'field' => 'code','length' => 12, 'prefix' =>$prefix]);
        
        $destination_path = 'public/img';
        $image = $request->file('image');
        // $image_name = $image->getClientOriginalName();
        $image_name = time().'.'.$request->image->extension(); 
        $path = $request->file('image')->storeAs($destination_path,$image_name);

        $product = product::create([
           
            'en_name' => $request['en_name'],
            'kh_name' => $request['kh_name'],
            'code' => $code,
            'description' => $request['description'],
            'categorie_id' => $request['categorie_id'],
            'image' =>  $image_name,
   
        ]);

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
        return view('users.show', compact('user'));
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = product::find($id);
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
