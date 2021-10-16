<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Stock;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;


class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::with('orderdetails')
                  ->orderBy('id', 'desc')->paginate(10);

       return response()->json($orders);
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
            'customer_id'    => [
                'required',
            ],
            'warehouse_id'    => [
                'required',
            ],
            'items'    => [
                'required',
            ],
        ]);

        // try{

        DB::transaction(function () use ($request){
        $orders = new Order();
        $orders->warehouse_id = $request->warehouse_id;
        $orders->customer_id = $request->customer_id;
        $orders->user_id = auth()->user()->id;
        $orders->subtotal = $request->subtotal;
        $orders->vat = $request->vat;
        $orders->discount = $request->discount;
        $orders->grandtotal = $request->grandtotal;
        $orders->save();

        
        $orders_items= $request->items; // purchase is the array of purchase details
       
        foreach($orders_items as $item)
        {
            
            $pdetail = OrderDetail::create([

            'order_id' => $orders->id,
            'product_id' => $item['product_id'],
            'sellprice' => $item['sellprice'],
            'quantity' => $item['quantity'],
        
            
           ] );

            $stock = Stock::where('product_id',$item['product_id'])
            ->where('warehouse_id',$request->warehouse_id)
            ->first();
            
            

            if ($stock !== null) {
                $stock->total = $stock->total + $item['quantity'];
                $stock->update();
            } else {
                // $stock = Stock::create([
                // 'product_id' => $item['product_id'],
                // 'warehouse_id' => $request['warehouse_id'],
                
                // 'alert' => 0,
                // 'total' => $item['quantity'],
                // ]);
                DB::rollBack();
                return response()->json("No item in Stock");
            }
        }
        

         }); 
//End of transaction

        return response()->json([

            "message" => "Successfully Created",

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
