<?php

namespace App\Http\Controllers\Api;
use App\Models\Balance;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BanlancesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $balance = Balance::all()->last();
        return response()->json($balance, 200); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

     //remain + income - withdraw = balance
    public function store(Request $request)
    {
        $balance = Balance::all()->last();
        $balance_date = date('Y-m-d');
        if($balance->balance_date < $balance_date)
        {
            $create = Balance::create([
                'remain' => $request['remain'],
                'income' => $request['income'],
                'withdraw' => $request['withdraw'],
                'balance' => $request['remain'] + $request['income'] - $request['withdraw'],
                'balance_date' => $request['balance_date'],
                'user_id' => auth()->user()->id,
            ]);
            return response()->json([
                "success" => true,
                "message" =>  "create new record",
                "balance" => $balance
            ], 200); //create recode 
        }
        
        $input = $request->all();
        $ubalance = Balance::find($balance->id);
        $ubalance->update($input);
        return response()->json([
            "success" => true,
            "message" =>  "update record",
            "balance" => $ubalance
        ], 200); //update recode
        
    }

    public function showbalance()
    {
        $balance = Balance::all()->last();
        return response()->json($balance->balance, 200);
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
    public function update(Request $request, Balance $balance)
    {
        $input = $request->all();
        $balance->update($input);
        return response()->json($balance, 200); //update recode

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
