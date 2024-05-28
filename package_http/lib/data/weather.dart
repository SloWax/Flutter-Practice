class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double preceived = 0;
  int pressure = 0;
  int humidit = 0;

  Weather(this.name, this.description, this.temperature, this.preceived,
      this.pressure, this.humidit);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    temperature = (weatherMap['main']['temp'] - 273.15);
    preceived = (weatherMap['main']['feels_like'] - 273.15);
    pressure = weatherMap['main']['pressure'];
    humidit = weatherMap['main']['humidity'];
    description = weatherMap['weather'][0]['main'];
  }
}
