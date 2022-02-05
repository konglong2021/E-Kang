<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Activitylog;

class ActivitylogsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $log = Activitylog::all();
       
        if($log->isEmpty()){
            return response()->json([
                "success" => false,
                "log" => "log is empty"
            ], 200);
        }
        return response()->json([
            "success" => true,
            "log" => $log
        ], 200);
    }

    public function log($from,$to)
    {
        // $from ="2022-01-27";
        // $to ="2022-01-27";
        // $log = Activitylog::all();
        $log = Activitylog::whereBetween('created_at',[$from,$to])->get();
        if($log->isEmpty()){
            return response()->json([
                "success" => false,
                "log" => "log is empty"
            ], 200);
        }
        return response()->json($log, 200);
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
        //
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
