import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_with_clean_architecture/core/error/failure.dart';
import 'package:news_app_with_clean_architecture/core/strings/failures.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/usecases/get_business_news_usecase.dart';

part 'business_news_event.dart';
part 'business_news_state.dart';

class BusinessNewsBloc extends Bloc<BusinessNewsEvent, BusinessNewsState> {
  final GetBusinessNewsUseCase getBusinessNews;

  BusinessNewsBloc({required this.getBusinessNews})
      : super(BusinessNewsInitial()) {
    on<BusinessNewsEvent>((event, emit) async {
      if (event is GetBusinessNewsEvent) {
        emit(LoadingBusinessNewsState());

        final failureOrBusinessNews = await getBusinessNews();
        emit(_mapFailureOrNewsToState(failureOrBusinessNews));
      } else if (event is RefreshBusinessNewsEvent) {
        emit(LoadingBusinessNewsState());

        final failureOrBusinessNews = await getBusinessNews();
        emit(_mapFailureOrNewsToState(failureOrBusinessNews));
      }
    });
  }

  BusinessNewsState _mapFailureOrNewsToState(
      Either<Failure, List<News>> either) {
    return either.fold(
        (failure) => ErrorLoadingBusinessNewsState(
            message: _mapFailureToMessage(failure)),
        (businessNews) => LoadedBusinessNewsState(news: businessNews));
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
