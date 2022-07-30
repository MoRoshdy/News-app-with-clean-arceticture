part of 'science_news_bloc.dart';

abstract class ScienceNewsState extends Equatable {
  const ScienceNewsState();

  @override
  List<Object> get props => [];
}

class ScienceNewsInitial extends ScienceNewsState {
  @override
  List<Object> get props => [];
}

class LoadingScienceNewsState extends ScienceNewsState{}

class LoadedScienceNewsState extends ScienceNewsState{
  final List<News> news;

  const LoadedScienceNewsState({required this.news});

  @override
  List<Object> get props => [news];
}

class ErrorLoadingScienceNewsState extends ScienceNewsState{
  final String message;

  const ErrorLoadingScienceNewsState({required this.message});

  @override
  List<Object> get props => [message];
}
