import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/home_viewmodel.dart';
import '../widget/news_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.fetchNews(),
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Flutter News App'),
            ),
            body: ListView.builder(
              itemCount: model.news.articles.length,
              itemBuilder: (context, index) {
                return NewsCard(articles: model.news.articles[index]);
              },
            ));
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
