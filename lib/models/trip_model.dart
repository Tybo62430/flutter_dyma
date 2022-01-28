import 'package:dyma_trip/models/activity_model.dart';
import 'package:flutter/widgets.dart';

class Trip {
  String id;
  String city;
  List<Activity> activities;
  DateTime? date;
  Trip({
    required this.city,
    required this.activities,
    this.date,
  }) : id = UniqueKey().toString();
}
