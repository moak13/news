import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class AppHttpClient {
  Future<http.Response> getOne(String url,
      {Map<String, String> body, Map<String, String> headers});
  Future<http.Response> getCity(String url,
      {Map<String, String> body, Map<String, String> headers});
}

class AppHttpClientImpl implements AppHttpClient {
  final http.Client client;

  AppHttpClientImpl({@required this.client});
  @override
  Future<http.Response> getOne(String url,
      {Map<String, String> body, Map<String, String> headers}) async {
    final response = await client.post(url, body: body, headers: headers);
    return response;
  }

  @override
  Future<http.Response> getCity(String url,
      {Map<String, String> body, Map<String, String> headers}) async {
    final response = await client.post(url, body: body, headers: headers);
    return response;
  }
}
