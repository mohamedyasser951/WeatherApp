// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/business_login/bloc.dart';
import 'package:weather_app/presentation_layer/widgets/bottom_widget.dart';
import 'package:weather_app/presentation_layer/widgets/search_item.dart';
import 'package:weather_app/repository/models/weather_model.dart';

class SingleWetherWidget extends StatelessWidget {
  final WeatherModel model;

  const SingleWetherWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isNight = DateFormat.jm().format(DateTime.now()).endsWith("PM");
          final mybloc = BlocProvider.of<WeatherBloc>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchItem(mybloc: mybloc),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      model.name!,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          model.weather![0].description!,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          child: SvgPicture.asset(
                            "assets/images/cloudy.svg",
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${(model.main!.temp!).ceil()}\u2103",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 85,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          isNight
                              ? "assets/images/moon.svg"
                              : "assets/images/sun.svg",
                          width: 38,
                          height: 38,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          isNight ? "Night" : "Morning",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white30)),
              ),
              BottomWidgets(model: model),
            ],
          ),
        ],
      ),
    );
  }
}
