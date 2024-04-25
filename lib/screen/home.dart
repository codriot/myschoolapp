import 'package:flutter/material.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/screen/universityobs.dart';
import 'package:myschoolapp/screen/universityweb.dart';
import 'package:myschoolapp/screen/web_view_controller.dart';
import 'package:myschoolapp/screen/cafeteria.dart';
import 'package:myschoolapp/screen/exam.dart';
import 'package:myschoolapp/screen/lesson.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  //TODO: uniweb and obsweb is same code. I will refactor this code. (I will create a new class for webview)
  final List _page = [
    const LessonsView(),
    const ExamView(),
    const YemekhaneWebScrapping(),
    const UniWeb(),

    const ObsWeb(),
    // const MyWebview(
    //     link: "https://obs.balikesir.edu.tr/oibs/ogrenci/login.aspx",
    //     title: "Obs Ekranı")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[selectedindex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: renkler.bottombarColor,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          currentIndex: selectedindex,
          duration: const Duration(milliseconds: 400),
          onTap: (i) => setState(() => selectedindex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.school_rounded),
              title: const Text("Ders"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.draw_rounded),
              title: const Text("Sınav"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.food_bank_rounded),
              title: const Text("Yemekhane"),
            ),
            SalomonBottomBarItem(
                icon: const Icon(Icons.web), title: const Text("Web")),
            SalomonBottomBarItem(
                icon: const Icon(Icons.person), title: const Text("Obs"))
          ]),
    );
  }
}
