import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../features/home/model/news.dart';

class Api {
  static const url =
      'https://newsapi.org/v2/top-headlines?country=ng&apiKey=18fe231690634a4687477ed1fc39e613';
  Future<News> getNews() async {
    try {
      var response = await http.get(url);
      var parsed = json.decode(response.body);
      return News.fromJson(parsed);
    } catch (e) {
      return e;
    }
  }
}
