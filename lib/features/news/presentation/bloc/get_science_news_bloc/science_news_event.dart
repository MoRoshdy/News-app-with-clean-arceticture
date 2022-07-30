part of 'science_news_bloc.dart';

abstract class ScienceNewsEvent extends Equatable {
  const ScienceNewsEvent();

  @override
  List<Object?> get props => [];
}

class GetScienceNewsEvent extends ScienceNewsEvent{}

class RefreshScienceNewsEvent extends ScienceNewsEvent{}