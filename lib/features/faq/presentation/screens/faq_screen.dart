import 'package:flutter/material.dart';
import '/core/utils/app_exports.dart';
class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      appBar: AppBar(title: Text(AppConstants.faqTitle)),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: AppConstants.faqList.length,
        itemBuilder: (context, index) {
          return _buildFAQItem(
            AppConstants.faqList[index]["question"]!,
            AppConstants.faqList[index]["answer"]!,
          );
        },
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(question, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(answer, style: TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }
}
