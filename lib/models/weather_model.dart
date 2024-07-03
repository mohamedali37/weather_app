class WeatherModel {
  final String city;
  final DateTime date;
  final String image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherStatus;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherStatus});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated'],),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
