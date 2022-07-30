part of 'sports_news_bloc.dart';

abstract class SportsNewsEvent extends Equatable {
  const SportsNewsEvent();

  @override
  List<Object?> get props => [];
}

class GetSportsNewsEvent extends SportsNewsEvent{}

class RefreshSportsNewsEvent extends SportsNewsEvent{}
