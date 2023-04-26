import 'package:flutter/material.dart';
import 'package:weather_app/business_login/bloc.dart';
import 'package:weather_app/business_login/events.dart';

class SearchItem extends StatelessWidget {
 final TextEditingController searchController = TextEditingController();


  SearchItem({
    super.key,
    required this.mybloc,
  });

  final WeatherBloc mybloc;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.only(
        top: 60,
        right: 0,
        left: 0,
      ),
      child: TextField(
        controller: searchController,
        onChanged: (value) {},
        style: const TextStyle(
          color: Colors.white,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          mybloc.add(GetWeatherEvent(city: searchController.text.trim()));
        },
        decoration: InputDecoration(
          suffix: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
