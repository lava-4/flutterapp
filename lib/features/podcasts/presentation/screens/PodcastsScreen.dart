import 'package:flutter/material.dart';
import 'package:stockmarketflutter/core/theme/colour.dart';
import 'package:stockmarketflutter/core/utils/app_exports.dart';
import '../../../../core/theme/app_theme.dart';
class PodcastsScreen extends StatelessWidget {
  final List<Map<String, String>> podcasts = AppData.getPodcasts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textSecondary,
      appBar: AppBar(
        title: Text("Podcasts", style: AppTheme.titleStyle),
        backgroundColor: AppColors.secondary,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: podcasts.length,
          itemBuilder: (context, index) {
            final podcast = podcasts[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: AppTheme.cardDecoration,
              child: ListTile(
                leading: Text(
                  podcast["icon"]!,
                  style: AppTheme.iconStyle,
                ),
                title: Text(
                  podcast["title"]!,
                  style: AppTheme.titleStyle,
                ),
                subtitle: Text(
                  podcast["description"]!,
                  style: AppTheme.subtitleStyle,
                ),
                trailing: Icon(Icons.play_circle_fill, color: AppColors.white, size: 32),
                onTap: () {
                  // Navigate to podcast details or play audio
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
