import "package:flutter/material.dart";
import "package:package_http/data/http_helper.dart";
import "package:package_http/data/weather.dart";
// import 'package:package_http/data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('날씨')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: '도시 입력',
                  suffixIcon: IconButton(
                      onPressed: getWeatherData, icon: const Icon(Icons.search)),
                ),
              ),
            ),
            weatherRow('장소', result.name),
            weatherRow('날씨', result.description),
            weatherRow('온도', result.temperature.toStringAsFixed(2)),
            weatherRow('체감', result.preceived.toStringAsFixed(2)),
            weatherRow('기압', result.pressure.toString()),
            weatherRow('습도', result.humidit.toString())
          ],
        ),
      ),
    );
  }

  void getWeatherData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('seoul');
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 3,
              child: Text(
                value,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              ))
        ],
      ),
    );
    return row;
  }
}
