import 'dart:convert';

import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_handler.dart';
import '../model/news_data_model.dart';

abstract class NewsRemoteDataSource {
  /// Calls the https://newsapi.org/v2/top-headlines?country=ng&apiKey={apikey} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NewsModel> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final AppHttpClient client;
  NewsRemoteDataSourceImpl({
    @required this.client,
  });
  @override
  Future<NewsModel> getNews() async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=ng&apiKey=18fe231690634a4687477ed1fc39e613";
    final Map headers = {
      'content-type': 'application/json',
    };
    final response = await client.getNews(url, headers: headers);
    if (response.statusCode == 200) {
      return NewsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
