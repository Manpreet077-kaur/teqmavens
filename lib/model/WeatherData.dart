class WeatherData {
  final DateTime? date;
  final String? name;
  final double? minTemp;
  final double? maxTemp;
  final double? windSpeed;
  final String? main;
  final String? icon;
  final int? humidity;

  WeatherData({this.date, this.name, this.minTemp,this.maxTemp, this.main, this.icon, this.humidity, this.windSpeed});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      name: json['name'],
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );







  }
}