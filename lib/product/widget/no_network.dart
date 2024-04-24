import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myschoolapp/product/color.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: renkler.backgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/no_connection.json"),
          const Text(
            "Bağlantı Yok",
            style: TextStyle(
              fontSize: 24,
              color: renkler.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
