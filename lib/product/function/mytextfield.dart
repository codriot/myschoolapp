import 'package:flutter/material.dart';

class LessonRow extends StatelessWidget {
  final TextEditingController lessonNameController;
  final TextEditingController lessonTimeController;
  const LessonRow(
      {super.key,
      required this.lessonNameController,
      required this.lessonTimeController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: TextField(
            controller: lessonNameController,
            decoration: const InputDecoration(
              hintText: 'Ders Adı',
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            controller: lessonTimeController,
            decoration: const InputDecoration(
              hintText: 'Ders Saati',
            ),
          ),
        ),
      ],
    );
  }
}
