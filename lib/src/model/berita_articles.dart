class Articles {
  String _id;
  String _websiteName;
  String _author;
  String _title;
  String _description;
  String _url;
  String _urlToImage;
  String _publishedAt;
  String _content;

  String get id => _id;
  String get websiteName => _websiteName;
  String get author => _author;
  String get title => _title;
  String get description => _description;
  String get urlToImage => _urlToImage;
  String get url => _url;
  String get publishedAt => _publishedAt;
  String get content => _content;

  Articles._({
    String id,
    String websiteName,
    String author,
    String title,
    String description,
    String url,
    String urlToImage,
    String publishedAt,
    String content,
  })  : _id = id,
        _websiteName = websiteName,
        _author = author,
        _title = title,
        _description = description,
        _urlToImage = urlToImage,
        _publishedAt = publishedAt,
        _content = content;

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles._(
      // id: json['source']['id'].toString(),
      websiteName: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
