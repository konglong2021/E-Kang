<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use Illuminate\Http\Request;
use Gate;
use Symfony\Component\HttpFoundation\Response;

class PermissionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
       
        $permissions = Permission::with('roles')
                                    ->orderBy('id', 'desc')->get();
        return response()->json($permissions);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        
        $permissions = Permission::create($request->all());
        // $customers = json_encode($request->customers);
        // $members->customers()->sync(json_decode($customers));
        return response()->json([
            "success" => true,
            "message" => "Permission successfully Created",
            "permission" =>  $permissions
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Permission $permission)
    {
        

        return response()->json($permission);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Permission $permission)
    {
        
        $input = $request->all();
        $permission->update($input);
        // $customers = json_encode($request->customers);
        // $member->customers()->sync(json_decode($customers));

        return response()->json([

            "message" => "Successfully Updated",
            "permission" =>  $permission
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
       
        $permission = Permission::find($id);

        $permission->destroy($id);
        return response()->json([
            "message" => "Successfully Deleted",
            "category" =>  $permission
        ]);
    }
}
