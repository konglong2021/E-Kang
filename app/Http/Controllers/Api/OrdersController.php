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
use Carbon\Carbon;


class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (empty($request->all())) {
        $orders = Order::with('orderdetails')
                  ->orderBy('id', 'desc')->get();
        }
        else {
            if( $request->input('month')){
                $orderQuery = Order::query();
                $orderQuery->whereMonth('created_at', $request->input('month'));
                $orderQuery->with('orderdetails');
                $orderQuery->orderBy('id', 'desc');
                $orders = $orderQuery->get();

            }
            else if($request->input('dateFilter')){
                $orderQuery = Order::query();
                $orderQuery->whereDate('created_at',$request->input('dateFilter'));
                $orderQuery->with('orderdetails');
                $orderQuery->orderBy('id', 'desc');
                $orders = $orderQuery->get();
            }

        }
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


        // Exaple of transaction

        // DB::beginTransaction();


        //     DB::insert(...);
        //     DB::insert(...);
        //     DB::insert(...);

        //     DB::commit();
        //     // all good
        // } catch (\Exception $e) {
        //     DB::rollback();
        //     // something went wrong
        // }

        // / MyController.php
        // public function store(Request $request) {
        //     return DB::transaction(function() use ($request) {
        //         $user = User::create([
        //             'username' => $request->post('username')
        //         ]);

        //         // Add some sort of "log" record for the sake of transaction:
        //         $log = Log::create([
        //             'message' => 'User Foobar created'
        //         ]);

        //         // Lets add some custom validation that will prohibit the transaction:
        //         if($user->id > 1) {
        //             throw AnyException('Please rollback this transaction');
        //         }

        //         return response()->json(['message' => 'User saved!']);
        //     });
        // };


        // try{
        try {
                //code...


        return DB::transaction(function () use ($request){
        $orders = new Order();
        $orders->warehouse_id = $request->warehouse_id;
        $orders->customer_id = $request->customer_id;
        $orders->user_id = auth()->user()->id;
        $orders->subtotal = $request->subtotal;
        $orders->vat = $request->vat;
        $orders->discount = $request->discount;   //fetch from member value
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
            ->where('warehouse_id',$request->warehouse_id)                  //check item and warehouse available or not
            ->first();



            if ($stock !== null) {
                $stock->total = $stock->total - $item['quantity'];

                if($stock->total > 0){
                    $stock->update();
                }else{
                    throw new \Exception('Insufficient Please Check again');
                    // DB::rollBack();
                    // return response()->json("Insufficient Please Check again");
                }

            } else {
                // $stock = Stock::create([
                // 'product_id' => $item['product_id'],
                // 'warehouse_id' => $request['warehouse_id'],

                // 'alert' => 0,
                // 'total' => $item['quantity'],
                // ]);

                // DB::rollBack();
                // return response()->json("No item in Stock");
                throw new \Exception('No item in Stock');
            }
        }
        return response()->json([

            "message" => "Successfully Added",

        ]);
        });
    } catch (\Exception $th) {
        DB::rollback();
        // return response()->json($th);
        // throw $th;
        return response()->json("Insufficient Please Check again");
    }





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
