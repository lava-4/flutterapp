import 'package:flutter/material.dart';
import 'package:stockmarketflutter/core/constants/app_constanta.dart';
import 'package:stockmarketflutter/core/theme/colour.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary, // Updated background color
      appBar: AppBar(
        title: Text(AppConstants.profile),
        backgroundColor: AppColors.navigationBackground,
      ),
      body: Center( // Centering the column
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.heightTwenty),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevents unnecessary spacing
            children: [
              // Profile Picture
              CircleAvatar(
                radius: AppConstants.fifty, // Adjust size
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),

              SizedBox(height: AppConstants.heightTwenty),

              // Name TextField
              TextField(
                decoration: InputDecoration(
                  labelText: AppConstants.name,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.heightTen),
                  ),
                  filled: true,
                  fillColor: Colors.white, // TextField background color
                ),
              ),

              SizedBox(height: AppConstants.heightFifteen),

              // Email TextField (Read-only)
              TextField(
                decoration: InputDecoration(
                  labelText: AppConstants.emailId,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.heightTen),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                readOnly: true, // Prevents editing email
              ),

              SizedBox(height: AppConstants.heightTwenty),

              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // Add Edit Profile Functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navigationBackground,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.fourty, vertical: AppConstants.heightFifteen),
                ),
                child: Text(AppConstants.editProfile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
