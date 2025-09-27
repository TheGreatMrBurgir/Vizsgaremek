<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email:rfc,dns|unique:users,email',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);

        return response()->json([
            'user' => $user,
            'token' => $user->createToken('token')->plainTextToken,
        ], 201);
    }

    public function login(Request $request)
    {
        $cred = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        if (!Auth::attempt($cred)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $user = Auth::user();

        return response()->json([
            'user'  => $user,
            'token' => $user->createToken('token')->plainTextToken,
        ]);
    }

    public function passwordReset(Request $request){
        $data = $request->validate([
            'password' => 'required|string|min:6',
            'newPassword' => 'required|string|min:6',
        ]);
        
        if($data["password"] == $data["newPassword"]){
            $user = Auth::user();
            $user->password = Hash::make($data['password']);
            $user->save();
            return response()->json(['success' => 'true']);
        }
        else{
            return response()->json(['success' => 'False']);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Logged out']);
    }
}
