import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
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
          "10",
          style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
             Text(
          "km/h",
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
              width: 5,
              color: Colors.greenAccent,
            ),
          ],
        )
          ],
        ),
         Column(
          children: [
             Text(
          "Rain",
          style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
             Text(
          "2",
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
              width: 5,
              color: Colors.redAccent,
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
          "10",
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
              width: 5,
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
