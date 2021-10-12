<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
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
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $categories = Category::pluck('name', 'id');
        $brands = Brand::pluck('name', 'id');

        return view('pos.product.create',compact('categories','brands'));

        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */


    public function store(Request $request)
    {
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        // product::create($request->validated());
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
        //   dd($request);
        

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

        $input = $request->all();
        $input['code']=$code;
        $input['image']=$image_name;

        // dd($input);
        $product = Product::create($input);


        // $product = Product::create([
           
        //     'en_name' => $request['en_name'],
        //     'kh_name' => $request['kh_name'],
        //     'sale_price' => $request['sale_price'],
        //     'code' => $code,
        //     'description' => $request['description'],
        //     'category_id' => $request['category_id'],
        //     'image' =>  $image_name,
   
        // ]);

        $product->brands()->sync($request->input('brands', []));
        // $category = Category::find([3, 4]);
        // $product->categories()->attach($category);

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
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        return view('pos.product.show', compact('products'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $categories = Category::pluck('name', 'id');
        $brands = Brand::pluck('name', 'id');
        // $categories = Categorie::pluck('name', 'id');

         $product->load('brands');
        // dd($products);
        return view('pos.product.edit', compact('product', 'categories','brands'));
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
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
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
        $product->brands()->sync($request->input('brands', []));
    
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
        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
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
