import 'package:beritaboong/providers/categoryBerita.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsitePage extends StatefulWidget {
  static const routeName = '/websitepage';
  final CategoryBerita categoryBerita;
  WebsitePage(this.categoryBerita);

  @override
  _WebsitePageState createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoadingPage;
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    _isLoadingPage
                        ? Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.teal,
                              strokeWidth: 1.0,
                            ),
                          )
                        : Container(
                            height: 10,
                            width: 10,
                          ),
                  ],
                ),
                Expanded(
                  child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.categoryBerita.url,
                    onPageFinished: (finish) {
                      setState(() {
                        _isLoadingPage = false;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
