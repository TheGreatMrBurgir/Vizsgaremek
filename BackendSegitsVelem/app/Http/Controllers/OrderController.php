<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function index()
    {
        return Order::with(['user', 'product'])->where('user_id', Auth::id())->get();
    }

    public function store(Request $request)
    {
        $fields = $request->validate([
            'product_id' => 'required|exists:products,id',
        ]);

        return Order::create([
            'user_id' => Auth::id(),
            'product_id' => $fields['product_id'],
            'status' => 'pending',
        ]);
    }
}
