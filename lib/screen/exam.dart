// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/product/customcard.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';
import 'package:myschoolapp/product/function/mytextfield.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  final _mybox = Hive.box('myBox');
  @override
  void initState() {
    super.initState();
    _initializeBox();
  }

  void _initializeBox() async {
    for (var day in DaysOfWeek.values) {
      String dayString = "${day.toString().split('.').last}Sınav";
      if (_mybox.get(dayString) == null) {
        await _mybox.put(dayString, [
          ['ders1', '12:00']
        ]);
      }
    }
  }

  String? selectedDay;
  void updatelist() {
    List<LessonRow> rows = [
      LessonRow(
          lessonNameController: TextEditingController(),
          lessonTimeController: TextEditingController())
    ];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Sınav Programı'),
              content: SingleChildScrollView(
                child: Column(children: [
                  DropdownButton<String>(
                      hint: const Text('Gün'),
                      value: selectedDay,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue;
                        });
                      },
                      items: DaysOfWeek.values
                          .map<DropdownMenuItem<String>>((DaysOfWeek value) {
                        return DropdownMenuItem<String>(
                          value: "${value.name}Sınav",
                          child: Text(value.name),
                        );
                      }).toList()),
                  ...rows,
                ]),
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      await _mybox.put(selectedDay, []);
                    },
                    child: const Text(
                      "Sil",
                    )),
                TextButton(
                  onPressed: () async {
                    List ders = [];
                    for (var i = 0; i < rows.length; i++) {
                      String name = rows[i].lessonNameController.text;
                      String time = rows[i].lessonTimeController.text;
                      if (name.isEmpty || time.isEmpty) {
                        continue;
                      }
                      ders.add([name, time]);
                      print('Ders Adı: $name, Ders Saati: $time');
                    }
                    // Bilgileri kaydet ve dialogu kapat
                    await _mybox.put(selectedDay, ders);
                    setState(() {});
                    print(_mybox.get(selectedDay));
                    Navigator.pop(context);
                  },
                  child: const Text('Kaydet'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updatelist();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      appBar: _myappbar(),
      body: ValueListenableBuilder(
        valueListenable: _mybox.listenable(),
        builder: (context, Box box, _) {
          if (box.keys.isEmpty) {
            return const Text('Box is empty.');
          } else {
            return ListView.builder(
              itemCount: DaysOfWeek.values.length, // Doğru itemCount'u kullanın
              itemBuilder: (BuildContext context, int index) {
                if (box.keys.isNotEmpty) {
                  print(box.keys);
                  // Kontrol eklendi
                  String key = "${DaysOfWeek.values[index].name}Sınav";
                  List lessons = List.from(_mybox.get(key));
                  return CustomKart(
                    mainTitle: DaysOfWeek.values[index].name.toUpperCase(),
                    lessons: lessons,
                  );
                } else {
                  return const Text(
                      'Key not found'); // Boş liste durumunu işleyin
                }
              },
            );
          }
        },
      ),
    );
  }

  AppBar _myappbar() {
    return AppBar(
      backgroundColor: renkler.backgroundColor,
      surfaceTintColor: renkler.backgroundColor,
      title: const Text(
        'Sınav Programı',
        style: TextStyle(color: renkler.textColor),
      ),
      centerTitle: true,
    );
  }
}
