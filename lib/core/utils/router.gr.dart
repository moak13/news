// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/details/ui/view/details_view.dart';
import '../../features/home/ui/view/home_view.dart';
import '../../features/splash/ui/view/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String homeView = '/home-view';
  static const String detailsView = '/details-view';
  static const all = <String>{
    splashView,
    homeView,
    detailsView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.detailsView, page: DetailsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    HomeView: (data) {
      var args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
    DetailsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const DetailsView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}
