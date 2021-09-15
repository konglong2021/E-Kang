<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Warehouse;

class WarehousesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $warehouses = Warehouse::orderBy('id', 'desc')->paginate(10);
        return response()->json($warehouses);
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
        $warehouse = Warehouse::create($request->all());
        return response()->json([
            "success" => true,
            "message" => "warehouse successfully Created",
            "warehouse" =>  $warehouse
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $warehouse =Warehouse::find($id);
        return response()->json($warehouse);
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
    public function update(Request $request, Warehouse $warehouse)
    {
        $input = $request->all();
        $warehouse->update($input);

       
            return response()->json([
           
            "message" => "Successfully Updated",
            "warehouse" =>  $warehouse
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
        $warehouse = Warehouse::find($id);

        $warehouse->destroy($id);
        return response()->json([
           
            "message" => "Successfully Deleted",
            "warehouse" =>  $warehouse
        ]);
    }
}
