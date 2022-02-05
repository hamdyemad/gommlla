<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Country;
use App\Shipping;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Support\Facades\Validator as FacadesValidator;
use Illuminate\Validation\Rule;

class CountryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $countries = Country::paginate(15);
        if($request->name) {
            $countries = Country::where('name', 'like', '%' . $request->name . '%')->paginate(15);
        }
        return view('backend.setup_configurations.countries.index', compact('countries'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    public function getCitiesByCountryName(Request $request) {
        $country = Country::where('name', 'like', '%' . $request->country .'%')->first();
        return Shipping::where('country_id', $country->id)->get()->toArray();
    }

    public function getCitiesOfCountry(Request $request,Country $country) {
        $shippings = Shipping::where('country_id', $country->id)->paginate(15);
        if($request->name) {
            $shippings = Shipping::where('country_id', $country->id)
            ->where('city', 'like', '%' . $request->name . '%')->paginate(15);
        }
        return view('backend.setup_configurations.countries.cities.index', compact('shippings', 'country'));
    }

    public function createCityOfCountry(Country $country) {
        return view('backend.setup_configurations.countries.cities.create', compact('country'));
    }

    public function storeCityOfCountry(Request $request, Country $country) {
        $request->validate([
            'city' => 'required',
            'cost' => 'required|integer',
            'country_id' => Rule::exists('countries', 'id')
        ]);

        Shipping::create([
            'city' => $request->city,
            'cost' => $request->cost,
            'country_id' => $request->country_id,
        ]);
        flash(translate('City Has Been Created Successfully'))->success();
        return redirect()->back();
    }

    public function editCiitiesOfCountry(Country $country, Shipping $city) {
        return view('backend.setup_configurations.countries.cities.edit', compact('country', 'city'));
    }

    public function updateCiitiesOfCountry(Request $request, Country $country, Shipping $city) {
        $request->validate([
            'city' => 'required',
            'cost' => 'required|integer',
            'country_id' => Rule::exists('countries', 'id')
        ]);

        $city->update([
            'city' => $request->city,
            'cost' => $request->cost,
            'country_id' => $request->country_id,
        ]);
        flash(translate('City Has Been Updated Successfully'))->info();
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function updateStatus(Request $request){
        $country = Country::findOrFail($request->id);
        $country->status = $request->status;
        if($country->save()){
            return 1;
        }
        return 0;
    }
}
