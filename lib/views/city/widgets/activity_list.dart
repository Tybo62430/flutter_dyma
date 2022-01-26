import 'package:dyma_trip/models/activity_model.dart';
import 'package:dyma_trip/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<String> selectedActivities;
  final Function toggleActivity;

  const ActivityList(
      {Key? key,
      required this.activities,
      required this.selectedActivities,
      required this.toggleActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: activities
          .map((activity) => ActivityCard(
                activity: activity,
                isSelected: selectedActivities.contains(activity.id),
                toggleActivity: () {
                  toggleActivity(activity.id);
                },
              ))
          .toList(),
    );
  }
}
