<?php

namespace App\Http\Controllers;

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

        return view('pos.product.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = categorie::pluck('name', 'id');

        return view('pos.product.create',compact('categories'));

        
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
               
         
            ],
            // 'image' => ['nullable', 'mimes:jpg,jpeg,png', 'max:10048'],
           
        ]);
        //  dd($request);

         $prefix = date("ymd"); 
        $code = IdGenerator::generate(['table' => 'products', 'field' => 'code','length' => 12, 'prefix' =>$prefix]);
        // $code = IdGenerator::generate(['table' => 'products','field'=>'code', 'length' => 12, 'prefix' =>date('P')]);

        
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
        
        // $product->categories()->sync($request->input('categories', []));

        return redirect()->route('product.index')->with('success','You have successfully upload image.');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('product.show', compact('products'));
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
            return redirect()->route('product.index')
                    ->with('message','You have successfully Delected');    
          }else{
            
            return redirect()->route('product.index')
                    ->with('message','Can not find image Deleted Fail!');                
                
              
            
          }
        
    }
}
