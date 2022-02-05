<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Member;
use Illuminate\Support\Facades\DB;

class CustomersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {   
        
        $customer = DB::table('members')
                        ->join('customers','members.id','=','customers.member_id')
                        ->select('customers.id','customers.name','customers.phone','customers.address','members.title','members.discount')
                        ->orWhereNull('customers.deleted_at')
                        ->get();

        return response()->json([
                "success" => true,
                "customer" => $customer
        ]);
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
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $customer = Customer::create($request->all());
        return response()->json([
            "success" => true,
            "message" => "customer successfully Created",
            "customer" =>  $customer
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $customer = DB::table('members')
                        ->join('customers','members.id','=','customers.member_id')
                        ->select('customers.id','customers.name','customers.phone','customers.address','members.title','members.discount')
                        ->where('customers.id','=',$id)
                        ->WhereNull('customers.deleted_at')
                        ->get();

        return response()->json([
                "success" => true,
                "customer" => $customer
        ]);
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
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Customer $customer)
    {
        $input = $request->all();
        $customer->update($input);


            return response()->json([

            "message" => "Successfully Updated",
            "customer" =>  $customer
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
        $customer = Customer::find($id);

        $customer->destroy($id);
        return response()->json([
            "message" => "Successfully Deleted",
            "customer" =>  $customer
        ]);
    }
}
