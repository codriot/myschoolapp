import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          final article = articles[index];

          return ListTile(
            title: Text(article.title),
          );
        },
      ),
    );
  }
}

class Article {
  final String title;

  Article({required this.title});
}
