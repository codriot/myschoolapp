import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:myschoolapp/core/indicator/indicator.dart';
import 'package:myschoolapp/core/model/cafeteria_model.dart';
import 'package:myschoolapp/product/color.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:myschoolapp/core/web_data/link.dart';
import 'package:myschoolapp/product/widget/customcard.dart';
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
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      // I'm not connected to a network.
      List<String> articlesFood = [];
      final response = await http.get(Links.yemekhaneUrl);
      dom.Document html = dom.Document.html(response.body);
      final titles = html
          .querySelectorAll(Links.webscrappinghtml)
          .map((e) => e.text.trim())
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
              gun: articlesFood[f++].toUpperCase(),
              yemekBir: articlesFood[f++],
              yemekIki: articlesFood[f++],
              yemekUc: articlesFood[f++],
              yemekDort: articlesFood[f++]),
        );
      }
      f = 0;
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
        ),
        body: SafeArea(
            child: CheckMarkIndicator(
          onRefresh: () async {
            setState(() {
              articles.clear();
            });
            await getdata();
            await Future.delayed(const Duration(milliseconds: 550));
          },

          // TODO: CheckMarkIndicator is not working use it
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomKart(mainTitle: articles[index].gun, lessons: [
                [articles[index].yemekBir, ''],
                [articles[index].yemekIki, ''],
                [articles[index].yemekUc, ''],
                [articles[index].yemekDort, ''],
              ]);
            },
          ),
        )));
  }
}
