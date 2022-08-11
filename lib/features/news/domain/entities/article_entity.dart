import 'package:equatable/equatable.dart';

class Article extends Equatable{
  const Article(
      {required this.title, required this.url,  this.urlToImage, required this.publishedAt});

  final String title;
  final String url;
  final String? urlToImage;
  final String publishedAt;



  @override
  List<Object?> get props => [title, url, urlToImage, publishedAt];
}