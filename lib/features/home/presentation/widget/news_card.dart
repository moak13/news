import 'package:flutter/material.dart';

import '../../../../core/utils/screen_util.dart';
import '../../domain/entities/news_data.dart';

class NewsCard extends StatelessWidget {
  final Articles articles;
  const NewsCard({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ]),
      height: ScreenUtil(context).setHeight(height: 40),
      width: ScreenUtil(context).setWidth(width: 40),
      child: Center(
        child: Text(
          articles.author,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
