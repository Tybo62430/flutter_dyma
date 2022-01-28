import 'package:flutter/material.dart';
import 'package:dyma_trip/models/activity_model.dart';
import 'package:dyma_trip/views/trip/widgets/trip_activity_list.dart';

class TripActivities extends StatelessWidget {
  final String tripId;

  const TripActivities({Key? key, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                indicatorColor: Colors.blue[100],
                tabs: const <Widget>[
                  Tab(
                    text: 'En cours',
                  ),
                  Tab(
                    text: 'Terminées',
                  )
                ],
              ),
            ),
            Container(
              height: 600,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  TripActivityList(
                    tripId: tripId,
                    filter: ActivityStatus.ongoing,
                  ),
                  TripActivityList(
                    tripId: tripId,
                    filter: ActivityStatus.done,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
