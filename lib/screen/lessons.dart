import 'package:flutter/material.dart';
import 'package:myschoolapp/model/lessons_model.dart';
import 'package:myschoolapp/product/card.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({super.key});

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC2D9FF),
      body: ListView.builder(
        itemCount: Gunler.values.length,
        itemBuilder: (BuildContext context, int index) {
          return Kart(
              daytitle: Gunler.values[index].name.toUpperCase(),
              backgroundColor: Color(0xff8E8FFA),
              textColor: Color(0xff190482),
              derstitle: Gunler.values[index].dersdata().dersadi.toLowerCase(),
              timetitle: Gunler.values[index].dersdata().ders_zamani,
              derstitle2: Gunler.values[index]
                  .dersdata()
                  .ikinci_ders_adi
                  ?.toLowerCase(),
              timetitle2: Gunler.values[index].dersdata().ikinci_dersin_zamani);
        },
      ),
    );
  }
}
