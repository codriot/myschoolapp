import 'package:flutter/material.dart';
import 'package:myschoolapp/product/color.dart';

class CustomKart extends StatelessWidget {
  final String? mainTitle;
  final List? lessons;
  final Color backgroundColor;
  final Color textColor;

  const CustomKart({
    super.key,
    this.mainTitle,
    this.lessons,
    this.backgroundColor = renkler.cardColor,
    this.textColor = renkler.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return lessons == null || lessons!.isEmpty
        ? const SizedBox()
        : Padding(
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
              child: Column(
                children: [
                  Text(mainTitle ?? "-",
                      style: TextStyle(color: textColor, fontSize: 18.0)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lessons?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lessons?[index][0] ?? "-",
                              style:
                                  TextStyle(color: textColor, fontSize: 14.0)),
                          Text(lessons?[index][1] ?? "-",
                              style:
                                  TextStyle(color: textColor, fontSize: 14.0)),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
