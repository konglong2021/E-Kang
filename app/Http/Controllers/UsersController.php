<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')
        ->orderBy('id', 'desc')->get();
        
        return view('pos.user.index',compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::pluck('title', 'id');
        

        return view('pos.user.create',compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'     => [
                'string',
                'required',
            ],
            'email'    => [
                'email',
                'required',
            ],
            'password'    => [
                'string',
                'required',
            ],
            // 'image' => ['nullable', 'mimes:jpg,jpeg,png', 'max:10048'],
           
        ]);
        //Hash::make($input['password'])
        $user = User::create([
           
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
        ]);

        
       
        return redirect()->route('user.index')->with('success','You have successfully Created.');
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
    public function edit(User $user)
    {
        $roles = Role::pluck('title', 'id');
        
        // $categories = Categorie::pluck('name', 'id');

         $user->load('roles');
        // dd($products);
        return view('pos.user.edit', compact('user', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name'     => [
                'string',
                'required',
            ],
            'email'    => [
                'email',
                'required',
            ],
        ]);
        
        $user->update($request->all());
        $user->roles()->sync($request->input('roles', []));

        return redirect()->route('user.index')
        ->with('success','update successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();

        return redirect()->route('user.index')
        ->with('success','Delete successfully');
    }
}
