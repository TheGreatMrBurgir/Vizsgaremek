<?php

namespace App\Http\Controllers;

use App\Models\Order;

class AdminOrderController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $u = $request->user();
            if (!$u || !($u->is_admin ?? false)) {
                abort(403, 'Csak admin érheti el.');
            }
            return $next($request);
        });
    }

    public function index()
    {
        return Order::with(['user','product'])->orderByDesc('id')->get();
    }

    public function approve($id)
    {
        $order = Order::findOrFail($id);
        $order->status = 'approved';
        $order->save();
        return $order;
    }

    public function reject($id)
    {
        $order = Order::findOrFail($id);
        $order->status = 'rejected';
        $order->save();
        return $order;
    }
}
