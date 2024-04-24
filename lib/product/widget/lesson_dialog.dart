import 'package:flutter/material.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';
import 'package:myschoolapp/product/function/mytextfield.dart';
import 'package:myschoolapp/product/management/db_manager.dart';

Future<dynamic> lessonDialog(BuildContext context, {required String key}) {
  return showDialog(
    context: context,
    builder: (context) {
      String? selectedDay;
      List<LessonRow> rows = [
        LessonRow(
            lessonNameController: TextEditingController(),
            lessonTimeController: TextEditingController())
      ];

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
                        value: "${value.name}$key",
                        child: Text(value.name),
                      );
                    }).toList()),
                ...rows,
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rows.add(
                        LessonRow(
                          lessonNameController: TextEditingController(),
                          lessonTimeController: TextEditingController(),
                        ),
                      );
                    });
                  },
                  child: const Text('Ders Ekle'),
                ),
              ]),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await dbManager.mybox.delete(selectedDay);
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
                  await dbManager.mybox.put(selectedDay, ders);
                  setState(() {});
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
