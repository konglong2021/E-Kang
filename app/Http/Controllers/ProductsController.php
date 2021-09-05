<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Categorie;
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
        $products = Product::with('brands')
        ->orderBy('id', 'desc')->get();

        return view('pos.product.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Categorie::pluck('name', 'id');

        return view('pos.product.create',compact('categories'));

        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */


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

        if ($image = $request->file('image')) {
            $destination_path = 'public/img';
            // $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            // $product['image'] = "$image_name";
        }else{
            $image_name ="no image";
        }

        // $destination_path = 'public/img';
        // $image = $request->file('image');
       
        // $image_name = $image->getClientOriginalName();
        // $image_name = time().'.'.$request->image->extension(); 
        // $path = $request->file('image')->storeAs($destination_path,$image_name);

        $product = Product::create([
           
            'en_name' => $request['en_name'],
            'kh_name' => $request['kh_name'],
            'code' => $code,
            'description' => $request['description'],
            'categorie_id' => $request['categorie_id'],
            'image' =>  $image_name,
   
        ]);
        
        // $product->categories()->sync($request->input('categories', []));

        return redirect()->route('product.index')->with('success','You have successfully Created.');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $products)
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
        $categories = Categorie::pluck('name', 'id');

        $product = Product::find($id);
        // dd($products);
        return view('pos.product.edit', compact('product', 'categories'));
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
        $request->validate([
            'en_name'     => [
                'string',
                'required',
            ],
            'kh_name'    => [
                'required',
            ]
        ]);
  
        $input = $request->all();
  
        if ($image = $request->file('image')) {
            $destination_path = 'public/img';
            // $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();

            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            $input['image'] = $image_name;
        }else{
            unset($input['image']);
        }
          
        $product->update($input);
    
        return redirect()->route('product.index')
                        ->with('success','Product updated successfully');
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
            return redirect()->route('product.index')
                    ->with('message','You have successfully Delected');    
          }else{
            $product->destroy($id);
            return redirect()->route('product.index')
                    ->with('message','Can not find image Fail!');                
                
              
            
          }
        
    }
}
