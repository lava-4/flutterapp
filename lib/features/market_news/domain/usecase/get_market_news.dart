import '../../data/repositories/news_repository.dart';

class GetMarketNews {
  final NewsRepository newsRepository;

  GetMarketNews({required this.newsRepository});

  Future<List<dynamic>> execute({String tickers = "IBM", int limit = 10}) {
    return newsRepository.getMarketNews(tickers: tickers, limit: limit); // ✅ Use named parameters
  }
}
