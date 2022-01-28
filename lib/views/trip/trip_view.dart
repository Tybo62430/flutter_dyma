import 'package:flutter/material.dart';
import 'package:dyma_trip/providers/city_provider.dart';
import 'package:dyma_trip/views/trip/widgets/trip_activities.dart';
import 'package:dyma_trip/views/trip/widgets/trip_city_bar.dart';
import 'package:provider/provider.dart';

import '../../models/city_model.dart';

class TripView extends StatelessWidget {
  static const String routeName = '/trip';

  const TripView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String cityName = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['cityName']!;
    final String tripId = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['tripId']!;
    final City city = Provider.of<CityProvider>(context, listen: false)
        .getCityByName(cityName);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TripCityBar(
                city: city,
              ),
              TripActivities(tripId: tripId)
            ],
          ),
        ),
      ),
    );
  }
}
