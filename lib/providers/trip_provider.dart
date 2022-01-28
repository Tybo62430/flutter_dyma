import 'dart:collection';

import 'package:dyma_trip/models/activity_model.dart';
import 'package:dyma_trip/models/trip_model.dart';
import 'package:flutter/widgets.dart';
import '../datas/data.dart' as data;

class TripProvider extends ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  Trip getById(String tripId) {
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}
