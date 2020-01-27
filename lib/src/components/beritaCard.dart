import 'package:beritaboong/src/model/berita_articles.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: <Widget>[
              Container(
                height: 240,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: _articles.urlToImage,
                  placeholder: (BuildContext context, _) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (BuildContext context, _, __) =>
                      Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: Text(
                        _articles.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
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
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          _articles.publishedAt,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    )
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
