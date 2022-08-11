import 'dart:convert';

import 'package:news_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:news_app_with_clean_architecture/features/news/data/models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<NewsModel> getBusinessNews();
  Future<NewsModel> getSportsNews();
  Future<NewsModel> getScienceNews();
}

String baseUrl = 'https://newsapi.org';

class NewsRemoteDataSourceImp implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImp({required this.client});


  @override
  Future<NewsModel> getBusinessNews() async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/v2/top-headlines?country=eg&category=business&apiKey=acc58cce3bb04471b15dae83293feb72'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return NewsModel.fromJson(decodedJson);
    }

    throw ServerException();
  }

  @override
  Future<NewsModel> getScienceNews() async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/v2/top-headlines?country=eg&category=science&apiKey=acc58cce3bb04471b15dae83293feb72'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return NewsModel.fromJson(decodedJson);
    }

    throw ServerException();
  }

  @override
  Future<NewsModel> getSportsNews() async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/v2/top-headlines?country=eg&category=sports&apiKey=acc58cce3bb04471b15dae83293feb72'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return NewsModel.fromJson(decodedJson);
    }

    throw ServerException();
  }

}
