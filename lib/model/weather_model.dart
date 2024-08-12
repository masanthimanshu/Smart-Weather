List<WeatherModel> weatherModelFromJson(data) {
  return List<WeatherModel>.from(data.map((x) => WeatherModel.fromJson(x)));
}

class WeatherModel {
  final String city;
  final String icon;
  final String weather;
  final String temperature;

  WeatherModel({
    required this.city,
    required this.icon,
    required this.weather,
    required this.temperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json["city"],
      icon: json["icon"],
      weather: json["weather"],
      temperature: json["temperature"],
    );
  }
}
