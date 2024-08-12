import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_weather/model/weather_model.dart';
import 'package:smart_weather/network/network.dart';

final weatherProvider = FutureProvider.family((ref, List<String> cities) {
  return WeatherController().getApiData(cities);
});

class WeatherController with HTTPRequests {
  Future<List<WeatherModel>> getApiData(List<String> cities) async {
    const apiKey = "84041372363ceb59ab377e8d5242a472";
    const imgUrl = "https://openweathermap.org/img/wn/";

    final List<Map<String, dynamic>> out = [];

    try {
      await Future.wait(cities.map((city) async {
        final res = await getRequest(
          "weather?q=$city&appid=$apiKey&units=metric",
        );

        if (res != null) {
          out.add({
            "city": res["name"],
            "weather": res["weather"][0]["main"],
            "icon": "${imgUrl + res["weather"][0]["icon"]}@4x.png",
            "temperature": (res["main"]["temp"]).toStringAsFixed(0),
          });
        }
      }));

      return weatherModelFromJson(out);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
