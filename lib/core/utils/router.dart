import 'package:auto_route/auto_route_annotations.dart';

import '../../features/home/ui/view/home_view.dart';
import '../../features/splash/ui/view/splash_view.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashView, initial: true),
  AdaptiveRoute(page: HomeView),
])
class $Router {}
