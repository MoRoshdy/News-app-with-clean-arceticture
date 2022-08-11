import 'package:equatable/equatable.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/article_entity.dart';

class News extends Equatable {
  const News({required this.totalResults, required this.articles});

  final int totalResults;
  final List<Article> articles;

  @override
  List<Object?> get props => [totalResults, articles];
}