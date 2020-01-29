import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../model/berita_articles.dart';
import '../utils/constants.dart';

class BeritaCard extends StatelessWidget {
  final Articles _articles;
  final VoidCallback _onPressed;

  BeritaCard(
      {Key key, @required Articles articles, @required VoidCallback onPressed})
      : _articles = articles,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Container(
                height: 240,
                width: 100,
                child: CachedNetworkImage(
                  fadeInCurve: Curves.elasticIn,
                  fadeInDuration: Duration(milliseconds: 4000),
                  imageUrl: _articles.urlToImage,
                  placeholder: (BuildContext context, _) => Center(
                    child: Text('Loading...'),
                  ),
                  errorWidget: (BuildContext context, _, __) =>
                      Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: Text(
                        _articles.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: BoboonganAppTheme.titleStyleCardBerita,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.launch,
                          size: 12,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Container(
                          width: 120,
                          child: Text(
                            _articles.websiteName == null ||
                                    _articles.websiteName == ''
                                ? 'unknown'
                                : _articles.websiteName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
