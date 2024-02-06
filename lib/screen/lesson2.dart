import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/product/customcard.dart';
import 'package:myschoolapp/core/model/lessons_model.dart';

class LessonsView2 extends StatefulWidget {
  const LessonsView2({super.key});

  @override
  State<LessonsView2> createState() => _LessonsView2State();
}

class _LessonsView2State extends State<LessonsView2> {
  String? selectedDay;
  List<TextField> textFields = [];
  final _mybox = Hive.box('myBox');
  void updatelist() {
    List<Widget> rows = [
      const Row(
        children: [
          Expanded(
            flex: 7,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ders Adı',
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ders Saati',
              ),
            ),
          ),
        ],
      ),
    ];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Ders Programı'),
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
                      items: daysOfWeek.values
                          .map<DropdownMenuItem<String>>((daysOfWeek value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList()),
                  ...rows,
                ]),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rows.add(
                        const Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Ders Adı',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Ders Saati',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                  child: const Text('Ders Ekle'),
                ),
                TextButton(
                  onPressed: () {
                    // Bilgileri kaydet ve dialogu kapat
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updatelist();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      appBar: _myappbar(),
      body: ListView.builder(
        itemCount: daysOfWeek.values.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomKart(
              mainTitle: daysOfWeek.values[index].name.toUpperCase(),
              firstTitle:
                  daysOfWeek.values[index].dersdata().dersadi.toLowerCase(),
              firstSubtitle: daysOfWeek.values[index].dersdata().ders_zamani,
              secondTitle: daysOfWeek.values[index]
                  .dersdata()
                  .ikinci_ders_adi
                  ?.toLowerCase(),
              secondSubtitle:
                  daysOfWeek.values[index].dersdata().ikinci_dersin_zamani);
        },
      ),
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
