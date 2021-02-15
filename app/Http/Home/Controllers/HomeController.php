<?php

namespace CreatyDev\Http\Home\Controllers;

use Illuminate\Http\Request;
use CreatyDev\App\Controllers\Controller;
use Sarfraznawaz2005\VisitLog\Facades\VisitLog;
use CreatyDev\Domain\Subscriptions\Models\Plan;
use Mail;

class HomeController extends Controller
{
    /**
     * Show the application home page.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Log the visitor
        VisitLog::save();
        // Get Plans to show on the landing page
        $plans =  Plan::take('4')->get();
        return view('home.index', compact('plans'));
    }

    public function contactPost(Request $request){
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email',
            'comment' => 'required',
            'subject' => 'required',
        ]);

        $emails = ['hello@faceki.com'];

        Mail::send('email', [
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'comment' => $request->get('comment'),
            'subject' => $request->get('subject'),
        ],
        function ($message) use ($emails) {
            $message->from('hello@faceki.com','faceki.com');
            $message->to($emails)
            ->subject('Your Website Contact Enquiry Details');
        });

        return back()->with('success', 'Thanks for contacting me, I will get back to you soon!');

    }
}
