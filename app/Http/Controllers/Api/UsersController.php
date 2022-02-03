<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\Warehouse;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

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
        return [
            'message' => 'Logged Out'
        ];
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

        $user = User::where('email',$request['email'])->first();

        // if(!$user || !Hash::check($request['password'], $user->password))
        // {
        //     return response()->json([
        //         'message' => 'Email and Password invalid'
        //     ],401);
        // }

        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }
        // if (!Auth::attempt($attr)) {
        //     return $this->error('Credentials not match', 401);
        // }

        $token =  $user->createToken('Apptoken')->plainTextToken;
        return response()->json([
            "success" => true,
            "message" => "Loging in Successfully",
            "user" =>  $user,
            "Token" => $token
        ]);
    }

    // update user default warehouse
    public function updatewarehouse(Request $request, User $user)
    {
        $user= User::find(auth()->user()->id);
        $warehouse = Warehouse::find($request["warehouse_id"]);
        if(!$warehouse){
            return response()->json([
                "success" => false,
                "message" => "Can't find this warehouse please Create it"
            ], 200);
        }
        $user->warehouse_id = $request["warehouse_id"];
        $user->update();

        return response()->json([
            "success" => true,
            "message" => "Warehouse Update Successfully",
            "user"     => $user
        ], 200);

    }

}
