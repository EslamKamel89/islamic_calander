import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_calander/core/api_service/api_consumer.dart';
import 'package:islamic_calander/core/api_service/dio_consumer.dart';
import 'package:islamic_calander/core/router/app_router.dart';
import 'package:islamic_calander/core/router/middleware.dart';
import 'package:islamic_calander/features/date_conversion/data/data_source/date_conversion_data_source.dart';
import 'package:islamic_calander/features/date_conversion/data/repos/date_conversion_repo_impl.dart';
import 'package:islamic_calander/features/date_conversion/domain/repo/date_conversion_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future initServiceLocator() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: serviceLocator()));
  final prefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => prefs);
  serviceLocator.registerLazySingleton<AppMiddleWare>(() => AppMiddleWare(sharedPreferences: serviceLocator()));
  serviceLocator.registerLazySingleton<AppRouter>(() => AppRouter(appMiddleWare: serviceLocator()));
  serviceLocator.registerLazySingleton<HomeRepoDataSource>(() => HomeRepoDataSource(api: serviceLocator()));
  serviceLocator
      .registerLazySingleton<DateConversionRepo>(() => DateConversionRepoImpl(homeRepoDataSource: serviceLocator()));

  // serviceLocator.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(api: serviceLocator()));
  // serviceLocator.registerLazySingleton<HomeRepo>(() => HomeRepoImp(homeRemoteDataSource: serviceLocator()));
}
