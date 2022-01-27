import 'package:dyma_trip/models/activity_model.dart';
import 'package:flutter/widgets.dart';
import '../datas/data.dart' as data;

// class Data extends InheritedWidget {
//   final List<Activity> activities = data.activities;

//   Data({Key? key, required Widget child}) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }

//   static of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<Data>();
//   }
// }

class Data extends InheritedWidget {
  // final List<Activity> activities = data.cities;

  Data({Key? key, required Widget child}) : super(key: key, child: child);

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }

  @override
  bool updateShouldNotify(Data old) => true;
}
