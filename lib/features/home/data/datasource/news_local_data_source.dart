import 'dart:convert';

import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/persistence/database.dart';
import '../model/news_data_model.dart';

const String key = '';

abstract class NewsLocalDataSource {
  /// Gets the cached [NewsModel] which was gotten the last time
  /// the user had internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NewsModel> getCachedData();

  /// Saves the data [NewsModel] which is gotten as
  /// the user has internet connection.
  ///
  /// We assume it throws [CacheException] if data can't be stored.
  Future<void> cacheData(NewsModel cacheData);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final Database database;

  NewsLocalDataSourceImpl({@required this.database});
  @override
  Future<void> cacheData(NewsModel cacheData) {
    return database.save(
      key: key,
      value: json.encode(cacheData.toJson()),
    );
  }

  @override
  Future<NewsModel> getCachedData() async {
    final jsonString = await database.pull(key: key);
    if (jsonString != null) {
      return Future.value(
        NewsModel.fromJson(
          json.decode(jsonString),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
