<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\product;
use App\Models\categorie;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = product::all();

        return view('pos.product.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       // $categories = categorie::pluck('name', 'id');

        return view('pos.product.create');

        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

     public function upload(Request $request)
     {
         $result = $request->file('file')->store('img');
         return ["result"=>$request];

     }


    public function store(Request $request)
    {
        // product::create($request->validated());
        $request->validate([
            'en_name'     => [
                'string',
                'required',
            ],
            'kh_name'    => [
                'required',
               
            // ],
            // // 'code' => [
            // //     'required',
            // //     'unique:product',
            ]
            // 'image' => ['nullable', 'mimes:jpg,jpeg,png', 'max:1024'],
           
        ]);
        //  dd($request);

        $product = product::create([
           
            'en_name' => $request['en_name'],
            'kh_name' => $request['kh_name'],
            'code' => $request['code'],
            'description' => $request['description'],
            'brand_category_id' => $request['brand_category_id'],
            'image' => $request['image'],
   
        ]);
        
        // $product->categories()->sync($request->input('categories', []));

        return redirect()->route('product.index');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
    }
}
