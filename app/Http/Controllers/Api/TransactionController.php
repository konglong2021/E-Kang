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
        
        // $customerpayment = DB::table('transactions')
        //                     ->join('orders','orders.id','=','transactions.order_id')
        //                     ->join('customers','customers.id','=','orders.customer_id')
        //                     ->select('transactions.id','orders.invoice_id','transactions.paid','transactions.pay_method','customers.name')  
        //                     ->get();

        // $total_balance = DB::table('transactions')       
        //                     ->sum('transactions.balance');

        $customerpayment = Transaction::with('order')
                                        ->with('customers')
                                        ->get();
        
        return TransactionResource::collection($customerpayment);                                 

    }
    


    public function store(Request $request)
    {
       
        

    }


    public function InvoicePaid(Request $request)
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
        // return response()->json($result, 200);

    }

    public function show($id)
    {
        // $transaction = DB::table('transactions')
        //                     ->join('orders','orders.id','=','transactions.order_id')
        //                     ->join('customers','customers.id','=','orders.customer_id')
        //                     ->select('transactions.id','orders.invoice_id','transactions.paid','transactions.balance','transactions.pay_method','transactions.amount','customers.name')  
        //                     ->where('customers.id','=',$id)
        //                     ->get();

        // return response()->json($transaction);
        $transaction = Transaction::find($id);
        
        if(empty($transaction))
        {
            return response()->json("Not Found");
        }
        
        return (new TransactionResource($transaction->loadMissing(['order','customers'])))->response();
        //127.0.0.1:8000/api/transaction/4 number 4 is customer id
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
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
        //
    }
}
