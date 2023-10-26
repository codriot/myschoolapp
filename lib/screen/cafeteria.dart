import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  var url = Uri.parse(
      "https://www.balikesir.edu.tr/site/icerik/saglik-kultur-ve-spor-daire-baskanligi-3411");

  Future getData() async {
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    var response = document.getElementsByClassName("panel-body").toString();

    setState(() {
      data = response;
      print("calisiyo");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Text(data.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    onPressed: () => getData(), child: Text("veri getir")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
