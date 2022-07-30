import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app_with_clean_architecture/core/network/network_info.dart';
import 'package:news_app_with_clean_architecture/features/news/data/data_sources/news_local_data_source.dart';
import 'package:news_app_with_clean_architecture/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:news_app_with_clean_architecture/features/news/data/news_repository_imp/news_repository_imp.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/repository/news_repository.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/usecases/get_business_news_usecase.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_business_news_bloc/business_news_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // feature -- news

  // Bloc

  sl.registerFactory(() => BusinessNewsBloc(getBusinessNews: sl()));
  // sl.registerFactory(() => ScienceNewsBloc(getScienceNews: sl()));
  // sl.registerFactory(() => SportsNewsBloc(getSportsNews: sl()));

  // UseCases

  sl.registerLazySingleton(() => GetBusinessNewsUseCase(sl()));
  // sl.registerLazySingleton(() => GetScienceNewsUseCase(sl()));
  // sl.registerLazySingleton(() => GetSportsNewsUseCase(sl()));

  // Repository

  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImp(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // DataSources

  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSourceImp(sharedPreferences: sl()));

  // Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  // External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
