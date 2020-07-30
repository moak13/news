import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
      builder: (context, model, child) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text('Flutter News'),
          ),
          body: model.isBusy
              ? Indicator()
              : !model.hasError
                  ? ListView.builder(
                      itemCount: model.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(model.data[index]),
                        );
                      })
                  : _key.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[200],
                        content: Text('error'),
                      ),
                    ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
