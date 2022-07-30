import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:news_app_with_clean_architecture/features/news/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NewsLocalDataSource{
  Future<Unit> cacheNewsData(List<NewsModel> newsModel, String cachedNewsCategory);
  Future<List<NewsModel>> getCachedNewsData(String cachedNewsCategory);
  // Future<Unit> cacheBusinessNewsData(List<NewsModel> newsModel);
  // Future<Unit> cacheScienceNewsData(List<NewsModel> newsModel);
  // Future<Unit> cacheSportsNewsData(List<NewsModel> newsModel);
}

class NewsLocalDataSourceImp implements NewsLocalDataSource{
  final SharedPreferences sharedPreferences;

  NewsLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<List<NewsModel>> getCachedNewsData(String cachedNewsCategory) {
    final jsonString = sharedPreferences.getString(cachedNewsCategory);
    if(jsonString != null){
      List decodeJson = json.decode(jsonString);
      List<NewsModel> jsonToNewsModel = decodeJson.map<NewsModel>((jsonNewsModel) => NewsModel.fromJson(jsonNewsModel)).toList();
      return Future.value(jsonToNewsModel);
    }else{
      throw NoCachedDataException();
    }
  }

  @override
  Future<Unit> cacheNewsData(List<NewsModel> newsModel, String cachedNewsCategory) {
    List newsModelToJson = newsModel.map<Map<String, dynamic>>((newsModel) => newsModel.toJson()).toList();
    sharedPreferences.setString(cachedNewsCategory, json.encode(newsModelToJson));
    return Future.value(unit);
  }

  // @override
  // Future<Unit> cacheBusinessNewsData(List<NewsModel> newsModel) {
  //   List newsModelToJson = newsModel.map<Map<String, dynamic>>((newsModel) => newsModel.toJson()).toList();
  //   sharedPreferences.setString(cachedBusinessNews, json.encode(newsModelToJson));
  //   return Future.value(unit);
  // }
  //
  // @override
  // Future<Unit> cacheScienceNewsData(List<NewsModel> newsModel) {
  //   List newsModelToJson = newsModel.map<Map<String, dynamic>>((newsModel) => newsModel.toJson()).toList();
  //   sharedPreferences.setString(cachedScienceNews, json.encode(newsModelToJson));
  //   return Future.value(unit);
  // }
  //
  // @override
  // Future<Unit> cacheSportsNewsData(List<NewsModel> newsModel) {
  //   List newsModelToJson = newsModel.map<Map<String, dynamic>>((newsModel) => newsModel.toJson()).toList();
  //   sharedPreferences.setString(cachedSportsNews, json.encode(newsModelToJson));
  //   return Future.value(unit);
  // }

}