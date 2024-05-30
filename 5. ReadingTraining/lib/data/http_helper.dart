import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sharedpreferences/data/weather.dart';

class HttpHelper {
  final String domain = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '35bc6c3ea0807b59455f3bfb5e237c97';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.http(domain, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
