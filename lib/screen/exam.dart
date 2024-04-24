// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/product/widget/customcard.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';
import 'package:myschoolapp/product/management/db_manager.dart';
import 'package:myschoolapp/product/widget/lesson_dialog.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});
  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  @override
  void initState() {
    super.initState();
    dbManager().initializeBox("Sınav");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async => lessonDialog(context, key: "Sınav"),
        child: const Icon(Icons.add),
      ),
      appBar: _myappbar(),
      body: const _BuildBody(),
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

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dbManager.mybox.listenable(),
      builder: (context, Box box, _) {
        if (box.keys.isEmpty) {
          return const Text('Box is empty.');
        } else {
          return _buildListview(box);
        }
      },
    );
  }

  ListView _buildListview(Box<dynamic> box) {
    return ListView.builder(
      itemCount: DaysOfWeek.values.length,
      itemBuilder: (BuildContext context, int index) {
        if (box.keys.isNotEmpty) {
          String key = "${DaysOfWeek.values[index].name}Sınav";
          List lessons = List.from(dbManager.mybox.get(key) ?? []);
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
}
