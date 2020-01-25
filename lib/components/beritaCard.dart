import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/berita.dart';
import '../utils/constants.dart';
import '../screens/beritadetail.dart';

class BeritaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final berita = Provider.of<BeritaItem>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: 240,
        decoration: BoxDecoration(
          color: Colors.teal,
          image: DecorationImage(
            image: NetworkImage(berita.urlToImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(14),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(BeritaDetail.routeName, arguments: berita.id);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                      berita.title == 'null'
                          ? 'Berita masih simpang siur gan!!'
                          : berita.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: textStyleCard),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
