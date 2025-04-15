import 'package:flutter/material.dart';
import 'package:stockmarketflutter/core/utils/app_exports.dart';

import '../../../../core/constants/app_constanta.dart';

class BlogsArticlesPage extends StatefulWidget {
  @override
  _BlogsArticlesPageState createState() => _BlogsArticlesPageState();
}

class _BlogsArticlesPageState extends State<BlogsArticlesPage> {
  List<bool> expandedList =
  List.generate(AppData.articles.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: Text(
          AppConstants.appTitle,
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.secondary,
        iconTheme: IconThemeData(color:  AppColors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(AppConstants.heightSixteen),
        itemCount: AppData.articles.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.textPrimary, // Card background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.heightTen),
            ),
            margin: EdgeInsets.symmetric(vertical: AppConstants.heightEight),
            child: Padding(
              padding: EdgeInsets.all(AppConstants.heightSixteen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppData.articles[index]["title"]!,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white, // Title text color
                    ),
                  ),
                  SizedBox(height: AppConstants.heightFive),
                  Text(
                    expandedList[index]
                        ? AppData.articles[index]["content"]!
                        : AppData.articles[index]["content"]!.substring(AppConstants.zero, AppConstants.hundred) + "...",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white, // Description text color
                    ),
                  ),
                  SizedBox(height: AppConstants.heightEight),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        expandedList[index] = !expandedList[index];
                      });
                    },
                    child: Text(
                      expandedList[index] ? AppConstants.readless : AppConstants.readmore,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
