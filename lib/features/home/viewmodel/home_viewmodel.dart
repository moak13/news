import 'package:stacked/stacked.dart';

import '../../../core/service/api.dart';
import '../../../locator.dart';
import '../model/news.dart';

class HomeViewModel extends FutureViewModel<News> {
  Api _api = locator<Api>();
  @override
  Future<News> futureToRun() async {
    News response = await _api.getNews();
    return response;
  }
}
