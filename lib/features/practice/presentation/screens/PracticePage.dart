import 'package:flutter/material.dart';
import '/core/utils/app_exports.dart';

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.navigationBackground , // Set Scaffold background to white
      appBar: AppBar(
        title: Text(AppConstants.practiceTitle),
        backgroundColor: AppColors.secondary,
      ),
      body: Center(
        child: Card(
          color: AppColors.textPrimary, // Your card color stays the same
          margin: EdgeInsets.all(AppConstants.heightSixteen),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.heightSixteen),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.trending_up, color: theme.primaryColor, size: AppConstants.fifty),
                SizedBox(height: AppConstants.heightTen),
                Text(
                  AppConstants.practiceTitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppConstants.heightFive),
                Text(
                  AppConstants.practiceSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
