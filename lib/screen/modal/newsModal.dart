// import 'newsModal.dart';
//
//   class NewsModal
// {
//   String? status;
//   int? totalResults;
//   List<Articles>? articles=[];
//
//
//   NewsModal({this.status, this.totalResults, this.articles});
//   factory NewsModal.formJson(Map m1)
//   {
//     List l1= m1['articles'];
//     return NewsModal(status: m1['status'],totalResults:m1['totalResults'] ,articles: l1.map((e)=>Articles.fromJson(e)).toList(),);
//   }
// }
// class Articles
// {
//   String? author,title;
//
//   Articles({this.author, this.title});
//   factory Articles.fromJson(Map m1)
//   {
//     return Articles(title: m1['title'],author: m1['author']);
//   }
// }
//




import 'dart:convert';

NewsModal newsModalFromJson(String str) => NewsModal.fromJson(json.decode(str));

String newsModalToJson(NewsModal data) => json.encode(data.toJson());

class NewsModal {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsModal({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsModal.fromJson(Map<String, dynamic> json) => NewsModal(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
  };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
