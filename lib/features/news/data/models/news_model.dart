import 'package:news_app_with_clean_architecture/features/news/data/models/article_model.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/article_entity.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';


class NewsModel extends News {
  const NewsModel({required super.totalResults, required super.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      totalResults: json['totalResults'],
      articles: List<ArticleModel>.from(json['articles'].map((x) => ArticleModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalResults': totalResults,
      'articles': List<dynamic>.from(articles.map((x) => x.toDataLayer().toJson())),
    };
  }
}


extension on Article {
  ArticleModel  toDataLayer() => ArticleModel(
    title: title,
    url: url,
    publishedAt: publishedAt,
    urlToImage: urlToImage,
  );
}