import 'package:flutter/material.dart';
import '../../data/model/news_model.dart';
import '../../domain/usecase/get_market_news.dart';

class NewsProvider with ChangeNotifier {
  final GetMarketNews getMarketNews;
  List<NewsModel> _newsList = [];
  bool _isLoading = false;

  List<NewsModel> get newsList => _newsList;
  bool get isLoading => _isLoading;

  NewsProvider({required this.getMarketNews});

  Future<void> fetchMarketNews(String tickers, int limit) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newsData = await getMarketNews.execute(tickers: tickers, limit: limit);

      _newsList = newsData.map<NewsModel>((json) => NewsModel.fromJson(json)).toList(); // ✅ Mapping to NewsModel
    } catch (e) {
      _newsList = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
