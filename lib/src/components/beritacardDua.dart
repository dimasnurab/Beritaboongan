import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../model/berita_articles.dart';

class CardBeritaItem extends StatelessWidget {
  final Articles _articles;
  final VoidCallback _onTap;

  CardBeritaItem({Articles articles, @required VoidCallback onTap})
      : _articles = articles,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(_articles.urlToImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12, top: 12, right: 12),
            child: InkWell(
              onTap: _onTap,
              child: Text(
                _articles.title,
                textAlign: TextAlign.left,
                style: BoboonganAppTheme.titleCardBeritadua,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.launch,
                  color: BoboonganAppTheme.white,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  _articles.websiteName == null
                      ? 'unknown'
                      : _articles.websiteName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: BoboonganAppTheme.titleCardBeritadua,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
