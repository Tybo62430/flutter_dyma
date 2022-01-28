import 'package:flutter/material.dart';
import 'package:dyma_trip/models/activity_model.dart';
import 'package:dyma_trip/models/trip_model.dart';
import 'package:dyma_trip/providers/trip_provider.dart';
import 'package:provider/provider.dart';

class TripActivityList extends StatelessWidget {
  final String tripId;
  final ActivityStatus filter;

  const TripActivityList({Key? key, required this.tripId, required this.filter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Trip trip = Provider.of<TripProvider>(context).getById(tripId);
    final List<Activity> activities =
        trip.activities.where((activity) => activity.status == filter).toList();
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) {
        final Activity activity = activities[i];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: filter == ActivityStatus.ongoing
              ? Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent[700],
                    ),
                  ),
                  key: ValueKey(activity.id),
                  child: Card(
                    child: ListTile(
                      title: Text(activity.name),
                    ),
                  ),
                  onDismissed: (_) =>
                      Provider.of<TripProvider>(context, listen: false)
                          .setActivityToDone(activity),
                )
              : Card(
                  child: ListTile(
                    title: Text(
                      activity.name,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
