import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';

class NewsModel extends News {
  const NewsModel({required super.totalResults, required super.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => ArticlesModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class ArticlesModel extends Article {
  const ArticlesModel(
      {required super.title,
      required super.url,
       super.urlToImage,
      required super.publishedAt});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
    title: json["title"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
  };
}
