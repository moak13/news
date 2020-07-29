import 'package:stacked/stacked.dart';

import '../../../../locator.dart';
import '../../domain/entities/news_data.dart';
import '../../domain/usecase/get_news.dart';

class HomeViewModel extends BaseViewModel {
  GetNews _getNews = locator<GetNews>();

  News _news;
  News get news => _news;
  bool _hasError = false;
  bool get hasError => _hasError;
  String _error;

  String get err => _error;

  Future<void> fetchNews() async {
    setBusy(true);
    notifyListeners();
    final result = await _getNews(NoParams());
    result.fold((error) {
      _hasError = true;
      print(error.toString());
      _error = error.toString();
      setBusy(false);
      notifyListeners();
    }, (data) {
      print(data);
      _news = data;
      setBusy(false);
      notifyListeners();
    });
    notifyListeners();
  }
}
