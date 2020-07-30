import 'package:stacked/stacked.dart';

import '../../../core/service/api.dart';
import '../../../locator.dart';
import '../model/news.dart';

class HomeViewModel extends FutureViewModel {
  Api _api = locator<Api>();
  @override
  Future<News> futureToRun() {
    return _api.getNews();
  }
}
