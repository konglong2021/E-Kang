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

        // try{

        DB::transaction(function () use ($request){
        $purchase = new Purchase();
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


            });
//End of transaction

        return response()->json([

            "message" => "Successfully Created",

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
