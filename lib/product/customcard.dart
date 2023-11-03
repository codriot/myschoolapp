import 'package:flutter/material.dart';
import 'package:myschoolapp/product/color.dart';

/*
TODO:  DÜZENELENEBİLİRLER
Kartın arka plan rengini değiştirin.
Kartın kenarlarını yuvarlatın.
Kartın köşelerine gölgeler ekleyin.
Kartın içeriğini daha fazla düzenleyin.
*/
class CustomKart extends StatelessWidget {
  final String mainTitle;
  final String firstTitle;
  final String firstSubtitle;
  final String? secondTitle;
  final String? secondSubtitle;
  final Color backgroundColor;
  final Color textColor;

  const CustomKart(
      {super.key,
      required this.mainTitle,
      required this.firstTitle,
      required this.firstSubtitle,
      this.backgroundColor = renkler.cardColor,
      this.textColor = renkler.textColor,
      this.secondTitle,
      this.secondSubtitle});

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
                Text(mainTitle,
                    style: TextStyle(color: textColor, fontSize: 18.0)),
                Text(firstTitle,
                    style: TextStyle(color: textColor, fontSize: 14.0)),
                Text(firstSubtitle,
                    style: TextStyle(color: textColor, fontSize: 14.0)),
                secondTitle != null
                    ? Text(secondTitle!,
                        style: TextStyle(color: textColor, fontSize: 14.0))
                    : const Text("-"),
                secondSubtitle != null
                    ? Text(secondSubtitle!,
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
