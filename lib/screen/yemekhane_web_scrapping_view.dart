import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:myschoolapp/product/customcard.dart';

class YemekhaneWebScrapping extends StatefulWidget {
  const YemekhaneWebScrapping({super.key});
  @override
  State<YemekhaneWebScrapping> createState() => _YemekhaneWebScrappingState();
}

class _YemekhaneWebScrappingState extends State<YemekhaneWebScrapping> {
  List<Article> articles = [];

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future getdata() async {
    final yemekhaneUrl = Uri.parse(
        'https://www.balikesir.edu.tr/site/icerik/saglik-kultur-ve-spor-daire-baskanligi-3411');
    final response = await http.get(yemekhaneUrl);
    dom.Document html = dom.Document.html(response.body);
    final titles = html
        .querySelectorAll('span > span > strong')
        .map((e) => e.innerHtml.trim())
        .toList();

    setState(() {
      articles = List.generate(
        titles.length,
        (index) => Article(title: titles[index]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC2D9FF),
      appBar: AppBar(
        title: const Text('Yemekhane'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          final articleDay = articles[index];
          final articleYemekBir = articles[++index];
          final articleYemekIki = articles[++index];
          final articleYemekUc = articles[++index];
          final articleYemekDort = articles[++index];

          return CustomKart(
              mainTitle: articleDay.title,
              firstTitle: articleYemekBir.title,
              firstSubtitle: articleYemekIki.title,
              SecondTitle: articleYemekUc.title,
              secondSubtitle: articleYemekDort.title);

          // return ListTile(
          //   title: Text(article.title),
          // );
        },
      ),
    );
  }
}

class Article {
  final String title;
  Article({required this.title});
}
