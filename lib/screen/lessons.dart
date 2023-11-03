import 'package:flutter/material.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/product/customcard.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({super.key});

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      appBar: AppBar(
        backgroundColor: renkler.backgroundColor,
        surfaceTintColor: renkler.backgroundColor,
        title: const Text(
          'Ders Programı',
          style: TextStyle(color: renkler.textColor),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Gunler.values.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomKart(
              mainTitle: Gunler.values[index].name.toUpperCase(),
              firstTitle: Gunler.values[index].dersdata().dersadi.toLowerCase(),
              firstSubtitle: Gunler.values[index].dersdata().ders_zamani,
              secondTitle: Gunler.values[index]
                  .dersdata()
                  .ikinci_ders_adi
                  ?.toLowerCase(),
              secondSubtitle:
                  Gunler.values[index].dersdata().ikinci_dersin_zamani);
        },
      ),
    );
  }
}
