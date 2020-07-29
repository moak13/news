import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class AppHttpClient {
  Future<http.Response> getNews(String url);
}

class AppHttpClientImpl implements AppHttpClient {
  final http.Client client;

  AppHttpClientImpl({@required this.client});

  @override
  Future<http.Response> getNews(String url) async {
    final response = await client.get(url);
    return response;
  }
}
