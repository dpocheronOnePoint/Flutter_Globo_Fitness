import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '776357274ee5e6615e9af35fd2afd844';

  Future<String> getWeather(String latitude, String longitude) async {
    Map<String, dynamic> parameters = {
      'lat': latitude,
      'lon': longitude,
      'appId': apiKey
    };
    Uri uri = Uri.http(authority, path, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}
