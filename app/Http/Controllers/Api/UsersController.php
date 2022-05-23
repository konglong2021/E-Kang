<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\Warehouse;
use App\Models\Profile;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Cookie;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')->with('profile')
        ->orderBy('id', 'desc')->get();
        return response()->json($users);
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


        ]);
        //Hash::make($input['password'])
        $user = User::create([

            'name' => $request['name'],
            'email' => $request['email'],
            'warehouse_id' => $request['warehouse_id'],
            'password' => Hash::make($request['password']),
        ]);

        $token =  $user->createToken('Apptoken')->plainTextToken;

        $user->roles()->sync(($request->roles));

       

        return response()->json([
            "success" => true,
            "message" => "User successfully Created",
            "user" =>  $user,
            "Token" => $token
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
        $user = User::find($id);
        // $brand =Brand::find($id);
        return response()->json($user);
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
        $user->roles()->sync(($request->roles));
        return response()->json([
           "success" =>true,
            "message" => "Successfully Updated",
            "user" =>  $user
        ]);
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
        return response()->json([

            "message" => "Successfully Deleted",
            "user" =>  $user
        ]);
    }


    public function logout(Request $request)
    {
        auth()->user()->tokens()->delete();
        $cookie = Cookie::forget('token');
        return response()->json([
            "message" => "Logout"
        ])->withCookie($cookie);
    }

    public function login(Request $request)
    {
        $attr = $request->validate([
            'password'     => [
                'string',
                'required',
            ],
            'email'    => [
                'email',
                'required',
            ],
        ]);

        $user = User::where('email',$request['email'])->with('profile')->first();
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }


        $token =  $user->createToken('Apptoken')->plainTextToken;
        $cookie =cookie('token',$token,60*24);
        return response()->json([
            "success" => true,
            "message" => "Loging in Successfully",
            "user" =>  $user,
            "Token" => $token
            
        ])->withCookie($cookie);

    }

    // update user default warehouse


}
