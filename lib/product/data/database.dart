import 'package:hive_flutter/hive_flutter.dart';

class ListDatabase {
  final _lesson = [];
  final _mybox = Hive.box('myBox');
  //ders eklemem,güncellemem lazım

//

  void lessonupdate({Map<String, dynamic>? params}) {
    if (params != null) {
      params.forEach((key, value) {
        _mybox.put(key, _lesson);
        _lesson.add(value);
        _lesson.clear();
      });
    }
  }

// void main() {
//   myFunction(params: {
//     'param1': 'value1',
//     'param2': 'value2',
//     'param3': 'value3',
//   });
// }
}
