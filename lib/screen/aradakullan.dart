import 'package:flutter/material.dart';

class aradakullan extends StatefulWidget {
  const aradakullan({super.key});

  @override
  State<aradakullan> createState() => _aradakullanState();
}

class _aradakullanState extends State<aradakullan> {
  List<TextField> textFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...textFields,
          ElevatedButton(
            onPressed: () {
              setState(() {
                textFields.add(TextField());
              });
            },
            child: const Text('Yeni Textfield Ekle'),
          ),
        ],
      ),
    );
  }
}
