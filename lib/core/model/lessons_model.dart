import 'package:flutter/material.dart';

enum DaysOfWeek {
  pazartesi,
  sali,
  carsamba,
  persembe,
  cuma,
}

class ExamDate {
  final String exam;
  final String? time;
  final String? place;
  final Color? renk;

  ExamDate({required this.exam, this.time, this.place, this.renk});
}
