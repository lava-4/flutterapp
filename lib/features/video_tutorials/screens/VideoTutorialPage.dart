import 'package:flutter/material.dart';
import 'package:stockmarketflutter/core/utils/app_exports.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_theme.dart';


class VideoTutorialsPage extends StatelessWidget {
  const VideoTutorialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videos = AppData.getVideoTutorials();

    return Scaffold(
      backgroundColor: AppTheme.listViewBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppConstants.videoTutorialsTitle,
          style: AppTheme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: AppTheme.appBarTheme.backgroundColor,
        iconTheme: AppTheme.appBarTheme.iconTheme,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return ListTile(
            leading: const Icon(Icons.video_library, size: AppConstants.fifty, color: Colors.grey),
            title: Text(video[AppConstants.title] ?? AppConstants.notitle),
            subtitle: Text(
              '${video[AppConstants.description] ?? AppConstants.nodescription}\n\n${AppConstants.clickHereForVideo}',
            ),
            onTap: () => _launchURL(video[AppConstants.url]!),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('${AppConstants.couldNotLaunchUrl}$url');
    }
  }
}
