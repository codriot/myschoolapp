class WebviewModel {
  String url;
  String title;

  WebviewModel({required this.url, required this.title});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WebviewModel && other.url == url && other.title == title;
  }
}
