import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../features/home/data/datasource/news_local_data_source.dart';
import '../../features/home/data/datasource/news_remote_data_source.dart';
import '../../features/home/data/repository/news_repository_impl.dart';
import '../../features/home/domain/repository/news_data_repository.dart';
import '../../features/home/domain/usecase/get_news.dart';
import '../../features/home/presentation/viewmodel/home_viewmodel.dart';
import '../network/network_handler.dart';
import '../network/network_info.dart';
import '../persistence/database.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerFactory(
    () => HomeViewModel(
      getNews: locator(),
    ),
  );
  locator.registerFactory(
    () => GetNews(
      repository: locator(),
    ),
  );
  locator.registerFactory<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator.registerFactory<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerFactory<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(
      database: locator(),
    ),
  );
  locator.registerFactory<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: locator(),
    ),
  );
  locator.registerFactory<AppHttpClient>(
    () => AppHttpClientImpl(
      client: locator(),
    ),
  );
  locator.registerFactory<Database>(
    () => DatabaseImpl(
      sharedPreferences: locator(),
    ),
  );
  final sharedPref = await SharedPreferences.getInstance();
  locator.registerFactory(() => sharedPref);
  locator.registerLazySingleton(
    () => http.Client(),
  );
  locator.registerLazySingleton(
    () => DataConnectionChecker(),
  );
  locator.registerLazySingleton(
    () => NavigationService(),
  );
}
