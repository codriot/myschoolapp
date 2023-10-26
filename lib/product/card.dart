import 'package:flutter/material.dart';

/*
TODO:  DÜZENELENEBİLİRLER
Kartın arka plan rengini değiştirin.
Kartın kenarlarını yuvarlatın.
Kartın köşelerine gölgeler ekleyin.
Kartın içeriğini daha fazla düzenleyin.
*/
class Kart extends StatelessWidget {
  final String daytitle;
  final String derstitle;
  final String timetitle;
  final String? derstitle2;
  final String? timetitle2;
  final Color backgroundColor;
  final Color textColor;

  const Kart(
      {super.key,
      required this.daytitle,
      required this.derstitle,
      required this.timetitle,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.derstitle2,
      this.timetitle2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(daytitle,
                    style: TextStyle(color: textColor, fontSize: 18.0)),
                Text(derstitle,
                    style: TextStyle(color: textColor, fontSize: 14.0)),
                Text(timetitle,
                    style: TextStyle(color: textColor, fontSize: 14.0)),
                derstitle2 != null
                    ? Text(derstitle2!,
                        style: TextStyle(color: textColor, fontSize: 14.0))
                    : const Text("-"),
                timetitle2 != null
                    ? Text(timetitle2!,
                        style: TextStyle(color: textColor, fontSize: 14.0))
                    : const Text("-"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
