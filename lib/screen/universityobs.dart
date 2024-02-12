import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ObsWeb extends StatefulWidget {
  const ObsWeb({super.key});

  @override
  State<ObsWeb> createState() => _ObsWebState();
}

class _ObsWebState extends State<ObsWeb> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(
        Uri.parse("https://obs.balikesir.edu.tr/oibs/ogrenci/login.aspx"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
