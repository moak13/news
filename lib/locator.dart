import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/network/network_handler.dart';
import 'core/network/network_info.dart';
import 'core/persistence/database.dart';
import 'features/home/data/datasource/news_local_data_source.dart';
import 'features/home/data/datasource/news_remote_data_source.dart';
import 'features/home/data/repository/news_repository_impl.dart';
import 'features/home/domain/repository/news_data_repository.dart';
import 'features/home/domain/usecase/get_news.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(
    () => NavigationService(),
  );
  locator.registerLazySingleton(
    () => GetNews(
      repository: locator(),
    ),
  );
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(
      database: locator(),
    ),
  );
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: locator(),
    ),
  );
  locator.registerLazySingleton<AppHttpClient>(
    () => AppHttpClientImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<Database>(
    () => DatabaseImpl(
      sharedPreferences: locator(),
    ),
  );
  final sharedPref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPref);
  locator.registerLazySingleton(
    () => http.Client(),
  );
  locator.registerLazySingleton(
    () => DataConnectionChecker(),
  );
}
