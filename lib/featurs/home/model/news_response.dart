import 'article_mode.dart';

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json){
    return NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": articles.map((x) => x?.toJson()).toList(),
  };

}


class Source {
  Source({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}
