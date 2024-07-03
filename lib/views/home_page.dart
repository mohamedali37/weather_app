import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_weatherview.dart';
import 'package:weather_app/widgets/no_weahter.dart';
import 'package:weather_app/widgets/weather_build.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchWeather();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoadedState) {
          return WeatherBuild(
            weatherModel: state.weatherModel,
          );
        } else if (state is WeatherFailureState) {
          return Center(child: Text(state.err.toString()));
        } else {
          return const NoWeather();
        }
      }),
    );
  }
}
