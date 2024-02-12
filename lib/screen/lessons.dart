// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:myschoolapp/product/color.dart';
// import 'package:myschoolapp/product/customcard.dart';
// import 'package:myschoolapp/core/model/lessons_model.dart';

// class LessonsView extends StatefulWidget {
//   const LessonsView({super.key});

//   @override
//   State<LessonsView> createState() => _LessonsViewState();
// }

// class _LessonsViewState extends State<LessonsView> {
//   final _mybox = Hive.box('myBox');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: renkler.backgroundColor,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _mybox.clear();
//           setState(() {});
//         },
//         child: const Icon(Icons.delete),
//       ),
//       appBar: AppBar(
//         backgroundColor: renkler.backgroundColor,
//         surfaceTintColor: renkler.backgroundColor,
//         title: const Text(
//           'Ders Programı',
//           style: TextStyle(color: renkler.textColor),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: daysOfWeek.values.length,
//         itemBuilder: (BuildContext context, int index) {
//           return CustomKart(
//               mainTitle: daysOfWeek.values[index].name.toUpperCase(),
//               firstTitle:
//                   daysOfWeek.values[index].dersdata().dersadi.toLowerCase(),
//               firstSubtitle: daysOfWeek.values[index].dersdata().ders_zamani,
//               secondTitle: daysOfWeek.values[index]
//                   .dersdata()
//                   .ikinci_ders_adi
//                   ?.toLowerCase(),
//               secondSubtitle:
//                   daysOfWeek.values[index].dersdata().ikinci_dersin_zamani);
//         },
//       ),
//     );
//   }
// }
