import 'package:dyma_trip/providers/city_provider.dart';
import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/models/city_model.dart';
import 'package:provider/provider.dart';

import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dyma Trip'),
      ),
      drawer: const DymaDrawer(),
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
