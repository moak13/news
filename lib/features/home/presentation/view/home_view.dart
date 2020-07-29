import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/utils/locator.dart';
import '../../../../core/widget/indicator.dart';
import '../../domain/usecase/get_news.dart';
import '../viewmodel/home_viewmodel.dart';
import '../widget/news_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _key;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.fetchNews(),
      builder: (context, model, child) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text('Flutter News App'),
          ),
          body: model.isBusy
              ? Indicator()
              : !model.hasError
                  ? ListView.builder(
                      itemCount: model.news.articles.length,
                      itemBuilder: (context, index) {
                        return NewsCard(articles: model.news.articles[index]);
                      },
                    )
                  : _key.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[200],
                        content: Text(
                          model.err,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
        );
      },
      viewModelBuilder: () => HomeViewModel(
        getNews: locator<GetNews>(),
      ),
    );
  }
}
