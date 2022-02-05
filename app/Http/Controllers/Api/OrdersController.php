<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Stock;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Settings;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Balance;


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

        
    

        // try{
        try {
                //code...


        return DB::transaction(function () use ($request){
            //query setting
        $setting = Settings::find(1);
        $digit = (int)$setting->digit;
        $negative = (int)$setting->negative;

        $orders = new Order();
        $orders->warehouse_id = $request->warehouse_id;
        $orders->customer_id = $request->customer_id;
        $orders->user_id = auth()->user()->id;
        $orders->subtotal = round($request->subtotal,$digit);
        $orders->vat = $request->vat;
        $orders->discount = $request->discount;   //fetch from member value
        $orders->grandtotal = round($request->grandtotal,$digit);
        $orders->save();
        
        $this->income($orders->grandtotal);
        
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
            

                // setting negative 1 is allow to update
            if ($stock !== null) {
                $stock->total = $stock->total - $item['quantity'];
                if($stock->total > 0 ||  $negative > 0 ){
                    $stock->update();
                }else{
                    throw new \Exception('Insufficient Please Check again');
                    // DB::rollBack();
                    // return response()->json("Insufficient Please Check again");
                }

            }else {
                throw new \Exception('No item in Stock');
            }
        }
            return response()->json([
                "success" => true,
                "message" => "Successfully Added",

            ]);
     });
    } catch (\Exception $th) {
        DB::rollback();
        return response()->json([
            "success" => false,
            "message" => "Insufficient Please Check again"
        ]);
    }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    public function income($income)
    {
        if(!auth()->user()->warehouse_id){
            return response()->json("No default warehouse found!", 200);
           }

           $balance = Balance::where("warehouse_id",auth()->user()->warehouse_id)->get()->last();
           

           $balance_date = date('Y-m-d');
        if($balance->balance_date >= $balance_date)
        {
            $input['income'] = $income + $balance->income;
            $input['balance']= $balance->remain +  $input['income'] - $balance->income;
            $balance->update($input);
            return  $balance;
           
        }

    }

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
