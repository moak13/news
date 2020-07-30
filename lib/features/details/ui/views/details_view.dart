import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/screen_util.dart';

import '../../../home/model/articles.dart';

class DetailsView extends StatelessWidget {
  final Articles articles;

  const DetailsView({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: ScreenUtil(context).setHeight(height: 3),
              width: ScreenUtil(context).setWidth(width: 4),
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ??
                    'https://fcwc-fish.org/wp-content/uploads/2019/07/2000px-Flag_of_Nigeria.svg-1024x512.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(articles.title ?? 'No Title'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3.0,
              bottom: 3.0,
            ),
            child: ListTile(
              title: Text(articles.author ?? 'No Author'),
              subtitle: Text(articles.source.name ?? 'No Source'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(articles.description ?? 'No Description'),
          ),
        ],
      ),
    );
  }
}
