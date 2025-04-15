import '../source/news_api_service.dart';
import '../model/news_model.dart';

class NewsRepository {
  final NewsApiService newsApiService;

  NewsRepository({required this.newsApiService});

  Future<List<NewsModel>> getMarketNews({String tickers = "IBM", int limit = 10}) async {
    final newsData = await newsApiService.fetchMarketNews(tickers: tickers, limit: limit);

    return newsData.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
  }
}
