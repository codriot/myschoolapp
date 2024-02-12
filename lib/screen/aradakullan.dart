import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class aradakullan extends StatefulWidget {
  const aradakullan({super.key});

  @override
  State<aradakullan> createState() => _aradakullanState();
}

class _aradakullanState extends State<aradakullan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(
      onPressed: () async {
        var box = await Hive.openBox('myBox');
        await box.put('pazartesi', ["pazartesi", "ders1"]);
        await box.put('salı', ["ders2", "11"]);
        await box.put('çarşamba', ["ders3", "12"]);
        await box.put('perşembe', ["ders4", "13"]);
        await box.put('cuma', ["ders5", "14"]);

        print(box.get('pazartesi'));
        await box.close();
      },
      child: Text('Add to box'),
    ));
  }
}
