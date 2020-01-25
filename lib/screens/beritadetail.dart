import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/berita.dart';
import '../utils/constants.dart';

class BeritaDetail extends StatelessWidget {
  static const routeName = 'berita-detail';

  @override
  Widget build(BuildContext context) {
    final beritaId = ModalRoute.of(context).settings.arguments as String;
    final loadedBerita =
        Provider.of<Beritas>(context, listen: false).findByArticles(beritaId);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              image: DecorationImage(
                  image: NetworkImage(loadedBerita.urlToImage),
                  fit: BoxFit.fill),
              color: Colors.teal,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.teal,
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Text(
              loadedBerita.title,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: textTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'sumber : ${loadedBerita.websiteName}',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Text(
                    loadedBerita.publishedAt,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              loadedBerita.content == 'null'
                  ? 'masih simpang siur gan aduhhh'
                  : loadedBerita.content,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
