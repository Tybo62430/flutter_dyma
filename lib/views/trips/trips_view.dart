import 'package:dyma_trip/models/trip_model.dart';
import 'package:dyma_trip/providers/trip_provider.dart';
import 'package:dyma_trip/views/trips/widgets/trip_list.dart';
import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsView extends StatelessWidget {
  static const String routeName = '/trips';
  const TripsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Trip> trips = Provider.of<TripProvider>(context).trips;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mes voyages'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'A venir',
              ),
              Tab(
                text: 'Passé',
              ),
            ],
          ),
        ),
        drawer: const DymaDrawer(),
        body: TabBarView(
          children: [
            TripList(
              trips: trips
                  .where((trip) => DateTime.now().isBefore(trip.date!))
                  .toList(),
            ),
            TripList(
              trips: trips
                  .where((trip) => DateTime.now().isAfter(trip.date!))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
