import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeritaItem with ChangeNotifier {
  String id;
  String websiteName;
  String title;
  String headLine;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  BeritaItem({
    this.id,
    this.websiteName,
    this.title,
    this.headLine,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

// Providers state management

class Beritas with ChangeNotifier {
  final List<BeritaItem> items = [];

  BeritaItem findByArticles(String id) {
    return items.firstWhere((berita) => berita.id == id);
  }

  Future<List<BeritaItem>> fetchBerita() async {
    // mengambil data dari newsapi.org
    const apiKey = '4e36ec1ed77f496e99c666f35c5f3828';
    const apiUrl =
        'https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$apiKey';
    http.Response response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      String data = response.body;
      for (int item = 0; item < 20; item++) {
        String id = item.toString();
        String websiteName =
            jsonDecode(data)['articles'][item]['source']['name'].toString();
        String title = jsonDecode(data)['articles'][item]['title'].toString();
        String headLine =
            jsonDecode(data)['articles'][item]['description'].toString();
        String url = jsonDecode(data)['articles'][item]['url'].toString();
        String urlToImage =
            jsonDecode(data)['articles'][item]['urlToImage'].toString();
        String publishedAt =
            jsonDecode(data)['articles'][item]['publishedAt'].toString();
        String content =
            jsonDecode(data)['articles'][item]['content'].toString();
        items.add(BeritaItem(
          id: id,
          websiteName: websiteName,
          title: title,
          headLine: headLine,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        ));
      }
    }
    notifyListeners();
    return items;
  }
}
