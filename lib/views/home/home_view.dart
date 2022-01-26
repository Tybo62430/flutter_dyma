import 'package:dyma_trip/models/city_model.dart';
import 'package:flutter/material.dart';

import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<City> cities = [
    City(name: 'Paris', image: 'assets/images/paris.jpeg'),
    City(name: 'Lyon', image: 'assets/images/lyon.jpeg'),
    City(name: 'Nice', image: 'assets/images/nice.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Dyma Trip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cities.map((city) => CityCard(city: city)).toList(),
        ),
      ),
    );
  }
}
