import 'package:flutter_globo_fitness/data/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '776357274ee5e6615e9af35fd2afd844';

  Future<Weather> getWeather(String latitude, String longitude) async {
    Map<String, dynamic> parameters = {
      'lat': latitude,
      'lon': longitude,
      'appId': apiKey
    };
    Uri uri = Uri.http(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
