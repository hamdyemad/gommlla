<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\UserCollection;
use App\User;
use Illuminate\Http\Request;
use Hash;
use App\Upload;
use Str;

class UserController extends Controller
{
    public function info($id)
    {
        return new UserCollection(User::where('id', $id)->get());
    }

    public function updateName(Request $request)
    {
        $user = User::findOrFail($request->user_id);
        
          $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|email',
            'old_password' => 'required|string|min:6'
        ]);
       $count=User::where('id','!=',$request['user_id'])->where('email',$request['email'])->count();
       if($count>0){
           return response()->json([
            'message' => 'Email must Be unique '
        ]); 
       }
       
     if (Hash::check($request->old_password, $user->password)) { 
        $user->name = $request->name;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;

        if($request->new_password != null && ($request->new_password == $request->confirm_password)){
            $user->password = Hash::make($request->new_password);
        }
        if($request->hasFile('photo')){
      
            $image = $request->file('photo');
            $image_name = time() . Str::random(12) . '.' . $image->getClientOriginalExtension();

            $image->move(public_path('uploads/all'), $image_name);
            $path='uploads/all/'.$image_name;
             $upload = Upload::create([
                    'file_original_name' => null, 'file_name' => $path, 'user_id' =>$request['user_id'], 'extension' => $image->getClientOriginalExtension(),
                    'type' => "img", 'file_size' => 0
                ]);
                $user->avatar_original=$upload['id'];
        
}
        if($user->save()){
            return response()->json([
            'message' => 'Profile information has been updated successfully'
        ]);
        }

 return response()->json([
            'message' => 'Sorry! Something went wrong.'
        ]);
    }
     else{
          return response()->json([
            'message' => 'Sorry! Old Password Is Error.'
        ]);
     }  
       
    }
}
