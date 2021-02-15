<?php

namespace CreatyDev\Http\Subscription\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use CreatyDev\App\Controllers\Controller;
use CreatyDev\Domain\Subscriptions\Models\Plan;
use CreatyDev\Domain\Subscriptions\Requests\SubscriptionStoreRequest;
use DB;

class SubscriptionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $user = Auth::user();
        return view('subscriptions.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param SubscriptionStoreRequest $request
     * @return \Illuminate\Http\Response
     */
    public function store(SubscriptionStoreRequest $request)
    {

        // echo "<pre>";print_r($request->all());"</pre>";exit;
        $subscription = $request->user()->newSubscription('main', $request->plan);
        // $user = User::find(1);

        // $subscription = $request->user()->newSubscription('main', 'premium')->create($paymentMethod);

        if($request->has('coupon')) {
            $subscription->withCoupon($request->coupon);
        }

        if ($request->token) {
            $subscription->create($request->token);
        }else{

            DB::table('subscriptions')->insert(
    ['user_id' => $request->user()->id , 'name' => 'main', 'stripe_id' => 'sub_IEOD4A2i19OuoO', 'stripe_status' => 'active', 'stripe_plan' => 'Freemium', 'quantity' => 1,'created_at' => NOW(), 'updated_at' => NOW()]);

            // INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `stripe_id`, `stripe_status`, `stripe_plan`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES (NULL, '10', 'main', 'sub_INLzToRsXRo2w0', 'active', 'Trial_Free', '1', NULL, NULL, '2020-11-12 08:36:07', '2020-11-12 08:51:33')

        }

        return redirect()->route('account.dashboard')->withSuccess('Thanks for becoming a subscriber.');
    }
}
