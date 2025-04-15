import 'package:flutter/material.dart';
import '/core/utils/app_exports.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.navigationBackground,
      appBar: AppBar(
        title: Text(
          AppConstants.notifications,
          style: theme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: AppColors.navigationBackground,
        iconTheme: theme.appBarTheme.iconTheme,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.heightSixteen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationOption(
              theme,
              Icons.notifications_active_outlined,
              AppConstants.priceAlert,
              AppConstants.getAlert,
            ),
            SizedBox(height: AppConstants.heightTwelve),
            _buildNotificationOption(
              theme,
              Icons.article_outlined,
              AppConstants.marktnews,
              AppConstants.stay,
            ),
            SizedBox(height: AppConstants.heightTwelve),
            _buildNotificationOption(
              theme,
              Icons.settings_applications_outlined,
              AppConstants.appNotify,
              AppConstants.mangeApp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationOption(
      ThemeData theme,
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      padding: EdgeInsets.all(AppConstants.heightSixteen),
      decoration: BoxDecoration(
        color: AppColors.textSecondary,
        borderRadius: BorderRadius.circular(AppConstants.heightTwelve),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.white),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        onTap: () {},
      ),
    );
  }
}
