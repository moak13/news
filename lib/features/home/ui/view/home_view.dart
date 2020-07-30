import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/utils/screen_util.dart';
import '../../../../core/widget/indicator.dart';
import '../../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.futureToRun(),
      builder: (context, model, child) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text('Flutter News'),
          ),
          body: model.isBusy
              ? Indicator()
              : !model.hasError
                  ? RefreshIndicator(
                      onRefresh: model.futureToRun,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: model.data.articles.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => model
                                  .moveToDetails(model.data.articles[index]),
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height:
                                    ScreenUtil(context).setHeight(height: 3),
                                width: ScreenUtil(context).setWidth(width: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2,
                                        child: CachedNetworkImage(
                                          imageUrl: model.data.articles[index]
                                                  .urlToImage ??
                                              'https://fcwc-fish.org/wp-content/uploads/2019/07/2000px-Flag_of_Nigeria.svg-1024x512.png',
                                          imageBuilder:
                                              (context, imageProvider) {
                                            print('checking image');
                                            print(imageProvider.toString());
                                            return Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover)),
                                            );
                                          },
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            child: Center(
                                              child: Text('Flutter News'),
                                            ),
                                            baseColor: Colors.blue,
                                            highlightColor: Colors.black,
                                            direction: ShimmerDirection.ltr,
                                          ),
                                          errorWidget: (context, url, err) =>
                                              Center(
                                            child: Text('No Image Found'),
                                          ),
                                        )),
                                    Expanded(
                                        child: ListTile(
                                      title: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                            model.data.articles[index].title ??
                                                'No Title'),
                                      ),
                                      subtitle: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(model.data.articles[index]
                                                .source.name ??
                                            'No Source'),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  : _key.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[200],
                        content: Text(model.modelError),
                      ),
                    ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
