//import 'package:news/core/utils/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/news_data.dart';
import '../../domain/usecase/get_news.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final GetNews getNews;
  HomeViewModel({
    @required this.getNews,
  });

  News _news;
  News get news => _news;
  bool _hasError = false;
  bool get hasError => _hasError;
  String _error;

  String get err => _error;

  Future<void> fetchNews() async {
    setBusy(true);
    notifyListeners();
    final result = await getNews(NoParams());
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
