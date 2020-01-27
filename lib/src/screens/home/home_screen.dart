import 'package:beritaboong/src/blocs/global.dart';
import 'package:beritaboong/src/components/beritaCard.dart';
import 'package:beritaboong/src/model/berita_articles.dart';
import 'package:beritaboong/src/screens/berita_info/beritaInfo_screen.dart';
import 'package:beritaboong/src/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  TextEditingController _textEditingController;
  HomeScreenBloc _homeScreenBloc;

  @override
  void initState() {
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    _homeScreenBloc = HomeScreenBloc();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _homeScreenBloc.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return StreamBuilder<List<Articles>>(
      stream: _globalBloc.beritaBlocs.articles$,
      builder: (BuildContext context, AsyncSnapshot<List<Articles>> snaphot) {
        if (!snaphot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final List<Articles> _beritas = snaphot.data;
        return Stack(
          children: <Widget>[
            RefreshIndicator(
              color: Colors.teal,
              onRefresh: () {
                _textEditingController.text = "";
                _homeScreenBloc.changeTypingState(false);
                return _globalBloc.beritaBlocs.getBerita();
              },
              child: ListView.separated(
                key: PageStorageKey('Home'),
                controller: _scrollController,
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: _beritas.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        key: UniqueKey(),
                        controller: _textEditingController,
                        maxLines: 1,
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          hintText: 'Cari berita',
                          hintMaxLines: 1,
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: StreamBuilder<bool>(
                            stream: _homeScreenBloc.isTyping$,
                            builder: (BuildContext context,
                                AsyncSnapshot<bool> snapshot) {
                              if (!snaphot.hasData) {
                                return Center(
                                  child: Text('somethingwrong'),
                                );
                              }
                              final bool _isTyping = snapshot.data;
                              return IconButton(
                                onPressed: () => _globalBloc.beritaBlocs
                                    .filterArticles(
                                        _textEditingController.text),
                                icon: Icon(Icons.search,
                                    color:
                                        _isTyping ? Colors.black : Colors.grey),
                              );
                            },
                          ),
                        ),
                        onSubmitted: (String value) =>
                            _globalBloc.beritaBlocs.filterArticles(value),
                        onChanged: (String value) {
                          if (value.trim().length == 0) {
                            _homeScreenBloc.changeTypingState(false);
                          } else {
                            _homeScreenBloc.changeTypingState(true);
                          }
                        },
                      ),
                    );
                  }
                  final Articles _berita = _beritas[index - 1];
                  return BeritaCard(
                    key: UniqueKey(),
                    articles: _berita,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BeritaInfoScreen(
                            articles: _berita,
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 15,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
