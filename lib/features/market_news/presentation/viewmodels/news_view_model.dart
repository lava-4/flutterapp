import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/news_repository.dart';

import '../../data/source/news_api_service.dart';
import '../../domain/usecase/get_market_news.dart';

// ✅ Define a provider for NewsApiService
final newsApiServiceProvider = Provider<NewsApiService>((ref) {
  return NewsApiService(); // Ensure NewsApiService is correctly implemented
});

// ✅ Define a provider for NewsRepository with the required parameter
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final newsApiService = ref.watch(newsApiServiceProvider);
  return NewsRepository(newsApiService: newsApiService);
});

// ✅ Define provider for GetMarketNews use case
final getMarketNewsProvider = Provider<GetMarketNews>((ref) {
  final newsRepository = ref.watch(newsRepositoryProvider);
  return GetMarketNews(newsRepository: newsRepository);
});

// ✅ NewsState class to manage UI state
class NewsState {
  final List<dynamic> marketNews;
  final bool isLoading;
  final String error;

  NewsState({
    required this.marketNews,
    required this.isLoading,
    required this.error,
  });

  // Factory method for initial state
  factory NewsState.initial() {
    return NewsState(
      marketNews: [],
      isLoading: false,
      error: '',
    );
  }
}

// ✅ ViewModel (StateNotifier) for managing news state
class NewsViewModel extends StateNotifier<NewsState> {
  final GetMarketNews getMarketNews;
  NewsViewModel({required this.getMarketNews}) : super(NewsState.initial()) {
    fetchNews(); // Fetch news immediately when ViewModel is created
  }

  // Fetch news method
  Future<void> fetchNews({String tickers = "IBM", int limit = 10}) async {
    print("Fetching news for tickers: $tickers with limit: $limit"); // ✅ Debug log

    state = NewsState(
      marketNews: [],
      isLoading: true,
      error: '',
    );

    try {
      final news = await getMarketNews.execute(tickers: tickers, limit: limit);
      print("Fetched news: $news"); // ✅ Debug log to check response

      state = NewsState(
        marketNews: news,
        isLoading: false,
        error: '',
      );
    } catch (e) {
      print("Error fetching news: $e"); // ✅ Debug log for errors

      state = NewsState(
        marketNews: [],
        isLoading: false,
        error: 'Failed to fetch news',
      );
    }
  }

}

// ✅ Define the provider for NewsViewModel
final newsViewModelProvider =
StateNotifierProvider<NewsViewModel, NewsState>((ref) {
  final getMarketNews = ref.watch(getMarketNewsProvider);
  return NewsViewModel(getMarketNews: getMarketNews);
});
