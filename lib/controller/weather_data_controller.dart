import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_weather/model/weather_data_model.dart';
import 'package:smart_weather/network/network.dart';

final weatherDataProvider = FutureProvider.family((ref, List<String> cities) {
  return WeatherDataController().getApiData(cities);
});

class WeatherDataController with HTTPRequests {
  Future<List<WeatherDataModel>> getApiData(List<String> cities) async {
    final apiKey = dotenv.env["OPEN_WEATHER_API_KEY"];
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

      return weatherDataModelFromJson(out);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
