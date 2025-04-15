import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/news_model.dart';
import '../../data/repositories/news_repository.dart';
import '../../data/source/news_api_service.dart';
import '/core/utils/app_exports.dart'; // import for theme/colors/constants

class MarketNewsScreen extends StatefulWidget {
  @override
  _MarketNewsScreenState createState() => _MarketNewsScreenState();
}

class _MarketNewsScreenState extends State<MarketNewsScreen> {
  late Future<List<NewsModel>> _newsFuture;
  final NewsRepository _newsRepository = NewsRepository(newsApiService: NewsApiService());

  @override
  void initState() {
    super.initState();
    _newsFuture = _newsRepository.getMarketNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: Text("Market News"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: AppTheme.pagePadding,
        child: FutureBuilder<List<NewsModel>>(
          future: _newsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading news"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No news available"));
            }

            final newsList = snapshot.data!;

            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];

                return Padding(
                  padding: AppTheme.optionPadding,
                  child: InkWell(
                    onTap: () async {
                      final url = Uri.parse(newsItem.url);
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Could not open news article")),
                        );
                      }
                    },
                    child: Container(
                      decoration: AppTheme.optionBoxDecoration,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: newsItem.bannerImage.isNotEmpty
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(newsItem.bannerImage, width: 80, height: 80, fit: BoxFit.cover),
                        )
                            : Icon(Icons.image_not_supported, size: 40),
                        title: Text(newsItem.title, style: AppTheme.learnOptionTitle),
                        subtitle: Text(newsItem.summary, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTheme.learnOptionDescription),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
