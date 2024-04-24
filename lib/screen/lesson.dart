// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/product/widget/customcard.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';
import 'package:myschoolapp/product/management/db_manager.dart';
import 'package:myschoolapp/product/widget/lesson_dialog.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({super.key});

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  @override
  void initState() {
    super.initState();
    dbManager().initializeBox("ders");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async => lessonDialog(context, key: "ders"),
        child: const Icon(Icons.add),
      ),
      appBar: _myappbar(),
      body: const _MyBody(),
    );
  }

  AppBar _myappbar() {
    return AppBar(
      backgroundColor: renkler.backgroundColor,
      surfaceTintColor: renkler.backgroundColor,
      title: const Text(
        'Ders Programı',
        style: TextStyle(color: renkler.textColor),
      ),
      centerTitle: true,
    );
  }
}

class _MyBody extends StatelessWidget {
  const _MyBody();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dbManager.mybox.listenable(),
      builder: (context, Box box, _) {
        if (box.keys.isEmpty) {
          return const Text('Box is empty.');
        } else {
          return ListView.builder(
            itemCount: DaysOfWeek.values.length, // Doğru itemCount'u kullanın
            itemBuilder: (BuildContext context, int index) {
              if (box.keys.isNotEmpty) {
                String key = '${DaysOfWeek.values[index].name}ders';
                if (dbManager.mybox.get(key) == null) {
                  dbManager.mybox.put(key, []);
                }
                List lessons = List.from(dbManager.mybox.get(key));
                return CustomKart(
                  mainTitle: DaysOfWeek.values[index].name.toUpperCase(),
                  lessons: lessons,
                );
              } else {
                return const Text('Key not found');
              }
            },
          );
        }
      },
    );
  }
}
