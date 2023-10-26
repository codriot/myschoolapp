import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({Key? key}) : super(key: key);

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  _exportToExcel() {
    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.setColWidth(2, 50);
    sheet.setColAutoFit(3);

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3)).value =
        'Text string';

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 4)).value =
        'Text string Text string Text string Text string Text string Text string Text string Text string';

    excel.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export to Excel'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: _exportToExcel, child: const Text('Export')),
      ),
    );
  }
}
