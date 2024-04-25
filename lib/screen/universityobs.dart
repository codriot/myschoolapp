import 'package:flutter/material.dart';
import 'package:myschoolapp/core/web_data/link.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ObsWeb extends StatefulWidget {
  const ObsWeb({super.key});

  @override
  State<ObsWeb> createState() => _ObsWebState();
}

class _ObsWebState extends State<ObsWeb> {
  WebViewController? _controllerWebview;

  @override
  void initState() {
    super.initState();
    _controllerWebview = loadWebView(link: Links.obsUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Obs Sayfası"),
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
