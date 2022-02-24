<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Stock;
use App\Models\StockOut;
use App\Models\Warehouse;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Purchase;
use App\Models\PurchaseDetail;
use App\Http\Resources\BrandResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $stocks = Stock::with('product')
        //         ->with('warehouse')
        //         ->get();

        if (empty($request->all())) {
            $stocks = Stock::with('product')
                    ->with('warehouse')
                    ->get();
        }
        else
        {
            $input = $request->input('search');
            $stocks= Stock::
            WhereHas('product', function($q) use ($input) {
                return $q->where('en_name', 'LIKE', '%' . $input . '%')
                         ->orwhere('kh_name', 'LIKE', '%' . $input . '%')
                         ->orwhere('code', 'LIKE', '%' . $input . '%');
            })
            ->orWhereHas('warehouse', function($q) use ($input) {
                return $q->where('name', 'LIKE', '%'. $input . '%');
            })->with('product')
            ->with('warehouse')->get();
        }        

        return response()->json($stocks);
        // return StockResource::collection($stocks)->response();
    }

    public function stocksell()
    {
        $stocks = Stock::with('product')
                ->with('warehouse')
                ->where('total','>','0')
                ->get();

        return response()->json($stocks);
    }


    //check stock by warehouse
    public function stockbywarehouse($warehouse)
    {
        $stocks = Stock::with('product')
                ->with('warehouse')
                //->where('total','>','0')
                ->where('warehouse_id',$warehouse)
                ->get();

        return response()->json($stocks);
    }


    public function stockbyproduct($product)
    {
        $stocks = Stock::with('product')
                ->with('warehouse')
                //->where('total','>','0')
                ->where('product_id',$product)
                ->get();

        return response()->json($stocks);
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
            'items'    => [
                'required',
            ],
            'to_warehouse' => [
                'required'
            ],
        ]);

        // try{
        if(Warehouse::find($request->to_warehouse)!==null){

            // DB::transaction(function () use ($request){

                $items= $request->items; // purchase is the array of purchase details

                foreach($items as $item)
                {

                    $stock = Stock::where('product_id',$item['product_id'])
                    ->where('warehouse_id',$item['warehouse_id'])                 //find item and warehouse from main
                    ->first();

                    $stockin = Stock::where('product_id',$item['product_id'])   //find item and warehouse to transfer
                    ->where('warehouse_id',$request['to_warehouse'])
                    ->first();


                    if ($stock !== null) {                                           //check wether there is available items or not
                        $stock->total = $stock->total - $item['quantity'];
                        if($stock->total<0){                                        //check amount items from warehouse to transfter
                            return response()->json([
                                "success" => false,
                                "message" => "Insufficient Please Check again"
                            ], 403);
                        }else{
                        $stock->update();
                        }

                        
                        if($stockin !== null){
                            $stockin->total = $stockin->total + $item['quantity'];
                            $stockin->update();
                        }else{
                            $stock = Stock::create([
                                'product_id' => $item['product_id'],
                                'warehouse_id' => $request['to_warehouse'],

                                'alert' => 0,
                                'total' => $item['quantity'],
                                ]);
                        }


                    } else {
                        return response()->json([
                            "success" => false,
                            "message" => "Please Check Input Stock",
                        ],403);

                    }

                    $pdetail = StockOut::create([

                        'from_warehouse' => $item['warehouse_id'],
                        'product_id' => $item['product_id'],
                        'to_warehouse' => $request['to_warehouse'],
                        'quantity' => $item['quantity'],
                        'user_id' => auth()->user()->id

                       ] );
                }
                return response()->json([
                     "success" => true,
                     "message" => "Successfully Stock Transfer"
                ]);

            //  });
        } else{
            return response()->json([
                "success" => false,
                "message" => "Warehouse Id Is not valid"
           ], 403);
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

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Stock $stock)
    {
        $input = $request->alert;
        $stock->update($input);
            return response()->json([
                "success" => true,
                "message" => "Successfully Updated",
                "stock" =>  $stock
        ]);
    }

    public function stockout()
    {
        $stocks = StockOut::with('product')
                ->with('warehouse')
                ->get();
               

        return response()->json($stocks);
         // return StockResource::collection($stocks)->response();
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

    public function stockdetail(Request $request)
    {
        $from = $request['from'];
        $to = $request['to'];
        $warehouse_id = $request['warehouse_id'];
        $product_id = $request['product_id'];

        // Order query Total of all products order
        $order = DB::table('order_details')
        ->join('orders','order_details.order_id','=','orders.id')
        ->select('order_details.product_id', DB::raw('SUM(order_details.quantity) AS qty'))
        ->whereDate('orders.created_at','>=',$from)
        ->whereDate('orders.created_at','<=',$to)
        ->WhereNull('orders.deleted_at')
        ->groupBy('order_details.product_id')
        ->get();

         

    
  
        
        return response()->json([
            "success" => true,
            "order" => $order
        ], 200);
    }

}
