import 'package:flutter/material.dart';
import 'package:myschoolapp/core/web_data/link.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UniWeb extends StatefulWidget {
  const UniWeb({super.key});

  @override
  State<UniWeb> createState() => _UniWebState();
}

class _UniWebState extends State<UniWeb> {
  WebViewController? _controllerWebview;

  @override
  void initState() {
    super.initState();
    _controllerWebview = loadWebView(link: Links.universityUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Universite Sayfası"),
      ),
      body: WebViewWidget(
        controller: _controllerWebview!,
      ),
    );
  }

  WebViewController loadWebView({required String link}) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(link));
    return controller;
  }
}
