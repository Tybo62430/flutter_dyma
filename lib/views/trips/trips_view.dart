import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';

  const TripsView({Key? key}) : super(key: key);

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Trips'),
      ),
    );
  }
}
