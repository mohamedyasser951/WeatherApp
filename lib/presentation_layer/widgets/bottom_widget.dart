import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/repository/models/weather_model.dart';

class BottomWidgets extends StatelessWidget {
  final WeatherModel model;

  const BottomWidgets({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Wind",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${model.wind!.speed!.roundToDouble()}",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "m/s",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  color: Colors.white38,
                ),
                Container(
                  height: 5,
                  width: model.wind!.speed!.roundToDouble(),
                  color: Colors.greenAccent,
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Text(
              "Visibility",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              (model.visibility! / 1000).toString(),
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "km",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  color: Colors.white38,
                ),
                Container(
                  height: 5,
                  width: model.visibility! / 1000,
                  color: Colors.yellowAccent,
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Text(
              "Humidity",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${model.main!.humidity!}",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "%",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  color: Colors.white38,
                ),
                Container(
                  height: 5,
                  width: model.main!.humidity!.toDouble() / 2,
                  color: Colors.redAccent,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
