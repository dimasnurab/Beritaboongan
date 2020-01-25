import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CategoryBerita with ChangeNotifier {
  String id;
  String websiteName;
  String title;
  String headLine;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  CategoryBerita({
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

class CategoryBeritas with ChangeNotifier {
  final List<CategoryBerita> cItems = [];

  Future<List<CategoryBerita>> getCategoryBerita(String category) async {
    const apiKey = '4e36ec1ed77f496e99c666f35c5f3828';
    final apiUrl =
        'https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey';
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
        cItems.add(CategoryBerita(
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
    return cItems;
  }
}
