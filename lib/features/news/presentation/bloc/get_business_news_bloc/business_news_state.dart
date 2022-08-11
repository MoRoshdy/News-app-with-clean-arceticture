part of 'business_news_bloc.dart';

abstract class BusinessNewsState extends Equatable {
  const BusinessNewsState();

  @override
  List<Object> get props => [];
}

class BusinessNewsInitial extends BusinessNewsState {
  @override
  List<Object> get props => [];
}

class LoadingBusinessNewsState extends BusinessNewsState{}

class LoadedBusinessNewsState extends BusinessNewsState{
  final News news;

  const LoadedBusinessNewsState({required this.news});

  @override
  List<Object> get props => [news];
}

class ErrorLoadingBusinessNewsState extends BusinessNewsState{
  final String message;

  const ErrorLoadingBusinessNewsState({required this.message});

  @override
  List<Object> get props => [message];
}