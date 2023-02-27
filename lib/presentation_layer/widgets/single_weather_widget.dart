import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/presentation_layer/widgets/bottom_widget.dart';
import 'package:weather_app/repository/models/weather_model.dart';

class SingleWetherWidget extends StatelessWidget {
 final WeatherModel model;

  const SingleWetherWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
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
                    const SizedBox(
                      height: 100.0,
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
                    Text(
                      "wend 22/44 12 am",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${(model.main!.temp!-273.15).ceilToDouble()} \u2103",
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
                          "assets/images/moon.svg",
                          width: 38,
                          height: 38,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Night",
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
