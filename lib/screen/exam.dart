import 'package:flutter/material.dart';
import 'package:myschoolapp/core/model/exam_model.dart';
import 'package:myschoolapp/product/color.dart';

class ExamView extends StatelessWidget {
  ExamView({super.key});
  final List<ExamDate> examDates = [
    ExamDate(exam: 'PAZARTESİ', renk: renkler.backgroundColor),
    ExamDate(exam: 'veri tabanı', time: '11:00', place: 'M9301-9305'),
    ExamDate(exam: 'SALI', renk: renkler.backgroundColor),
    ExamDate(exam: 'bilgisayar ağları', time: '09:00', place: 'amfi'),
    ExamDate(exam: 'ÇARŞAMBA', renk: renkler.backgroundColor),
    ExamDate(exam: "pyhton", time: '09.30', place: 'amfi'),
    ExamDate(exam: "biçimsel diller", time: '13.00', place: 'amfi'),
    ExamDate(exam: 'PERŞEMBE', renk: renkler.backgroundColor),
    ExamDate(exam: "diferansiyel denklemler", time: '11.00', place: 'amfi'),
    ExamDate(exam: "iş sağlığı", time: '14.30', place: 'M9301-9305'),
    ExamDate(
        exam: "bilgisayar organizasyonu", time: '16.00', place: 'M9301-9305'),
    ExamDate(exam: 'CUMA', renk: renkler.backgroundColor),
    ExamDate(exam: "Ekoloji", time: '15.00', place: 'bilinmiyor'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      appBar: AppBar(
        backgroundColor: renkler.backgroundColor,
        surfaceTintColor: renkler.backgroundColor,
        title: const Text(
          'Sınav Programı',
          style: TextStyle(color: renkler.textColor),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: examDates.length,
        itemBuilder: (BuildContext context, int index) {
          return examDates[index].renk == renkler.backgroundColor
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    examDates[index].exam,
                    style: const TextStyle(
                        color: renkler.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Card(
                  color: renkler.cardColor,
                  child: ListTile(
                    title: Text(
                      examDates[index].exam,
                      style: const TextStyle(
                        color: renkler.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      examDates[index].time ?? '',
                      style: const TextStyle(
                        color: renkler.textColor,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      examDates[index].place ?? '',
                      style: const TextStyle(
                        color: renkler.textColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
