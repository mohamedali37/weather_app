import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService
{
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3a15c959af1e4413869151659240406';
  WeatherService(this.dio);

Future<WeatherModel> getWeather({required String cityName}) async {
  try {
  var response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
  //if(response.statusCode == 201)
  //{
    WeatherModel weatherService = WeatherModel.fromjson(response.data);
    return weatherService;
} on DioException catch (e) {
  final String errorMsg = e.response?.data['error']['message'] ?? 'Opps! there was an error, try later';
  throw Exception(errorMsg);
}catch (e){
  throw Exception('try later');
}
  //}
  /*else{
    String errorMsg = response.data['error']['message'];
    throw Exception(errorMsg); 
  } */
}
}