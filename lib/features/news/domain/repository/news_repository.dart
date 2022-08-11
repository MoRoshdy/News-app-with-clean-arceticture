import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/core/error/failure.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure ,News>> getBusinessNews();
  Future<Either<Failure ,News>> getSportsNews();
  Future<Either<Failure ,News>> getScienceNews();
}