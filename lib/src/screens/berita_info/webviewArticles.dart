import 'dart:async';

import 'package:beritaboong/src/model/berita_articles.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewArticles extends StatefulWidget {
  final Articles _articles;

  WebviewArticles({@required Articles articles}) : _articles = articles;

  @override
  _WebviewArticlesState createState() => _WebviewArticlesState();
}

class _WebviewArticlesState extends State<WebviewArticles> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  String defaultUrl = 'https://dribbble.com/dimasnurr';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: widget._articles.url.length > 50
              ? widget._articles.url
              : defaultUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewController) {
            _controller.complete(webviewController);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
