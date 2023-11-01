import 'package:flutter/material.dart';
import 'package:myschoolapp/model/lessons_model.dart';
import 'package:myschoolapp/product/customcard.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({super.key});

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC2D9FF),
      body: ListView.builder(
        itemCount: Gunler.values.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomKart(
              mainTitle: Gunler.values[index].name.toUpperCase(),
              backgroundColor: const Color(0xff8E8FFA),
              textColor: const Color(0xff190482),
              firstTitle: Gunler.values[index].dersdata().dersadi.toLowerCase(),
              firstSubtitle: Gunler.values[index].dersdata().ders_zamani,
              SecondTitle: Gunler.values[index]
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
