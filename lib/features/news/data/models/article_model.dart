import 'package:news_app_with_clean_architecture/features/news/domain/entities/article_entity.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.title,
    required super.url,
    required super.publishedAt,
     super.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'] ?? 'https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg',
      publishedAt: json['publishedAt'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }
}
