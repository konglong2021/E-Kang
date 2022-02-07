<?php

namespace App\Http\Controllers\Api;
use App\Models\Profile;
use App\Models\Warehouse;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gate;
use Symfony\Component\HttpFoundation\Response;

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
        ], 200);
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
            $profile_create = Profile::create([
                'user_id' => auth()->user()->id,
                'warehouse_id' => $request['warehouse_id']
            ]);

            return response()->json([
                "success" =>true,
                "message" => "User data Created",
                "profile" => $profile_create
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
        abort_if(Gate::denies('profile_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $profile = Profile::where('user_id',$id)->with('user')
                            ->get();

        return response()->json([
            "success" => true,
            "profile" => $profile
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Profile $profile)
    {
        $input = $request->all();
        if ($image = $request->file('image')) {
            $destination_path = 'public/img';


            $image_name = time().'.'.$request->image->extension();
            $path = $request->file('image')->storeAs($destination_path,$image_name);
            $input['image'] = $image_name;
        }
        else{
            unset($input['image']);
        }

        $profile->update($input);
        return response()->json([
            "success" => true,
            "profile" => $profile
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Profile $profile)
    {
        $profile->delete();
        return response()->json([
            "success" => true,
            "message" => "Successfully Deleted",
            "profile" =>  $profile
        ]);
    }
}
