import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({required this.totalResults, required this.articles});

  final int totalResults;
  final List<Article> articles;

  @override
  List<Object?> get props => [totalResults, articles];
}



class Article extends Equatable {
  const Article(
      {required this.title, required this.url, this.urlToImage, required this.publishedAt});

  final String title;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;

  @override
  List<Object?> get props => [title, url, urlToImage, publishedAt];
}
