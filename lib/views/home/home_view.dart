import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/models/city_model.dart';

import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  late List<City> cities;

  HomeView({required this.cities});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    widget.cities.map((city) => print(city));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dyma Trip'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.cities.map((city) => CityCard(city: city)).toList(),
        ),
      ),
    );
  }
}
