import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../helper/snackBar.dart';
import '../../helper/string_constants.dart';
import '../../helper/utils.dart';
import '../../model/ForecastData.dart';
import '../../model/WeatherData.dart';
import '../../repository/api_repo.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import '../../helper/constants.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
class HomeController extends GetxController{
  ApiRepo apiRepo = Get.find<ApiRepo>();
  final weatherData = Rxn<WeatherData>();
  final forecastData = Rxn<ForecastData>();
 TextEditingController searchController=TextEditingController();
  @override
  void onInit() {
    onAllowClick();
    super.onInit();

  }

//weather api call
  void getWeatherData(String lat,lng){
    try{
      UIData.showProgressDialog();
      apiRepo.getWeatherData(lat,lng).then((response) async {
        UIData.hideProgressDialog();
        weatherData.value=response;
      });
    }catch(e){
      UIData.hideProgressDialog();
    }
  }
  //Forecast api call

  void getForcastData(String lat,lng){
    try{
      UIData.showProgressDialog();
      apiRepo.getForecastData(lat,lng).then((response) async {
        UIData.hideProgressDialog();
        forecastData.value=response;
      });
    }catch(e){
      UIData.hideProgressDialog();
    }
  }

// handle location permission here
  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        SnackBarView.showSnackBar(title: StringConstants.error, message:StringConstants.locationPermissionsDenied, isError: false);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      UIData.showLocationPermissionDialog();
      return false;
    }
    return true;
  }
  // Here get current latlng
  void onAllowClick() async {
    bool response = await handleLocationPermission();
    if (response) {
      UIData.showProgressDialog();
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        UIData.hideProgressDialog();
        getWeatherData(position.latitude.toString(),position.longitude.toString());
        getForcastData(position.latitude.toString(),position.longitude.toString());
      }).catchError((e) {
        UIData.showProgressDialog();
        SnackBarView.showSnackBar(title: StringConstants.error, message:e.toString(), isError: false);

      });
    }
  }

  // search location place fun
  void onChangeAddress(BuildContext context)async{
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: MapKey,
        radius: 10000000,
        types: [],
        logo: const SizedBox.shrink(),
        strictbounds: false,
        mode: Mode.overlay,
        language: "en",
        components: [
          Component(
              Component.country, "fr"),
          Component(
              Component.country, "in"),
          Component(Component.country, "UK")]);
    displayPrediction(p);
  }

  //here getting latln from search location
  Future<void> displayPrediction(Prediction? p) async {
    if (p == null) {
      return;
    }
    final _places = GoogleMapsPlaces(
      apiKey: MapKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    final detail = await _places.getDetailsByPlaceId(p.placeId!);
    final geometry = detail.result.geometry!;
    var lat = geometry.location.lat;
    var lng = geometry.location.lng;
    getWeatherData(lat.toString(),lng.toString());
    getForcastData(lat.toString(),lng.toString());
  }
}