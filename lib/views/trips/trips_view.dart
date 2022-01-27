import 'package:dyma_trip/models/trip_model.dart';
import 'package:dyma_trip/views/trips/widgets/trip_list.dart';
import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';
  final List<Trip> trips;

  const TripsView({required this.trips, Key? key}) : super(key: key);

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
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
              trips: widget.trips
                  .where((trip) => DateTime.now().isBefore(trip.date!))
                  .toList(),
            ),
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isAfter(trip.date!))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
