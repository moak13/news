// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/datasource/news_local_data_source.dart';
import '../../features/home/data/datasource/news_remote_data_source.dart';
import '../../features/home/data/repository/news_repository_impl.dart';
import '../../features/home/domain/entities/news_data.dart';
import '../../features/home/domain/repository/news_data_repository.dart';
import '../../features/home/domain/usecase/get_news.dart';
import '../network/network_handler.dart';
import '../network/network_info.dart';
import '../persistence/database.dart';
import '../usecase/usecase.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  gh.factory<AppHttpClient>(() => AppHttpClientImpl(client: g<Client>()));
  gh.factory<Database>(
      () => DatabaseImpl(sharedPreferences: g<SharedPreferences>()));
  gh.factory<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: g<DataConnectionChecker>()));
  gh.factory<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(database: g<Database>()));
  gh.factory<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: g<AppHttpClient>()));
  gh.factory<NewsRepository>(() => NewsRepositoryImpl(
        remoteDataSource: g<NewsRemoteDataSource>(),
        localDataSource: g<NewsLocalDataSource>(),
        networkInfo: g<NetworkInfo>(),
      ));
  gh.factory<UseCase<News, NoParams>>(
      () => GetNews(repository: g<NewsRepository>()));
}
