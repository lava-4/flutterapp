import 'package:flutter/material.dart';
import '/core/utils/app_exports.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get current theme

    return Scaffold(
      backgroundColor: AppColors.navigationBackground,
      appBar: AppBar(
        title: Text(
          AppConstants.supportTitle,
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
            _buildSupportOption(
              theme,
              Icons.email,
              AppConstants.email,
              AppConstants.emailSupport,
            ),
            SizedBox(height: AppConstants.heightTwelve),
            _buildSupportOption(
              theme,
              Icons.phone,
              AppConstants.call,
              AppConstants.phoneSupport,
            ),
            SizedBox(height: AppConstants.heightTwelve),
            _buildSupportOption(
              theme,
              Icons.chat,
              AppConstants.live,
              AppConstants.chat,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(
      ThemeData theme,
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      padding: EdgeInsets.all(AppConstants.heightSixteen),
      decoration: BoxDecoration(
        color:AppColors.textSecondary, // Uses theme color
        borderRadius: BorderRadius.circular(AppConstants.heightTwelve),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.white ?? AppColors.navigationBackground),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color: AppColors.white),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        onTap: () {

        },
      ),
    );
  }
}
