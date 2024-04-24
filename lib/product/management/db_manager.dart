import 'package:hive_flutter/hive_flutter.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';

// ignore: camel_case_types
class dbManager {
  static final mybox = Hive.box('myBox');

  void initializeBox(String key) async {
    for (var day in DaysOfWeek.values) {
      String dayString = "${day.toString().split('.').last}$key";
      if (mybox.get(dayString) == null) {
        await mybox.put(dayString, []);
      }
    }
  }
}
