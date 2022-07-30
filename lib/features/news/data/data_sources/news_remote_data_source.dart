import 'dart:convert';

import 'package:news_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:news_app_with_clean_architecture/features/news/data/models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  // Future<List<NewsModel>> getNews(String newsCategory);
  Future<List<NewsModel>> getBusinessNews();
  Future<List<NewsModel>> getSportsNews();
  Future<List<NewsModel>> getScienceNews();
}

String baseUrl = 'https://newsapi.org';

class NewsRemoteDataSourceImp implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImp({required this.client});

  // @override
  // Future<List<NewsModel>> getNews(String newsCategory) async {
  //   final response = await client.get(
  //     Uri.parse(
  //         '$baseUrl/v2/top-headlines?country=eg&category=$newsCategory&apikey=65f7f556ec76449fa7dc7c0069f040ca'),
  //     headers: {"Content-Type": "application/json"},
  //   );
  //   if (response.statusCode == 200) {
  //     final List decodedJson = json.decode(response.body) as List;
  //     final List<NewsModel> newsModels = decodedJson
  //         .map<NewsModel>((jsonNewsModel) => NewsModel.fromJson(jsonNewsModel))
  //         .toList();
  //     return newsModels;
  //   }
  //
  //   throw ServerException();
  // }

  @override
  Future<List<NewsModel>> getBusinessNews() async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<NewsModel> newsBusinessModels = decodedJson
          .map<NewsModel>((jsonNewsModel) => NewsModel.fromJson(jsonNewsModel))
          .toList();
      return newsBusinessModels;
    }

    throw ServerException();
  }

  @override
  Future<List<NewsModel>> getScienceNews() async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/v2/top-headlines?country=eg&category=science&apikey=65f7f556ec76449fa7dc7c0069f040ca'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<NewsModel> newsScienceModels = decodedJson
          .map<NewsModel>((jsonNewsModel) => NewsModel.fromJson(jsonNewsModel))
          .toList();
      return newsScienceModels;
    }

    throw ServerException();
  }

  @override
  Future<List<NewsModel>> getSportsNews() async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/v2/top-headlines?country=eg&category=sports&apikey=65f7f556ec76449fa7dc7c0069f040ca'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<NewsModel> newsSportsModels = decodedJson
          .map<NewsModel>((jsonNewsModel) => NewsModel.fromJson(jsonNewsModel))
          .toList();
      return newsSportsModels;
    }

    throw ServerException();
  }


}
