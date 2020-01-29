import 'package:beritaboong/src/blocs/global.dart';
import 'package:beritaboong/src/components/beritaCard.dart';
import 'package:beritaboong/src/components/beritacardDua.dart';
import 'package:beritaboong/src/model/berita_articles.dart';
import 'package:beritaboong/src/screens/berita_info/beritaInfo_screen.dart';
import 'package:beritaboong/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Widget> listViews = List<Widget>();

  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return StreamBuilder<List<Articles>>(
      stream: _globalBloc.beritaBlocs.articles$,
      builder: (BuildContext context, AsyncSnapshot<List<Articles>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final List<Articles> _beritaItem = snapshot.data;
        return Container(
          color: Color(0xFFF2F3F8),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: BoboonganAppTheme.white,
              title: Center(
                child: Text('BeritaBoongan',
                    style: BoboonganAppTheme.appBartitleStyle),
              ),
              elevation: 2,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                RefreshIndicator(
                  color: BoboonganAppTheme.nearlyBlue,
                  onRefresh: () {
                    return _globalBloc.beritaBlocs.getBerita();
                  },
                  child: _buildItemBerita(_beritaItem),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildItemBerita(List<Articles> articles) {
  return ListView.builder(
    physics: AlwaysScrollableScrollPhysics(
      parent: BouncingScrollPhysics(),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    itemCount: articles.length,
    itemBuilder: (BuildContext context, int index) {
      final Articles _articles = articles[index];
      if (index == 0) {
        return CardBeritaItem(
          articles: _articles,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => BeritaInfoScreen(
                articles: _articles,
              ),
            ),
          ),
        );
      } else if (index == 1) {
        return Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: _buildSisipanText('HEADLINES NEWS'));
      } else if (index == 10) {
        return Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: _buildSisipanText('REKOMENDASI'));
      }
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: BeritaCard(
          key: UniqueKey(),
          articles: _articles,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BeritaInfoScreen(
                  articles: _articles,
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildSisipanText(String text) {
  return Row(
    children: <Widget>[
      Container(
        height: 20,
        width: 8,
        decoration: BoxDecoration(color: BoboonganAppTheme.nearlyBlack),
      ),
      SizedBox(width: 10),
      Text(text, style: BoboonganAppTheme.topNewsTextStyle),
    ],
  );
}
