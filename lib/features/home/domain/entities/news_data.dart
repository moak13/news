import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class News extends Equatable {
  final String status;
  final int totalResults;
  final List<Articles> articles;
  News({
    @required this.status,
    @required this.totalResults,
    @required this.articles,
  });
  @override
  List<Object> get props => [
        status,
        totalResults,
        articles,
      ];
}

class Articles extends Equatable {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  Articles({
    @required this.source,
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
  });
  @override
  List<Object> get props => [
        source,
        author,
        title,
        description,
        urlToImage,
        publishedAt,
        content,
      ];
}

class Source extends Equatable {
  final String id;
  final String name;
  Source({
    @required this.id,
    @required this.name,
  });
  @override
  List<Object> get props => [
        id,
        name,
      ];
}
