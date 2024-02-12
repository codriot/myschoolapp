import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UniWeb extends StatefulWidget {
  const UniWeb({super.key});

  @override
  State<UniWeb> createState() => _UniWebState();
}

class _UniWebState extends State<UniWeb> {
  // TODO : bölümlerin websitesini açma imkanı ver
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse("https://www.balikesir.edu.tr"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
