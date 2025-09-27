<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        return Product::orderBy('id','desc')->get();
    }

    public function show($id)
    {
        return Product::findOrFail($id);
    }

    public function store(Request $request)
    {
        $fields = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'goal_amount' => 'required|integer|min:0',
            'collected_amount' => 'nullable|integer|min:0',
            'image' => 'nullable|image|max:2048',
        ]);

        $path = null;
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('public/products');
        }

        $product = Product::create([
            'name' => $fields['name'],
            'description' => $fields['description'] ?? null,
            'goal_amount' => $fields['goal_amount'],
            'collected_amount' => $fields['collected_amount'] ?? 0,
            'image' => $path ? Storage::url($path) : null,
        ]);

        return response()->json($product, 201);
    }

    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $fields = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|nullable|string',
            'goal_amount' => 'sometimes|required|integer|min:0',
            'collected_amount' => 'sometimes|nullable|integer|min:0',
            //'image' => 'sometimes|nullable|image|max:2048',
        ]);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('public/products');
            $fields['image'] = Storage::url($path);
        }

        $product->update($fields);
        return $product;
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        return response()->noContent();
    }
}
