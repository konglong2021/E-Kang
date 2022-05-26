<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaction;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
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
                            ->select('transactions.id','orders.invoice_id','transactions.paid','transactions.balance','transactions.pay_method','transactions.amount','customers.name')  
                            ->get();

        $total_balance = DB::table('transactions')       
                            ->sum('transactions.balance');
                                
        
        if($customerpayment->isEmpty())
        {
            return response()->json([
                "success" => false,
                "message" => "Not Found"
            ], 404);
        }

        //$total_balance = $customerpayment->sum('transactions.balance');

        return response()->json([
            "message"=>true,
            "transaction" =>$customerpayment,
            "total" => $total_balance
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       
        

    }


    public function updateAll(Request $request)
    {   
        $transactions = $request->transactions;
        foreach($transactions as $transaction)
        {
            $input = Transaction::find($transaction['id']);
            $input->order_id = $transaction['order_id'];
            $input->paid = $transaction['paid'];
            $input->pay_method = $transaction['pay_method'];
            $input->balance = $transaction['balance'];
            $input->amount = $transaction['amount'];
            $input->update();
        }
        return response()->json("Sucessfully paid", 200);

    }

    public function show($id)
    {
        $customerpayment = DB::table('transactions')
                            ->join('orders','orders.id','=','transactions.order_id')
                            ->join('customers','customers.id','=','orders.customer_id')
                            ->select('transactions.id','orders.invoice_id','transactions.paid','transactions.balance','transactions.pay_method','transactions.amount','customers.name')  
                            ->where('customers.id','=',$id)
                            ->get();

        if($customerpayment->isEmpty())
        {
            return response()->json([
                "success" => false,
                "message" => "Not Found"
            ], 404);
        }

        return response()->json($customerpayment);

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
        $input->balance = $request->balance;
        $input->amount = $request->amount;
        $input->update();
        return response()->json([
            "message" => "Successfully Updated",
            "transaction" =>  $input
        ]);
           
        
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
