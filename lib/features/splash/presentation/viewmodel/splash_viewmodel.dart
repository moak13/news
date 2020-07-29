import 'dart:async';

import 'package:news/core/utils/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  // This holds the screen to move to
  _makeMove() {
    _navigationService.navigateTo('/home-view');
  }

  // This will handle the movement to a new page when app runs
  startupHandler() {
    Duration _duration = Duration(seconds: 2);
    return Timer(_duration, _makeMove);
  }
}
