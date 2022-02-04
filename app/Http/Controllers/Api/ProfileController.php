<?php

namespace App\Http\Controllers\Api;
use App\Models\Profile;
use App\Models\Warehouse;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $profile = Profile::all();
        return response()->json([
            "success" => true,
            "profile" => $profile
        ], 200, $headers);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */


    public function updatewarehouse(Request $request)
    {
        $profile= Profile::where('user_id',$request["user_id"])->get()->last();
        if(!$profile){
            return response()->json([
                "success" =>false,
                "message" => "No user data Found! Please Create One!"
            ], 200);
        }
        // User::find(auth()->user()->id);
        $warehouse = Warehouse::find($request["warehouse_id"]);
        if(!$warehouse){
            return response()->json([
                "success" => false,
                "message" => "Can't find this warehouse please Create it"
            ], 200);
        }
        $profile->warehouse_id = $request["warehouse_id"];
        $profile->update();

        return response()->json([
            "success" => true,
            "message" => "Warehouse Update Successfully",
            "profile"     => $profile
        ], 200);

    }

    public function store(Request $request)
    {
        $input = $request->all();
        $input['user_id']= auth()->user()->id;

        if ($image = $request->file('image')) {
            $destination_path = 'public/img';
            // $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            // $product['image'] = "$image_name";
        }
        else{
            $image_name ="no image created";
        }

        $input['image']= $image_name;

        $profile = Profile::create($input);
        // $customers = json_encode($request->customers);
        // $members->customers()->sync(json_decode($customers));
        return response()->json([
            "success" => true,
            "message" => "Profile successfully Created",
            "product" =>  $profile
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
        // $profile = Profile::where('user_id',$id)
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
