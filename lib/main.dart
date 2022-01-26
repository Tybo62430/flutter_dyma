// import 'package:dyma_trip/views/city/city_view.dart';
import 'package:dyma_trip/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      // home: CityView(),
    );
  }
}
