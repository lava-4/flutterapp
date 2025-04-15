import 'package:flutter/material.dart';
import '/core/utils/app_exports.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.navigationBackground,
      appBar: AppBar(
        title: Text(
          AppConstants.security,
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
            _buildSecurityOption(
              theme,
              Icons.lock_outline,
              AppConstants.changePassword,
              AppConstants.updatePassword,
            ),
            SizedBox(height: AppConstants.heightTwelve),
            _buildSecurityOption(
              theme,
              Icons.fingerprint,
              AppConstants.enableBiometric,
             AppConstants.biometricSuccess,
            ),
            SizedBox(height: AppConstants.heightTwelve),
            _buildSecurityOption(
              theme,
              Icons.phonelink_lock,
              AppConstants.factor,
              AppConstants.extraSec,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption(
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
