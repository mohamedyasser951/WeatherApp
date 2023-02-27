import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/business_login/bloc.dart';
import 'package:weather_app/presentation_layer/widgets/single_dotindicator.dart';
import 'package:weather_app/presentation_layer/widgets/single_weather_widget.dart';
import 'package:weather_app/repository/api_helper/weather_repo.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
        child: Builder(builder: (context) {
          final mybloc = BlocProvider.of<WeatherBloc>(context);

          return Scaffold(
            backgroundColor: Colors.black26,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () async {
                    mybloc.add(GetWeatherEvent(city: "egypt"));
              
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  )),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.asset(
                    "assets/images/menu.svg",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Stack(children: [
              // Container(
              //   height: double.infinity,
              //   width: double.infinity,
              //   decoration: const BoxDecoration(
              //       image: DecorationImage(
              //           fit: BoxFit.cover,
              //           image: AssetImage("assets/images/night.jpg"))),
              // ),
              // Container(
              //   decoration: const BoxDecoration(color: Colors.black38),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 110, left: 20),
              //   child: Row(
              //     children: const [
              //       SingleDotIndicator(),
              //     ],
              //   ),
              // ),

              BlocBuilder<WeatherBloc, WeatherStates>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherSuccessState) {
                   return  SingleWetherWidget(model: state.weatherModel,);
                  } else if (state is WeatherIsNotSearchState) {
                    return const Center(
                      child: Text("0000000000000000"),
                    );
                  }
                  return Text("erroe state");
                },
              )

              // TransformerPageView(
              //   itemCount: 5,
              //   itemBuilder: (context, index) => const SingleWetherWidget(),
              // )
            ]),
          );
        }));
  }
}
