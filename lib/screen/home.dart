// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:myschoolapp/screen/cafeteria.dart';
import 'package:myschoolapp/screen/exam.dart';
import 'package:myschoolapp/screen/lesson2.dart';
import 'package:myschoolapp/screen/lessons.dart';
import 'package:myschoolapp/screen/universityobs.dart';
import 'package:myschoolapp/screen/universityweb.dart';

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

  final List _page = [
    LessonsView2(),
    ExamView(),
    YemekhaneWebScrapping(),
    UniWeb(),
    ObsWeb()
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
          duration: Duration(milliseconds: 400),
          onTap: (i) => setState(() => selectedindex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.school_rounded),
              title: Text("Ders"),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.draw_rounded),
              title: Text("Sınav"),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.food_bank_rounded),
              title: Text("Yemekhane"),
            ),
            SalomonBottomBarItem(icon: Icon(Icons.web), title: Text("Web")),
            SalomonBottomBarItem(icon: Icon(Icons.person), title: Text("Obs"))
          ]),
    );
  }
}
