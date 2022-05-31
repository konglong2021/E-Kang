<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaction;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\TransactionResource;
use DB;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $customerpayment = DB::table('transactions')
                            ->join('orders','orders.id','=','transactions.order_id')
                            ->join('customers','customers.id','=','orders.customer_id')
                            ->where('status','=','0')
                            ->select('transactions.id','orders.invoice_id','orders.id as order_id','orders.grandtotal','transactions.paid','transactions.pay_method','customers.name','customers.id as customer_id')  
                            // ->select('transactions.*','orders.*','customers.*')  
                            ->get();

        // $total_balance = DB::table('transactions')       
        //                     ->sum('transactions.balance');

        // $customerpayment = Transaction::with('order')
        //                                 ->with('customers')
        //                                 ->get();
        
        // return TransactionResource::collection($customerpayment);     
        // return new TransactionResource($customerpayment);      
        return response()->json($customerpayment);                      

    }
    


    public function store(Request $request)
    {
        $transactions = $request->transactions;
        $result =collect([]);
        foreach($transactions as $transaction)
        {
            $input = new Transaction();
            $input->order_id = $transaction['order_id'];
            $input->paid    = $transaction['paid'];
            $input->pay_method = $transaction['pay_method'];
            $input->save();
            $result->push($input);
            
        }
        return TransactionResource::collection($result);

    }


    public function show($id)
    {
        $transaction = DB::table('transactions')
                            ->join('orders','orders.id','=','transactions.order_id')
                            ->join('customers','customers.id','=','orders.customer_id')
                            ->select('transactions.id','orders.id as order_id','orders.invoice_id','orders.grandtotal','transactions.paid','transactions.pay_method','customers.name','customers.id as customer_id')  
                            ->where('customers.id','=',$id)
                            ->get();
        $order = DB::table('orders')
                    ->where('status','=',0)
                    ->where('customer_id',$id)
                    ->sum('grandtotal');
                    

        $tsum  = [
            'paid'      => $transaction->sum('paid'),
            'amount'    => $order,
            'balance'   => $order - $transaction->sum('paid')
        ];

        return response()->json([
            "data" => $transaction,
            "summary"  => $tsum
        ]);

        // $transaction = Transaction::find($id);
        
        // if(empty($transaction))
        // {
        //     return response()->json("Not Found");
        // }
        
        // return (new TransactionResource($transaction->loadMissing(['order','customers'])))->response();

    }

     


    public function update(Request $request ,$id)
    {
        $input = Transaction::find($id);
        $input->order_id = $request->order_id;
        $input->paid = $request->paid;
        $input->pay_method = $request->pay_method;
        $input->update();

        return new TransactionResource($input);
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $input = Transaction::find($id);
        $input->destroy($id);

        return response()->json("Delete Successfull");
    }
}
