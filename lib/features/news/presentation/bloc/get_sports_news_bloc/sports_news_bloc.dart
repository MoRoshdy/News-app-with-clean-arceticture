import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/error/failure.dart';
import 'package:news_app_with_clean_architecture/core/strings/failures.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/usecases/get_sports_news_usecase.dart';

part 'sports_news_event.dart';
part 'sports_news_state.dart';

class SportsNewsBloc extends Bloc<SportsNewsEvent, SportsNewsState> {
  final GetSportsNewsUseCase getSportsNews;

  SportsNewsBloc({required this.getSportsNews}) : super(SportsNewsInitial()) {
    on<SportsNewsEvent>((event, emit) async {
      if (event is GetSportsNewsEvent) {
        emit(LoadingSportsNewsState());

        final failureOrSportsNews = await getSportsNews();
        emit(_mapFailureOrNewsToState(failureOrSportsNews));
      } else if (event is RefreshSportsNewsEvent) {
        emit(LoadingSportsNewsState());

        final failureOrSportsNews = await getSportsNews();
        emit(_mapFailureOrNewsToState(failureOrSportsNews));
      }
    });
  }

  SportsNewsState _mapFailureOrNewsToState(
      Either<Failure, News> either) {
    return either.fold(
            (failure) => ErrorLoadingSportsNewsState(
            message: _mapFailureToMessage(failure)),
            (sportsNews) => LoadedSportsNewsState(news: sportsNews));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NoInternetFailure:
        return NO_INTERNET_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NoCachedDataFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error , please try again later';
    }
  }
}
