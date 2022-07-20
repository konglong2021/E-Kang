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
use App\Models\MonthlyStockBalance;
use App\Http\Resources\BrandResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Arr;


class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
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



    //Track Stock in
    public function stockTrack($product_id)
    {
        $stocks = Stock::all();
        $products = $stocks->sortBy('product_id')->map(function($item,$key){
            return ['product_id' => $item->product_id];
        });   
        return response()->json($products);
        $purchase = DB::table('purchase_details')
                        ->join('products','products.id','=','product_id')
                        ->join('purchases','purchases.id','=','purchase_id')
                        ->select('products.en_name','purchase_details.quantity','purchase_details.unitprice','purchases.batch',
                                        'purchase_details.product_id','purchase_details.created_at')
                        ->where('purchase_details.product_id',$product_id)
                        ->where('purchase_details.deleted_at','=',null)
                        ->get();



        $sum = collect($purchase)->reduce(function ($carry,$item){
            $carry += (int)$item->quantity;
            return $carry;
        });



        $stock = Stock::where('product_id',$product_id)->get();

//        $checkVersion = collect($purchase)->reverse()->reduce(function ($version,$item) use ($sum,$stock){
//            if($item->quantity > $stock->total) {
//                $version->push($sum - $item->quantity);
//           }else{
//                $version = $item->quantity;
//            }
//        });

        return response()->json([
           "message" => true,
           "purchase" => $purchase,
           "stock" => $stock,
           "sum" => $sum,
//           "stockTransfer" => $checkVersion
        ]);
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

    public function searchstockbywarehouse($warehouse,$search)
    {
            $stocks= Stock::
                WhereHas('product', function($q) use ($search) {
                return $q->where('en_name', 'LIKE', '%' . $search . '%')
                         ->orwhere('kh_name', 'LIKE', '%' . $search . '%')
                         ->orwhere('code', 'LIKE', '%' . $search . '%');
            })
            ->with('warehouse')
            ->where('warehouse_id',$warehouse)
            ->with('product')
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
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        if($request->items!==null){
                $items= $request->items;
                foreach($items as $item)
                {
                    $stock = Stock::where('product_id',$item['product_id'])
                                    ->where('warehouse_id','=',$item['from_warehouse'])   //find item and warehouse from main
                                    ->first();

                    $stockin = Stock::where('product_id',$item['product_id'])   //find item and warehouse to transfer
                    ->where('warehouse_id',$item['to_warehouse'])
                    ->first();

                    if ($stock !== null) {                                           //check wether there is available items or not
                        $stock->total -= $item['quantity'];
                        $stock->update();
                        }

                        if($stockin !== null){
                            $stockin->total += $item['quantity'];
                            $stockin->update();
                        }else{
                            $stock = Stock::create([
                                'product_id' => $item['product_id'],
                                'warehouse_id' => $item['to_warehouse'],
                                'alert' => 0,
                                'total' => $item['quantity'],
                                ]);
                        }

                        $pdetail = StockOut::create([
                            'from_warehouse' => $item['from_warehouse'],
                            'product_id' => $item['product_id'],
                            'to_warehouse' => $item['to_warehouse'],
                            'quantity' => $item['quantity'],
                            'ref' => $item['ref'],
                            'user_id' => auth()->user()->id
                           ]);


                }
                return response()->json([
                     "success" => true,
                     "message" => "Successfully Stock Transfer"
                ]);

            }   //  });


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
     * @return \Illuminate\Http\JsonResponse
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
                ->with('fromWarehouse')
                ->with('toWarehouse')
                ->get()->sortDesc();
        // $stocks = new StockOut();
        return response()->json($stocks);
        //  return StockResource::collection($stocks)->response();
        //  return StockResource::collection($stocks->loadMissing(['product','fromWarehouse','toWarehouse']))->response();
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
        $month = $request['month'];
        // Order query Total of all products order
        $order = DB::table('order_details')
        ->join('products','order_details.product_id','=','products.id')
        ->join('orders','order_details.order_id','=','orders.id')
        ->select('order_details.product_id','orders.warehouse_id', 'order_details.quantity as qty','order_details.sellprice',DB::raw('order_details.quantity * order_details.sellprice AS o_total'),'products.en_name')
        ->whereMonth('order_details.created_at',$month)
        // ->whereDate('order_details.created_at','<=',$to)
        ->WhereNull('order_details.deleted_at')
        ->get();

        // Purchase query Total all products
        $purchase = DB::table('purchase_details')
                    ->join('products','purchase_details.product_id','=','products.id')
                    ->join('purchases','purchase_details.purchase_id','=','purchases.id')
                    ->select('purchase_details.product_id','purchases.warehouse_id','purchase_details.unitprice','purchase_details.quantity',DB::raw('purchase_details.quantity * purchase_details.unitprice as p_total'),'products.en_name')
                    ->whereMonth('purchase_details.created_at',$month)
                    // ->whereDate('purchase_details.created_at','<=',$to)
                    ->WhereNull('purchase_details.deleted_at')
                    ->get();

        $stockBalance = DB::table('monthly_stock_balances')
                        ->join('products','monthly_stock_balances.product_id','=','products.id')
                        ->join('stock_balance_dates','monthly_stock_balances.stock_balance_dates_id','=','stock_balance_dates.id')
                        ->select('monthly_stock_balances.id','monthly_stock_balances.product_id','products.en_name','monthly_stock_balances.warehouse_id','stock_balance_dates.stockmonth','monthly_stock_balances.total')
                        ->where('stock_balance_dates.stockmonth','=',($month-1))
                        ->get();

        $stockTransfer = StockOut::whereMonth('created_at',$month)->get();



        return response()->json([
            "success" => true,
            "purchase" => $purchase,
            "order" => $order,
            "stockBalance" => $stockBalance,
            "stockTransfer" => $stockTransfer
            // "total" =>$total
            ], 200);

    }

    public function buysell($day,$warehouse_id)
    {
        $today = date('Y-m-d',strtotime($day));

        // Order query Total of all products order
        $order = DB::table('order_details')
        ->join('products','order_details.product_id','=','products.id')
        ->join('orders','order_details.order_id','=','orders.id')
        ->select('order_details.product_id', 'order_details.quantity as qty','order_details.sellprice',DB::raw('order_details.quantity * order_details.sellprice AS o_total'),'products.en_name')
        ->whereDate('orders.created_at','=',$today)
        ->where('orders.warehouse_id',$warehouse_id)
        ->WhereNull('orders.deleted_at')
        ->orderByDesc('orders.id')
        ->get();

        // Purchase query Total all products
        $purchase = DB::table('purchase_details')
                    ->join('products','purchase_details.product_id','=','products.id')
                    ->join('purchases','purchase_details.purchase_id','=','purchases.id')
                    ->select('purchase_details.product_id','purchase_details.unitprice','purchase_details.quantity',DB::raw('purchase_details.quantity * purchase_details.unitprice as p_total'),'products.en_name')
                    ->whereDate('purchases.created_at','=',$today)
                    ->where('purchases.warehouse_id',$warehouse_id)
                    ->WhereNull('purchases.deleted_at')
                    ->orderByDesc('purchases.id')
                    ->get();


        return response()->json([
            "success" => true,
            "purchase" => $purchase,
            "order" => $order,
            // "total" =>$total


            ], 200);

    }
}
