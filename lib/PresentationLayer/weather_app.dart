import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/BusinessLogicLayer/bloc.dart';
import 'package:weather_app/BusinessLogicLayer/events.dart';
import 'package:weather_app/BusinessLogicLayer/states.dart';
import 'package:weather_app/PresentationLayer/widgets/search_item.dart';
import 'package:weather_app/PresentationLayer/widgets/single_weather_widget.dart';
import 'package:weather_app/DataLayer/weather_repo/weather_repo.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var isNight = DateFormat.jm().format(DateTime.now()).endsWith("PM");
    return BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepo())
          ..add(GetWeatherByLocationEvent()),
        child: Builder(builder: (context) {
          final mybloc = BlocProvider.of<WeatherBloc>(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black26,
            extendBodyBehindAppBar: true,
            body: Stack(children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(isNight
                            ? "assets/images/night.jpg"
                            : "assets/images/sunny.jpg"))),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.black38),
              ),

              SearchItem(mybloc: mybloc),
              
              BlocBuilder<WeatherBloc, WeatherStates>(
                builder: (context, state) {
                  if (state is WeatherIntialState) {
                    return Container();
                  }
                  if (state is WeatherLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is WeatherSuccessState) {
                    return SingleWetherWidget(
                      model: state.weatherModel,
                    );
                  } else if (state is WeatherIsNotSearchState) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SearchItem(mybloc: mybloc),
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      "OOPS Something Wrong !",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              )
            ]),
          );
        }));
  }
}
