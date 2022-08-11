import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/core/error/failure.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/repository/news_repository.dart';

class GetBusinessNewsUseCase{
  final NewsRepository repository;

  GetBusinessNewsUseCase(this.repository);

  Future<Either<Failure, News>> call() async {
    return await repository.getBusinessNews();
  }
}