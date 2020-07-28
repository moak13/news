import 'package:flutter/material.dart';
import 'package:news/core/utils/screen_util.dart';
import 'package:news/features/home/domain/entities/news_data.dart';

class NewsCard extends StatelessWidget {
  final Articles articles;
  const NewsCard({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil(context).setHeight(height: 40),
      width: ScreenUtil(context).setWidth(width: 40),
      child: Center(
        child: Text(articles.author),
      ),
    );
  }
}
