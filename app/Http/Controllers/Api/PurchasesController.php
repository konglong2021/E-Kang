<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\PurchaseDetail;
use App\Models\Stock;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;

class PurchasesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $purchase = Purchase::with('purchasedetails')
                  ->orderBy('id', 'desc')->paginate(10);

       return response()->json($purchase);
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
        $purchase = new Purchase();
        $purchase->warehouse_id = $request->warehouse_id;
        $purchase->supplier_id = $request->supplier_id;
        $purchase->user_id = $request->user_id;
        $purchase->batch = $request->batch;
        $purchase->subtotal = $request->subtotal;
        $purchase->vat = $request->vat;
        $purchase->grandtotal = $request->grandtotal;
        $purchase->save();

        $purchase_details= $request->purchases; // purchase is the array of purchase details
       
        foreach($purchase_details as $item)
        {
            
            $pdetail = PurchaseDetail::create([

            'purchase_id' => $item['purchase_id'],
            'product_id' => $item['product_id'],
            'unitprice' => $item['unitprice'],
            'quantity' => $item['quantity'],
            
            
            
           ] );

            $stock = Stock::where('product_id',$item['product_id'])
            ->where('warehouse_id',$request->warehouse_id)
            ->first();
            
            

            if ($stock !== null) {
                $stock->balance = $stock->balance + $item['quantity'];
                $stock->update();
            } else {
                $stock = Stock::create([
                'product_id' => $item['product_id'],
                'warehouse_id' => $request['warehouse_id'],
                
                'alert' => 0,
                'balance' => $item['quantity'],
                ]);
            }
        }

        return response()->json([

            "message" => "Successfully Created",
            "purchase" =>  $purchase,
            "stock" =>  $stock,
        ]);

        

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
