import 'dart:convert';
import 'dart:io';
import 'package:beritaboong/src/model/berita_articles.dart';
import 'package:beritaboong/src/utils/privatedata.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class BeritaBlocs {
  BehaviorSubject<List<Articles>> _articles$;
  List<Articles> _defaultBeritaList;

  BehaviorSubject<List<Articles>> get articles$ => _articles$;

  BeritaBlocs() {
    _articles$ = BehaviorSubject<List<Articles>>();
    _defaultBeritaList = [];
    getBerita();
  }

  Future<void> getBerita() async {
    final String _urlNews =
        '${PrivateData.BaseUrl}/v2/top-headlines?country=id&category=technology&apiKey=${PrivateData.ApiKey}';
    try {
      final _response = await http.get(_urlNews);
      if (_response.statusCode == 200) {
        final Map<String, dynamic> _json = jsonDecode(_response.body);
        _defaultBeritaList = [];
        for (var item in _json['articles']) {
          _defaultBeritaList.add(Articles.fromJson(item));
        }
        _articles$.add(_defaultBeritaList);
      }
    } on SocketException {
      print('Tidak ada internet connection');
    } on HttpException {
      print('Tidak bisa menemukan data');
    } on FormatException {
      print('Respon format buruk');
    }
  }

  void filterArticles(String text) {
    List<Articles> _result = [];
    text = text.toLowerCase().replaceAll(' ', '');
    for (var articles in _defaultBeritaList) {
      final String _compareString =
          (articles.title).toLowerCase().replaceAll(' ', '');
      if (_compareString.contains(text)) {
        _result.add(articles);
      }
    }
    _articles$.add(_result);
  }

  void dispose() {}
}
