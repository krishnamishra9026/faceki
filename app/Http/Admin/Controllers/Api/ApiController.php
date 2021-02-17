<?php

namespace CreatyDev\Http\Admin\Controllers\Api;

use CreatyDev\App\Controllers\Controller;
use CreatyDev\Domain\Admin\Api\Api;
use Illuminate\Http\Request;
use Session;
use URL;

class ApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    function __construct()
    {
        
    }

    public function index()
    {
        // $this->authorize('create', Api::class);

        $apis = Api::paginate();

        return view('admin.apis.index', compact('apis'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('create', Api::class);

        return view('admin.apis.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->authorize('create', Api::class);

        // Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        $this->validate($request, [
            'name' => 'required',
            'description' => 'required',
        ]);
     

        $api = new Api([
            'name' => $request->input('name'),
            'description' => $request->input('description'),
            'status' => $request->input('status'),
        ]);

        $api->save();

        return redirect()->back()->with("success", "Your Api has been created.");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        Session::forget('back_apis_url');
        Session::put('back_apis_url', route('admin.apis.index'));

        $this->authorize('update', Api::class);

        $api = Api::findOrFail($id);

        return view('admin.apis.edit', compact('api', $api));
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

        $this->authorize('update', Api::class);

        $this->validate($request, [
            'name' => 'required',
            'description' => 'required',
        ]);

        $api = Api::findOrFail($id);
        $api->name = $request->input('name');
        $api->description = $request->input('description');
        $api->status = $request->input('status');
        $api->save();

        return redirect()->back()->with("success", "Your Api has been updated.");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('delete', Api::class);
        $api = Api::findOrFail($id);
        $api->delete();
        return redirect()->back()->with("success", "Your Api has been deleted.");
    }
}
