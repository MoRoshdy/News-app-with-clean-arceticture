part of 'business_news_bloc.dart';

abstract class BusinessNewsEvent extends Equatable {
  const BusinessNewsEvent();

  @override
  List<Object?> get props => [];
}

class GetBusinessNewsEvent extends BusinessNewsEvent{}

class RefreshBusinessNewsEvent extends BusinessNewsEvent{}


