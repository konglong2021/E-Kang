<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Role;
use Illuminate\Http\Request;


class RolesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $roles = Role::with('permissions')
            ->orderBy('id', 'desc')->get();
        return response()->json($roles);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $role= Role::create($request->all());
        $permissions = ($request->permissions);
        $role->permissions()->sync(json_decode($permissions));
        return response()->json([
           'message' => 'Created Sucessfully',
           'role'   => $role
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
        $role =Role::with('permissions')->find($id);
        return response()->json($role);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Role $role)
    {
        $role->update($request->all());
        $permissions = ($request->permissions);
        $role->permissions()->sync(json_decode($permissions));
        return response()->json([
            'message' => 'Update Successfully',
            'role' => $role
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
        $role = Role::find($id);
        $role->destroy($id);
        return response()->json([
            'message' => 'Delete Successfully'
        ]);
    }
}
