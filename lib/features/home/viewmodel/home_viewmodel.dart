import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/service/api.dart';
import '../../../locator.dart';
import '../../details/ui/views/details_view.dart';
import '../model/articles.dart';
import '../model/news.dart';

class HomeViewModel extends FutureViewModel<News> {
  Api _api = locator<Api>();
  NavigationService _navigationService = locator<NavigationService>();
  @override
  Future<News> futureToRun() async {
    News response = await _api.getNews();
    return response;
  }

  moveToDetails(Articles articles) {
    _navigationService.navigateToView(
      DetailsView(
        articles: articles,
      ),
    );
  }
}
