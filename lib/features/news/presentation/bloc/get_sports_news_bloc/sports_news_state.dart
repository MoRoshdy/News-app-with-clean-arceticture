part of 'sports_news_bloc.dart';

abstract class SportsNewsState extends Equatable {
  const SportsNewsState();

  @override
  List<Object> get props => [];
}

class SportsNewsInitial extends SportsNewsState {
  @override
  List<Object> get props => [];
}

class LoadingSportsNewsState extends SportsNewsState{}

class LoadedSportsNewsState extends SportsNewsState{
  final News news;

  const LoadedSportsNewsState({required this.news});

  @override
  List<Object> get props => [news];
}

class ErrorLoadingSportsNewsState extends SportsNewsState{
  final String message;

  const ErrorLoadingSportsNewsState({required this.message});

  @override
  List<Object> get props => [message];
}
