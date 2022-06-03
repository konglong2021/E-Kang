<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\PurchaseDetail;
use App\Models\Stock;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\PurchasesResource;
use Carbon\Carbon;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class PurchasesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $purchase = Purchase::with('purchasedetails')
                  ->orderBy('id', 'desc')->get();

        return PurchasesResource::collection($purchase)->response();
//       return response()->json($purchase);
    }

    public function today()
    {
        $purchase = Purchase::with('purchasedetails')
                    ->whereDate('created_at',Carbon::today())
                  ->orderBy('id', 'desc')->get();

        return PurchasesResource::collection($purchase)->response();
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
            'subtotal'     => [
                'required',
            ],
            'grandtotal'    => [
                'required',
            ],
            'supplier_id'    => [
                'required',
            ],
            'warehouse_id'    => [
                'required',
            ],
            'purchases'    => [
                'required',
            ],
        ]);

        
        try{

        return DB::transaction(function () use ($request){
        $prefix = date("ymd");
        $invoice = IdGenerator::generate(['table' => 'purchases', 'field'=>'invoice_id','length' => 12, 'prefix' =>'P-'.$prefix]);
        $purchase = new Purchase();
        $purchase->invoice_id = $invoice;
        $purchase->warehouse_id = $request->warehouse_id;
        $purchase->supplier_id = $request->supplier_id;
        $purchase->user_id = auth()->user()->id;
        $purchase->batch = $request->batch;
        $purchase->subtotal = $request->subtotal;
        $purchase->vat = $request->vat;
        $purchase->grandtotal = $request->grandtotal;
        $purchase->save();

        
        $purchase_details= $request->purchases; // purchase is the array of purchase details

        foreach($purchase_details as $item)
        {

            $pdetail = PurchaseDetail::create([

            'purchase_id' => $purchase->id,
            'product_id' => $item['product_id'],
            'unitprice' => $item['unitprice'],
            'quantity' => $item['quantity'],


           ] );

            $stock = Stock::where('product_id',$item['product_id'])
            ->where('warehouse_id',$request->warehouse_id)
            ->first();



            if ($stock !== null) {
                $stock->total = $stock->total + $item['quantity'];
                $stock->update();
            } else {
                $stock = Stock::create([
                'product_id' => $item['product_id'],
                'warehouse_id' => $request['warehouse_id'],

                'alert' => 0,
                'total' => $item['quantity'],
                ]);
            }
        }
       
        return response()->json([
            "message" => "Successfully Created",
            "purchase" => $purchase,
            "items"     =>$purchase_details
            ]);

        });
        //End of transaction
        }catch (\Exception $th) {
            DB::rollback();
            return response()->json([
                "success" => false,
                "message" => "Please Check again1"
            ]);
        }
        



        // $user = User::where('email', request('email'))->first();

        //     if ($user !== null) {
        //         $user->update(['name' => request('name')]);
        //     } else {
        //         $user = User::create([
        //         'email' => request('email'),
        //         'name' => request('name'),
        //         ]);
        //     }

        // $user = User::updateOrCreate(
        //     ['email' =>  request('email')],
        //     ['name' => request('name')]
        // );

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pdetail=Purchase::with('purchasedetails')->find($id);
        return response()->json($pdetail);
    }


    public function ShowLastUnitPrice($product_id)
    {
        $price = PurchaseDetail::where('product_id',$product_id)->get()->last();
        if(!$price){
            return response()->json([
                "success" => true,
                "price" => "New Item"
            ], 200);
        }
        
        return response()->json([
            "success" => true,
            "price" => $price
        ], 200);
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
        $request->validate([
            'subtotal'     => [
                'required',
            ],
            'grandtotal'    => [
                'required',
            ],
            'supplier_id'    => [
                'required',
            ],
            'warehouse_id'    => [
                'required',
            ],
            'purchases'    => [
                'required',
            ],
        ]);

        // try{
            try {
                //code...
           
        DB::transaction(function () use ($request,$id ){
        $purchase = Purchase::find($id);
        $purchase->warehouse_id = $request->warehouse_id;
        $purchase->supplier_id = $request->supplier_id;
        $purchase->user_id = auth()->user()->id;
        $purchase->batch = $request->batch;
        $purchase->subtotal = $request->subtotal;
        $purchase->vat = $request->vat;
        $purchase->grandtotal = $request->grandtotal;
        $purchase->update();

        //stock roll back
        $pdetail = PurchaseDetail::where('purchase_id',$purchase->id)->get();

        foreach($pdetail as $detail)
        {
            $stock = Stock::where('product_id',$detail->product_id)
            ->where('warehouse_id',$request->warehouse_id)
            ->first();
            $stock->total = $stock->total - $detail->quantity;
            if($stock->total >= 0){
                // throw new \Exception($stock);
                $stock->update();
            }else{
                throw new \Exception($stock);
            }
        }
        //end of stock roll back
        $purchase_details= $request->purchases; // purchase is the array of purchase details
        $pdetail = PurchaseDetail::where('purchase_id',$id)->delete();
        

        foreach($purchase_details as $item)
        {
            $pdetail = PurchaseDetail::Create([
                'purchase_id' => $purchase->id,
                'product_id' => $item['product_id'],
                'unitprice' => $item['unitprice'],
                'quantity' => $item['quantity'],
            ] );
            $stock = Stock::where('product_id',$item['product_id'])
            ->where('warehouse_id',$request->warehouse_id)
            ->first();
            if ($stock !== null) {
                $stock->total = $stock->total + $item['quantity'];
                $stock->update();
            } else {
                $stock = Stock::create([
                'product_id' => $item['product_id'],
                'warehouse_id' => $request['warehouse_id'],

                'alert' => 0,
                'total' => $item['quantity'],
                ]);
            }
        }
            });
            return response()->json([
                "success" => true,
                "message" => "Successfully updated",
    
            ]);
         } catch (\Exception $th) {
            DB::rollback();
            // return response()->json($th);
            throw $th;
            // return response()->json("Insufficient Please Check again");
         }
//End of transaction

        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function delete($id)
    {
        $pdetail = PurchaseDetail::where('purchase_id',$id)->get();
        $Purchase = Purchase::find($id);
        foreach($pdetail as $detail)
        {
            $stock = Stock::where('product_id',$detail->product_id)
            ->where('warehouse_id',$Purchase->warehouse_id)
            ->first();
            $stock->total = $stock->total - $detail->quantity;
            if($stock->total >= 0){
                // throw new \Exception($stock);
                $stock->update();
            }else{
                throw new \Exception($stock);
            }
        }
       

        $pdetail = PurchaseDetail::where('purchase_id',$id)->delete();
        

        $Purchase->destroy($id);
        return response()->json([
            "success" => true,
            "message" => "Successfully Deleted",
            "Purchase" =>  $Purchase
        ]);
      
    }


    public function destroy($id)
    {
        
    }



}
