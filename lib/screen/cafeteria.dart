import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

void main() => runApp(const CafeteriaView());

class CafeteriaView extends StatefulWidget {
  const CafeteriaView({super.key});

  @override
  State<CafeteriaView> createState() => _CafeteriaViewState();
}

class _CafeteriaViewState extends State<CafeteriaView> {
  var data;
  var url = Uri.parse(
      "https://www.balikesir.edu.tr/site/icerik/saglik-kultur-ve-spor-daire-baskanligi-3411");

  Future getdata() async {
    var resp = await http.get(url);
    final body = resp.body;
    var document = parser.parse(resp.body);
    var response = document
        .getElementsByClassName('panel-body')[0]
        .getElementsByTagName("table")[0]
        .getElementsByTagName("tbody")[0]
        .getElementsByTagName("tr")[0]
        .getElementsByTagName("td")[1]
        .getElementsByTagName("span")[0]
        .getElementsByTagName("strong")[0]
        .toString();

    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(data ?? 'No data'),
              ElevatedButton(
                  onPressed: () => getdata(), child: const Text('Get Food')),
            ],
          ),
        ),
      ),
    );
  }
}
