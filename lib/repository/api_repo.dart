import 'package:get/get.dart';
import 'package:teqmavens_task/helper/constants.dart';
import '../helper/snackBar.dart';
import '../helper/string_constants.dart';
import '../helper/utils.dart';
import '../model/ForecastData.dart';
import '../model/WeatherData.dart';
import 'api_constant.dart';

class ApiRepo extends GetConnect{
  Future<dynamic> getWeatherData(String lat,lng) async {
    String url = ApiConstant.wheatherbaseUrl  ;
    final response = await get("${url}&lat=$lat&lon=$lng",);
    if(response.statusCode==200){
      return WeatherData.fromJson(response.body);
    }else{
      UIData.hideProgressDialog();
      SnackBarView.showSnackBar(title: StringConstants.error, message:response.bodyString.toString(), isError: false);
    }
  }
  Future<ForecastData> getForecastData(String lat,lng) async {
    String url = ApiConstant.forecastbaseUrl  ;
    String key = WeatherKey  ;
    final response = await get("${url}lat=$lat&lon=$lng&appid=$key",);
    return ForecastData.fromJson(response.body);
  }

}
