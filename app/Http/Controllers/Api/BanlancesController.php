<?php

namespace App\Http\Controllers\Api;
use App\Models\Balance;
use App\Models\Profile;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BanlancesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function CheckProfileWarehouse($user_id)
     {
        $profile= Profile::where('user_id',$user_id)->get()->last();
        return $profile->warehouse_id;
     }
    public function index()
    {
        $warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
        $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
        return response()->json([
            "success" => true,
            "balance" => $balance
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

     public function verified()
     {
        $warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
        if(!$warehouse_id){
            $balance=  response()->json("No default warehouse found!", 200);
           }

        $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
        if(!$balance){
            $balance= response()->json([
                "success" => false,
                "message" => "No Balance Please Create One!"
            ], 201);
        }

        return $balance;
     }

     //remain + income - withdraw = balance
    public function store(Request $request)
    {

        $warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
        if(!$warehouse_id){
            return response()->json("No default warehouse found!", 200);
           }
        $balance_date = date('Y-m-d');
        $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
        if(!$balance){
            $create = Balance::create([
                'remain' => $request['remain'],
                'income' => $request['income'],
                'withdraw' => $request['withdraw'],
                'balance' => $request['balance'],
                'balance_date' => $balance_date,
                'warehouse_id' => $warehouse_id,
                'user_id' => auth()->user()->id,
            ]);
            return response()->json([
                "success" => true,
                "message" =>  "create new record",
                "balance" => $create
            ], 200); //create recode
        }
        if($balance->balance_date >= $balance_date)
        {
            $input = $request->all();
            $upbalance = Balance::find($balance->id);
            $upbalance->update($input);
            return response()->json([
                "success" => true,
                "message" =>  "update record",
                "balance" => $upbalance
            ], 200); //update recode

        }
        $create = Balance::create([
            'remain' => $request['remain'],
            'income' => $request['income'],
            'withdraw' => $request['withdraw'],
            'balance' => $request['balance'],
            'balance_date' => $balance_date,
            'warehouse_id' => $warehouse_id,
            'user_id' => auth()->user()->id,
        ]);


        return response()->json([
            "success" => true,
            "message" =>  "create new record",
            "balance" => $create
        ], 200); //create recode

    }


    //show last balance by warehouse
    public function showbalance()
    {
       $balance = $this->verified();
        return response()->json($balance, 200);
    }



    //verify cash balance
    public function verifybalance(Request $request)
    {
        $warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
        if(!$warehouse_id){
         return response()->json("No default warehouse found!", 200);
        }
        $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
        if($balance->balance != $request["balance"]){
            return response()->json([
                "success" => false,
                "message" => "The Balance is not correct Please Contact with admin to verify the balance!"
            ], 201);
        }

        $balance_date = date('Y-m-d');
        if($balance->balance_date >= $balance_date)
        {
            return response()->json([
                "success" => false,
                "message" =>  "Balance has beed verified! Please change it manually!"
            ], 200);

        }

        $create = Balance::create([
            'remain' => $balance->balance,
            'income' => 0,
            'withdraw' => 0,
            'balance' => $balance->balance,
            'balance_date' => date('Y-m-d'),
            'warehouse_id' => $warehouse_id,
            'user_id' => auth()->user()->id,
        ]);
            return response()->json([
                "success" => true,
                "message" => "Cash Balance Successfully Update!",
                "balance" => $create
            ], 200);


    }


    //withdraw cash balance
    public function withdrawal(Request $request)
    {
        $warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
        if(!$warehouse_id){
            return response()->json("No default warehouse found!", 200);
           }

           $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
           if($balance->balance < $request["withdraw"]){
               return response()->json([
                   "success" => false,
                   "message" => "The Balance is not correct Please Contact with admin to verify the balance!"
               ], 201);
            }

           $balance_date = date('Y-m-d');
        if($balance->balance_date >= $balance_date)
        {
            $input['withdraw'] = $request['withdraw'] + $balance->withdraw;
            $input['balance']= $balance->remain + $balance->income - $input['withdraw'];
            $balance->update($input);
            return response()->json([
                "success" => true,
                "message" =>  "Balance has beed update successfully!",
                "balance" => $balance
            ], 200);

        }

    }

    //insert income
    public function income(Request $request)
    {
        
        $warehouse_id = $this->CheckProfileWarehouse(auth()->user()->id);
        if(!$warehouse_id){
            return response()->json("No default warehouse found!", 200);
           }

           $balance = Balance::where("warehouse_id",$warehouse_id)->get()->last();
           if(!$balance){
               return response()->json([
                   "success" => false,
                   "message" => "No this balance found"
               ], 200);
           }

           $balance_date = date('Y-m-d');
        if($balance->balance_date >= $balance_date)
        {
            
            $input['income'] = $request['income'] + $balance->income;
            $input['balance']= $balance->remain + $input['income'] - $balance->withdraw;
            $balance->update($input);
            return response()->json([
                "success" => true,
                "message" =>  "Balance has beed update successfully!",
                "balance" => $balance
            ], 200);

        }
        return response()->json([
            "success" => false,
            "message" => "Please Verify today balance first!"
        ], 200);

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
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Balance $balance)
    {
        $balance->delete();
        return response()->json([
            "success" => true,
            "message" => "Balance recode deleted",
            "balance" => $balance
        ],200);
    }
}
