import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Search City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            //enabled: false,
            onSubmitted: (value) {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(value: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              hintText: 'Enter City Name',
              labelText: 'Search',
              //prefixIcon: const Icon(Icons.search),
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              border: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              /*disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green
                )
              )*/
              /*enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),*/
            ),
          ),
        ),
      ),
    );
  }
}
