import 'package:dyma_trip/models/trip_model.dart';
import 'package:dyma_trip/views/404/not_found.dart';
import 'package:dyma_trip/views/trips/trips_view.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/views/city/city_view.dart';
import 'package:dyma_trip/views/home/home_view.dart';
import './datas/data.dart' as data;
import 'models/city_model.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;
  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  List<Trip> trips = [
    Trip(
        city: 'Paris',
        activities: [],
        date: DateTime.now().add(const Duration(days: 1))),
    Trip(
        city: 'Lyon',
        activities: [],
        date: DateTime.now().add(const Duration(days: 2))),
    Trip(
        city: 'Nice',
        activities: [],
        date: DateTime.now().subtract(const Duration(days: 1))),
  ];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeView(cities: widget.cities),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName:
            return MaterialPageRoute(
              builder: (context) {
                final City city = settings.arguments as City;
                return CityView(city: city, addTrip: addTrip);
              },
            );
          case TripsView.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return TripsView(trips: trips);
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
