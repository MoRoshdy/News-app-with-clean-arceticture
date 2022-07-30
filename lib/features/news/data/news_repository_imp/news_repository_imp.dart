import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:news_app_with_clean_architecture/core/error/failure.dart';
import 'package:news_app_with_clean_architecture/core/network/network_info.dart';
import 'package:news_app_with_clean_architecture/core/strings/cached_data_keys.dart';
import 'package:news_app_with_clean_architecture/features/news/data/data_sources/news_local_data_source.dart';
import 'package:news_app_with_clean_architecture/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImp implements NewsRepository{
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImp({required this.networkInfo, required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<News>>> getBusinessNews() async{
    if(await networkInfo.isConnected){
      try{
        final remoteNews = await remoteDataSource.getBusinessNews();
        localDataSource.cacheNewsData(remoteNews, cachedBusinessNews);
        return Right(remoteNews);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else {
      try{
        final localNews = await localDataSource.getCachedNewsData(cachedBusinessNews);
        return Right(localNews);
      } on NoCachedDataException{
        return Left(NoCachedDataFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<News>>> getScienceNews() async {
    if(await networkInfo.isConnected){
      try{
        final remoteNews = await remoteDataSource.getScienceNews();
        localDataSource.cacheNewsData(remoteNews, cachedScienceNews);
        return Right(remoteNews);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else {
      try{
        final localNews = await localDataSource.getCachedNewsData(cachedScienceNews);
        return Right(localNews);
      } on NoCachedDataException{
        return Left(NoCachedDataFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<News>>> getSportsNews() async {
    if(await networkInfo.isConnected){
      try{
        final remoteNews = await remoteDataSource.getSportsNews();
        localDataSource.cacheNewsData(remoteNews, cachedSportsNews);
        return Right(remoteNews);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else {
      try{
        final localNews = await localDataSource.getCachedNewsData(cachedSportsNews);
        return Right(localNews);
      } on NoCachedDataException{
        return Left(NoCachedDataFailure());
      }
    }
  }
}