import 'package:flutter/material.dart';
import 'package:myschoolapp/core/model/cafeteria_model.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:myschoolapp/core/model/lessons_model.dart';
import 'package:myschoolapp/core/web_data/link.dart';
import 'package:myschoolapp/product/customcard.dart';
import 'package:url_launcher/url_launcher.dart';

class YemekhaneWebScrapping extends StatefulWidget {
  const YemekhaneWebScrapping({super.key});
  @override
  State<YemekhaneWebScrapping> createState() => _YemekhaneWebScrappingState();
}

class _YemekhaneWebScrappingState extends State<YemekhaneWebScrapping> {
  List<GununYemekleri> articles = [];
  int f = 0;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future getdata() async {
    List<String> articlesFood = [];
    final response = await http.get(Links.yemekhaneUrl);
    dom.Document html = dom.Document.html(response.body);
    final titles = html
        .querySelectorAll(Links.webscrappinghtml)
        .map((e) => e.innerHtml.trim())
        .toList();

    setState(() {
      articlesFood = List.generate(
        titles.length,
        (index) => titles[index],
      );
    });

    //yemek listesini dolduruyorum
    for (var i = 0; i < 5; i++) {
      articles.add(
        GununYemekleri(
            gun: Gunler.values[i].name.toString().toUpperCase(),
            yemekBir: articlesFood[f++],
            yemekIki: articlesFood[f++],
            yemekUc: articlesFood[f++],
            yemekDort: articlesFood[f++]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renkler.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await launchUrl(
              Links.yemekhaneUrl,
              mode: LaunchMode.inAppWebView,
            );
          },
          icon: const Icon(Icons.open_in_new),
        ),
        title: const Text('Yemekhane'),
        centerTitle: true,
        backgroundColor: renkler.backgroundColor,
        surfaceTintColor: renkler.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                articles.clear();
                getdata();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomKart(
              mainTitle: articles[index].gun,
              firstTitle: articles[index].yemekBir,
              firstSubtitle: articles[index].yemekIki,
              secondTitle: articles[index].yemekUc,
              secondSubtitle: articles[index].yemekDort);
        },
      ),
    );
  }
}
