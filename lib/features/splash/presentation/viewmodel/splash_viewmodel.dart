import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../core/utils/locator.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  // This holds the screen to move to
  _makeMove() {
    _navigationService.replaceWith('/home-view');
  }

  // This will handle the movement to a new page when app runs
  startupHandler() {
    Duration _duration = Duration(seconds: 2);
    return Timer(_duration, _makeMove);
  }
}
