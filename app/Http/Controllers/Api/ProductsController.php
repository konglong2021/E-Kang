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
    public function index(Request $request)
    {
        if (empty($request->all())) {
            $products = Product::with('brands')
            ->with('categories')
            ->orderBy('id', 'desc')->get();
        }
        else {
          $query = $request->input('search');
          /*$products= Product::where('en_name','like','%'.$query.'%')
                        ->orwhere('kh_name','like','%'.$query.'%')
                        ->orwhere('code','like','%'.$query.'%')
                        ->orderBy('id','desc')->get();*/
            $productQuery = Product::query();
            $productQuery->where('en_name','like','%'.$query.'%');
            $productQuery->orWhere('kh_name','like','%'.$query.'%');
            $productQuery->orWhere('code','like','%'.$query.'%');
            $productQuery->with('brands');
            $productQuery->with('categories');
            $productQuery->orderBy('id', 'desc');
            $products = $productQuery->get();
        }

         //return view('item.index',compact('items'))->with('i',(request()->input('page',1)-1)*10);
//        abort_if(Gate::denies('product_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');


       return response()->json($products);
    }



    function generateBarcodeNumber() {
        $number = mt_rand(100000000000, 999999999999); // better than rand()

        // call the same function if the barcode exists already
        if ($this->barcodeNumberExists($number)) {
           return generateBarcodeNumber();
        }

        // otherwise, it's valid and can be used
        return $number;
     }

     function barcodeNumberExists($number) {
         //$product = Product::where('code',$number)->first();

        // query the database and return a boolean
        return Product::where('code',$number)->exists();
     }


     public function show($id)
    {
        $barcode = $this->generateBarcodeNumber();
        return response()->json($barcode);
    }


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


        //  $prefix = date("ymd");
        //  $code = IdGenerator::generate(['table' => 'products', 'field' => 'code','length' => 12, 'prefix' =>$prefix]);
        // $code = IdGenerator::generate(['table' => 'products','field'=>'code', 'length' => 12, 'prefix' =>date('P')]);

        if ($image = $request->file('image')) {
            $destination_path = 'public/img';
            // $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            // $product['image'] = "$image_name";
        }
        else{
            $image_name ="no image created";
        }




        //Barcode check if not submit barcode will auto generate
        if(!$request['code']){
            $code=$this->generateBarcodeNumber();
        }else{
            if ($this->barcodeNumberExists( $request['code'])) {
                $code = $this->generateBarcodeNumber();
             }else{
                $code =$request['code'];
             }
           
        }


        $product = Product::create([

            'en_name' => $request['en_name'],
            'kh_name' => $request['kh_name'],
            'code' =>$code,
            'description' => $request['description'],
            'category_id' => $request['category_id'],
            'sale_price' => $request['sale_price'],
            'image' =>  $image_name,

        ]);

        $brands = ($request->brands);
        $product->brands()->sync(json_decode($brands));
        // return response()->json($product);
        return response()->json([
            "success" => true,
            "message" => "File successfully uploaded",
            "product" =>  $product
        ]);

    }

    public function update(Request $request, Product $product)
    {


        $input = $request->all();
//         return response()->json($input);


        if ($image = $request->file('image')) {
            $destination_path = 'public/img';


            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            $input['image'] = $image_name;
        }
        else{
            unset($input['image']);
        }

        $product->update($input);
        $brands =($request->brands) ;
        $product->brands()->sync(json_decode($brands));
        $brandsStr = implode(",", json_decode($brands));
            return response()->json([
            "success" => true,
            "message" => "Successfully Updated",
            "product" =>  $product,
            "Brands" => $brandsStr
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
