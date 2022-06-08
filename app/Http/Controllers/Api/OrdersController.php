<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Stock;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Settings;
use App\Models\Profile;
use App\Models\Customer;
use App\Models\Transaction;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Balance;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use App\Http\Resources\OrderResource;


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
        $orders = Order::with('customers')
                        ->with('warehouse')
                        ->with('user')
                        ->with('orderdetails')
                  ->orderBy('id', 'desc')->get();
        return response()->json($orders);
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



    public function sale(Request $request)
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

        try {
            return DB::transaction(function () use($request) {
            $setting = Settings::find(1);
            $digit = (int)$setting->digit;
            $negative = (int)$setting->negative;

            $prefix = date("ymd");
            $invoice = IdGenerator::generate(['table' => 'orders', 'field'=>'invoice_id','length' => 12, 'prefix' =>'INV'.$prefix]);
            $status = ($request->receive > 0 && $request->receive >= $request->grandtotal  ) ? 1 : 0;   // Test if client paid or not
            $orders = new Order();
            $orders->invoice_id = $invoice;
            $orders->warehouse_id = $request->warehouse_id;
            $orders->customer_id = $request->customer_id;
            $orders->user_id = auth()->user()->id;
            $orders->subtotal = round($request->subtotal,$digit);
            $orders->vat = $request->vat;
            $orders->discount = $request->discount;   //fetch from member value
            $orders->grandtotal = round($request->grandtotal,$digit);
            $orders->receive = round($request->receive,$digit);
            $orders->status = $status;
            $orders->save();
            
            $paid = $this->pay($orders->grandtotal,$orders->receive,$orders->id,"Cash"); //Create Transaction Record
    
            $income = $this->income($orders->grandtotal,$orders->warehouse_id);
            if(!$income){
                throw new \Exception('Please update Today Balance');
            }
            $orders_items= collect($request->input('items',[]))
                            ->map(function($item){
                                return ['quantity' => $item['quantity'],
                                        'product_id'   => $item['product_id'],
                                        'sellprice' => $item['sellprice']
                                        ];
                            });
        //    return response()->json($orders_items);
            $orders->products()->sync($orders_items);

            return response()->json([
                "success" => true,
                "message" => "Successfully Added",
                "order"   =>$orders,
                "items"   =>$orders_items

            ]);
            

            });
        } catch (\Throwable $th) {
            DB::rollback();
            return response()->json([
                "success" => false,
                "message" => "Input Data Error"
            ]);
            //throw $th;
        }
    }


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

         $prefix = date("ymd");
        //  $code = IdGenerator::generate(['table' => 'products', 'field' => 'code','length' => 12, 'prefix' =>$prefix]);
        // $invoice = IdGenerator::generate(['table' => 'orders','field'=>'invoice_id', 'length' => 6, 'prefix' =>date('inv-')]);
        $invoice = IdGenerator::generate(['table' => 'orders', 'field'=>'invoice_id','length' => 12, 'prefix' =>'INV'.$prefix]);
        $status = ($request->receive > 0 && $request->receive >= $request->grandtotal  ) ? 1 : 0;   // Test if client paid or not

        $orders = new Order();
        $orders->invoice_id = $invoice;
        $orders->warehouse_id = $request->warehouse_id;
        $orders->customer_id = $request->customer_id;
        $orders->user_id = auth()->user()->id;
        $orders->subtotal = round($request->subtotal,$digit);
        $orders->vat = $request->vat;
        $orders->discount = $request->discount;   //fetch from member value
        $orders->grandtotal = round($request->grandtotal,$digit);
        $orders->receive = round($request->receive,$digit);
        $orders->status = $status;
        $orders->save();

       
        $paid = $this->pay($orders->receive,$orders->id,"Cash"); //Create Transaction Record
       

        $income = $this->income($orders->grandtotal,$orders->warehouse_id);

        if(!$income){
            throw new \Exception('Please update Today Balance');
        }
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
                "order"   =>$orders,
                "items"   =>$orders_items

            ]);
     });
        } catch (\Exception $th) {
            DB::rollback();
            return response()->json([
                "success" => false,
                "message" => "Insufficient Please Check again1"
            ]);
        }


    }
    public function todaysale()
    {
        $today = date('Y-m-d');
        $sale = Order::wheredate('created_at','=',$today)
                        ->with('orderdetails')
                        ->get();
        return response()->json($sale);
    }

    public function daysale($day)
    {
        $today = date('Y-m-d',strtotime($day));
        $sale = Order::wheredate('created_at','=',$today)
                        ->with('orderdetails')
                        ->get();
        return response()->json($sale);
    }

    public function monthsale($month)
    {
        $sale = Order::whereMonth('created_at','=',$month)
        ->with('orderdetails')
        ->get();
        return response()->json($sale);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function CheckProfileWarehouse($user_id)
    {
       $profile= Profile::where('user_id',$user_id)->get()->last();
       return $profile->warehouse_id;
    }

    public function income($income,$warehouse_id)
    {
      //$warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
      $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
        if(!$balance)
        {
            return false;
        }

        $balance_date = date('Y-m-d');
        if($balance->balance_date >= $balance_date)
        {
            $input['income'] = $income + $balance->income;
            $input['balance']= $balance->remain +  $input['income'] - $balance->withdraw;
            $balance->update($input);
            return  $balance;

        }
            return false;

    }

    public function ReturnBalance($return,$warehouse_id)
    {
      //$warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
      $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
        if(!$balance)
        {
            return false;
        }

        $balance_date = date('Y-m-d');
        if($balance->balance_date >= $balance_date)
        {
            $input['income'] = $balance->income - $return;    
            $input['balance']= $balance->remain +  $input['income'] - $balance->withdraw;
            $balance->update($input);
            return  $balance;

        }
            return false;

    }

    public function pay($recieve,$order_id,$method)
    {
        $payment = Transaction::create([
            //'product_id' => $item['product_id'],
            'order_id'      =>  $order_id,
            'paid'          =>  $recieve,
            'pay_method'    =>  $method, //default
        ]);
        return $payment;
    }

    //show Unpaid Invoice
    public function show($id)
    {
        $order = Order::where('status','=',0)
                        ->where('customer_id','=',$id)
                        ->get();
        $due = $order->sum('grandtotal')- $order->sum('receive');

        return response()->json([
            "success" => true,
            "order" => $order,
            "due" => $due
        ]);
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
        

        try {
        return DB::transaction(function () use ($request,$id){
            //query setting
            
        $setting = Settings::find(1);
        $digit = (int)$setting->digit;
        $negative = (int)$setting->negative;
        $prefix = date("ymd");
        //$invoice = IdGenerator::generate(['table' => 'orders', 'field'=>'invoice_id','length' => 12, 'prefix' =>'INV'.$prefix]);
        $status = ($request->receive > 0 && $request->receive >= $request->grandtotal  ) ? 1 : 0;   // Test if client paid or not
        
        $orders = Order::find($id);
        $PreviuosBalance = $orders->grandtotal;  // Store Old Balance
        $orders->invoice_id = $request->invoice_id;
        $orders->warehouse_id = $request->warehouse_id;
        $orders->customer_id = $request->customer_id;
        $orders->user_id = auth()->user()->id;
        $orders->subtotal = round($request->subtotal,$digit);
        $orders->vat = $request->vat;
        $orders->discount = $request->discount;   //fetch from member value
        $orders->grandtotal = round($request->grandtotal,$digit);
        $orders->receive = round($request->receive,$digit);
        $orders->status = $status;
        $orders->update();
        
            

        //* Roll Back Stock
        $odetail = OrderDetail::where('order_id',$id)->get();
        foreach($odetail as $detail)
        {
            $stock = Stock::where('product_id',$detail->product_id)
            ->where('warehouse_id',$request->warehouse_id)
            ->first();
            $stock->total = $stock->total + $detail->quantity;
                $stock->update();
        }
        //* End Roll Back
        
        //* Balance Roll Back
       $this->ReturnBalance($PreviuosBalance,$orders->warehouse_id);
        //* End Balance RollBack
        
        $income = $this->income($orders->grandtotal,$orders->warehouse_id);  //Update New Balance
        
        if(!$income){
            throw new \Exception('Please update Today Balance');
        }
        
        $orders_items= $request->items; // purchase is the array of purchase details
        $odetail = OrderDetail::where('order_id',$id)->delete();
       
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
                    $stock->update();
            }else {
                throw new \Exception('No item in Stock');
            }
        }
            return response()->json([
                "success" => true,
                "message" => "Successfully Added",
                "order"   =>$orders,
                "items"   =>$orders_items
            ]);
     });
    } catch (\Exception $th) {
        DB::rollback();
        return response()->json([
            "success" => false,
            "message" => "Insufficient Please Check again1"
        ]);
    }
    }


    public function delete($id)
    {
        $setting = Settings::find(1);
        $digit = (int)$setting->digit;
        $negative = (int)$setting->negative;
        $order = Order::find($id);
        $odetail = OrderDetail::where('order_id',$id)->get();
       
        //* Balance Roll Back
       $this->ReturnBalance($order->grandtotal,$order->warehouse_id);
       //* End Balance RollBack
        foreach($odetail as $detail)
        {
            $stock = Stock::where('product_id',$detail->product_id)
            ->where('warehouse_id',$order->warehouse_id)
            ->first();
            $stock->total = $stock->total + $detail->quantity;
            $stock->update();
        }
       
        $pdetail = OrderDetail::where('order_id',$id)->delete();
        

        $order->destroy($id);
        return response()->json([
            "success" => true,
            "message" => "Successfully Deleted",
            "Order" =>  $order
        ]);
      
    }

    public function destroy($id)
    {
        //
    }
}
