import 'package:flutter/material.dart';
import 'package:myschoolapp/core/model/webview_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatefulWidget {
  const MyWebview({super.key, required this.link});
  final WebviewModel link;

  @override
  State<MyWebview> createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  late Future<WebViewController> _controllerWebview;
  @override
  void initState() {
    super.initState();
    _controllerWebview = _loadWebView(link: widget.link.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WebViewController>(
        future: _controllerWebview,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const SizedBox.expand(
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              );
            }
            return WebViewWidget(controller: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<WebViewController> _loadWebView({required String link}) async {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.loadRequest(Uri.parse(link));
    return controller;
  }
}
