import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/error/failure.dart';
import 'package:news_app_with_clean_architecture/core/strings/failures.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/usecases/get_science_news_usecase.dart';

part 'science_news_event.dart';
part 'science_news_state.dart';

class ScienceNewsBloc extends Bloc<ScienceNewsEvent, ScienceNewsState> {
  final GetScienceNewsUseCase getScienceNews;

  ScienceNewsBloc({required this.getScienceNews}) : super(ScienceNewsInitial()) {
    on<ScienceNewsEvent>((event, emit) async {
      if (event is GetScienceNewsEvent) {
        emit(LoadingScienceNewsState());

        final failureOrScienceNews = await getScienceNews();
        emit(_mapFailureOrNewsToState(failureOrScienceNews));
      } else if (event is RefreshScienceNewsEvent) {
        emit(LoadingScienceNewsState());

        final failureOrScienceNews = await getScienceNews();
        emit(_mapFailureOrNewsToState(failureOrScienceNews));
      }
    });
  }

  ScienceNewsState _mapFailureOrNewsToState(
      Either<Failure, List<News>> either) {
    return either.fold(
            (failure) => ErrorLoadingScienceNewsState(
            message: _mapFailureToMessage(failure)),
            (scienceNews) => LoadedScienceNewsState(news: scienceNews));
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
