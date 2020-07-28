import 'package:stacked/stacked.dart';

import '../../domain/entities/news_data.dart';
import '../../domain/usecase/get_news.dart';

class HomeViewModel extends BaseViewModel {
  GetNews _getNews;
  News _news;
  News get news => _news;
  bool _hasError = false;
  bool get hasError => _hasError;
  String _error;
  String get err => _error;

  Future fetchNews() async {
    setBusy(true);
    notifyListeners();
    final result = await _getNews.call(NoParams());
    result.fold((error) {
      _hasError = true;
      _error = error.toString();
      setBusy(false);
    }, (data) {
      _news = data;
      setBusy(false);
    });
    notifyListeners();
  }
}
