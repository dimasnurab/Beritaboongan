import 'package:beritaboong/src/model/berita_articles.dart';
import 'package:beritaboong/src/screens/berita_info/webviewArticles.dart';
import 'package:beritaboong/src/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BeritaInfoScreen extends StatelessWidget {
  final Articles _articles;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  BeritaInfoScreen({@required Articles articles}) : _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BoboonganAppTheme.background,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldkey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          body: ListView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 90,
                  child: Text(
                    _articles.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Text(
                          _articles.author == null
                              ? 'unknown'
                              : _articles.author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(_articles.publishedAt),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  child: CachedNetworkImage(
                    imageUrl: _articles.urlToImage == null
                        ? ''
                        : _articles.urlToImage,
                    placeholder: (BuildContext context, _) => Center(
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        color: BoboonganAppTheme.grey,
                      ),
                    ),
                    errorWidget: (BuildContext context, _, __) => Center(
                      child: Text('Tidak dapat memuat gambar'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Sumber :${_articles.websiteName == null ? 'unknown' : _articles.websiteName}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 200,
                  width: 40,
                  child: Text(
                    _articles.content == null
                        ? 'Masih simpang siur jadi belum bisa ngasih tau'
                        : _articles.content +
                            "\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    maxLines: null,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                WebviewArticles(articles: _articles))),
                    child: Text('Klik Disini')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
