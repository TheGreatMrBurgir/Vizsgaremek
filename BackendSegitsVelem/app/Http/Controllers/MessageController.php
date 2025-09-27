<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactMessage;
use Illuminate\Support\Facades\DB;
use App\Models\Message;
use Illuminate\Support\Facades\Http;

class MessageController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        if (!$user || !($user->is_admin ?? false)) {
            abort(403, 'Csak admin érheti el.');
        }
        return DB::table('messages')->orderByDesc('id')->get();
    }

    public function store(Request $request)
    {
        $fields = $request->validate([
            'name'    => 'required|string|max:255',
            'email'   => 'required|email|max:255',
            'message' => 'required|string',
        ]);
        Message::create($fields);

        $apiKey = env('MAILGUN_API_KEY');
$mailgunDomain = env('MAILGUN_DOMAIN');

$response = Http::withBasicAuth('api', $apiKey)
    ->asForm()
    ->post("https://api.mailgun.net/v3/{$mailgunDomain}/messages", [
        'from' => 'info SegitsVelem <info@sandbox.mgsend.net>',
        'to' => 'Simon <2alkoholfrei@gmail.com>',
        'subject' => 'Hello Simon',
        'text' => "küldő neve: ".$request->name."küldő emailcíme: ".$request->email."küldő üzenete: ".$request -> message,
    ]);


        /*// fejlesztéskor log mailerrel fut – a levél a logba megy
        Mail::to('2alkoholfrei@gmail.com')->send(new ContactMessage(
            $request->name,
            $request->email,
            $request->message
        ));
        */

        return response()->json(['message' => 'Üzenet elküldve.']);
    }
}
