import 'dart:collection';

import 'package:dyma_trip/models/city_model.dart';
import 'package:flutter/widgets.dart';
import '../datas/data.dart' as data;

class CityProvider extends ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);
}
