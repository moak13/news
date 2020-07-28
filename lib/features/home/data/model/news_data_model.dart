import 'package:meta/meta.dart';

import '../../domain/entities/news_data.dart';

class NewsModel extends News {
  NewsModel({
    @required String status,
    @required int totalResults,
    @required List<Articles> articles,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articles,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: json['articles'] != null
            ? json['articles'].forEach((v) {
                new ArticlesModel.fromJson(v);
              })
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }
}

class ArticlesModel extends Articles {
  ArticlesModel({
    @required Source source,
    @required String author,
    @required String title,
    @required String description,
    @required String urlToImage,
    @required String publishedAt,
    @required String content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      source: json['source'] != null
          ? new SourceModel.fromJson(json['source'])
          : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class SourceModel extends Source {
  SourceModel({
    @required String id,
    @required String name,
  }) : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
