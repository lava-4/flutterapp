import 'dart:convert';
import 'package:http/http.dart' as http;
import '/core/utils/app_exports.dart';

class NewsApiService {
  static const String _baseUrl = AppConstants.baseUrl;
  static const String _apiKey = AppConstants.apiKey; // Replace with your Alpha Vantage API Key

  Future<List<dynamic>> fetchMarketNews({String tickers = "IBM", int limit = 10}) async {
    final Uri url = Uri.parse("$_baseUrl?function=NEWS_SENTIMENT&tickers=$tickers&limit=$limit&apikey=$_apiKey");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('feed') && data['feed'] is List) {
          return data['feed'];
        } else {
          throw Exception("Invalid API response: Missing or incorrect 'feed' key");
        }
      } else {
        throw Exception("API Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error fetching market news: $e");
      return [];
    }
  }
}
