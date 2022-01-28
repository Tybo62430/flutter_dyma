import 'package:dyma_trip/models/trip_model.dart';
import 'package:dyma_trip/providers/city_provider.dart';
import 'package:dyma_trip/providers/trip_provider.dart';
import 'package:dyma_trip/views/404/not_found.dart';
import 'package:dyma_trip/views/trip/trip_view.dart';
import 'package:dyma_trip/views/trips/trips_view.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/views/city/city_view.dart';
import 'package:dyma_trip/views/home/home_view.dart';
import 'package:provider/provider.dart';
import './datas/data.dart' as data;
import 'models/city_model.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;
  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  // void addTrip(Trip trip) {
  //   setState(() {
  //     trips.add(trip);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (_) => HomeView(),
            CityView.routeName: (_) => CityView(),
            TripsView.routeName: (_) => const TripsView(),
            TripView.routeName: (_) => TripView(),
          },
          onUnknownRoute: (_) =>
              MaterialPageRoute(builder: (_) => const NotFoud())),
    );
  }
}
