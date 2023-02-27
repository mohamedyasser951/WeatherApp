import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/business_login/bloc.dart';
import 'package:weather_app/presentation_layer/widgets/search_item.dart';
import 'package:weather_app/presentation_layer/widgets/single_weather_widget.dart';
import 'package:weather_app/repository/weather_repo/weather_repo.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var isNight = DateFormat.jm().format(DateTime.now()).endsWith("PM");
    return BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
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
                    return const Center(
                      child: Text(
                        "Search For a City",
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
