import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/utils/screen_util.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            height: ScreenUtil(context).setHeight(),
            width: ScreenUtil(context).setWidth(),
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    'FLUTTER',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil(context).setSp(percentage: 45),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NEWS',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: ScreenUtil(context).setSp(percentage: 45),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
