import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherCafeteriaView extends StatefulWidget {
  const UrlLauncherCafeteriaView({super.key});

  @override
  State<UrlLauncherCafeteriaView> createState() =>
      _UrlLauncherCafeteriaViewState();
}

final url = Uri.parse(
    'https://www.balikesir.edu.tr/site/icerik/saglik-kultur-ve-spor-daire-baskanligi-3411');

class _UrlLauncherCafeteriaViewState extends State<UrlLauncherCafeteriaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekhane'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await launchUrl(
              url,
              mode: LaunchMode.inAppWebView,
            );
          },
          child: const Text('Yemekhane'),
        ),
      ),
    );
  }
}
