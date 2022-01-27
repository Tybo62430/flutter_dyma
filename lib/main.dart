import 'package:dyma_trip/views/404/not_found.dart';
import 'package:dyma_trip/views/trips/trips_view.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/views/city/city_view.dart';
import 'package:dyma_trip/views/home/home_view.dart';

import 'models/city_model.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName:
            return MaterialPageRoute(
              builder: (context) {
                final City city = settings.arguments as City;
                return CityView(city: city);
              },
            );
          case TripsView.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return const TripsView();
              },
            );
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const NotFoud();
          },
        );
      },
    );
  }
}
