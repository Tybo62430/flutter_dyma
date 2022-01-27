import 'dart:math';

import 'package:dyma_trip/models/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  getColor() {
    const colors = [Colors.blue, Colors.red];
    return colors[Random().nextInt(2)];
  }

  const TripActivityCard(
      {required this.activity, required this.deleteTripActivity, Key? key})
      : super(key: key);

  @override
  _TripActivityCardState createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  late Color color;

  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(
          widget.activity.name,
        ),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            widget.deleteTripActivity(widget.activity.id);
            Scaffold.of(context).showSnackBar(
              const SnackBar(
                content: Text('Activité supprimer'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
