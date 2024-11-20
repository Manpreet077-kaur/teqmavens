import 'WeatherData.dart';

class ForecastData {
  final List<WeatherData> list;

  ForecastData({required this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    Map<String, WeatherData> uniqueWeatherDataMap = {};

    for (dynamic e in json['list']) {
      WeatherData w = WeatherData(
          date: DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
          name: json['city']['name'],
          minTemp: e['main']['temp_min'].toDouble(),
          maxTemp: e['main']['temp_max'].toDouble(),
          main: e['weather'][0]['main'],
          humidity:e['main']['humidity'],
          windSpeed: e['wind']['speed'].toDouble(),
          icon: e['weather'][0]['icon']);

      String key = "${w.date!.year}-${w.date!.month}-${w.date!.day}";

      if (!uniqueWeatherDataMap.containsKey(key)) {
        uniqueWeatherDataMap[key] = w;
      }
    }

    List<WeatherData> weatherDataList = uniqueWeatherDataMap.values.toSet().toList();

    return ForecastData(
      list: weatherDataList,
    );
  }
}
