import 'package:stockmarketflutter/features/notification/presentation/screens/NotificationScreen.dart';
import 'package:stockmarketflutter/features/profile/presentations/screens/ProfilePage.dart';
import 'package:stockmarketflutter/features/security/presentation/screens/SecurityScreen.dart';

import '../../../discover/presentation/screens/discover_page.dart';
import '/core/utils/app_exports.dart';
import '../../../beginner/presentation/screens/beginner_page.dart';
import '../../../portofolio/presentation/PortfolioScreen.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = AppConstants.heightThreee;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PortfolioScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DiscoverPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BeginnerPage(
              bottomNavItems: AppData.getBottomNavItems(),
              gridItems: AppData.getGridItems(),
            ),
          ),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppConstants.heightfourty),
            Text(AppConstants.account, style: AppTheme.learnPageTitle),
            const SizedBox(height: AppConstants.heightTwenty),
            Expanded(
              child: ListView(
                children: AppData.accountItemList.map((item) {
                  return _buildListItem(
                    icon: Icon(item[AppConstants.icon], color: AppColors.primary),
                    title: item[AppConstants.label],
                    description: item[AppConstants.description],
                    onTap: () => Navigator.pushNamed(context, item[AppConstants.route]),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppData.buildBottomNavBar( selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,),
    );
  }

  Widget _buildListItem({
    required Widget icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: AppTheme.optionPadding,
      child: InkWell(
        onTap: () {
          if (title == AppConstants.logout) {
            _showLogoutDialog();
          } else if (title == "Profile") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
            );
          }
          else if (title == "Security") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecurityScreen()), // Navigate to ProfilePage
            );
          }
          else if (title == "Notifications") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()), // Navigate to ProfilePage
            );
          }else {
            onTap();
          }
        },
        child: Container(
          decoration: AppTheme.optionBoxDecoration,
          child: ListTile(
            leading: icon,
            title: Text(title, style: AppTheme.learnOptionTitle),
            subtitle: Text(description, style: AppTheme.learnOptionDescription),
          ),
        ),
      ),
    );
  }
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.navigationBackground, // Change popup background color
          title: const Text(
            AppConstants.logout,
            style: TextStyle(color: Colors.white), // Change title text color
          ),
          content: const Text(
            AppConstants.logoutConfiramtion,
            style: TextStyle(color: Colors.white), // Change content text color
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Change text color to grey
                backgroundColor: AppColors.secondary, // Change background color to red
              ),
              child: const Text(AppConstants.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog first
                Navigator.pushReplacementNamed(context, "/login"); // Move to login page
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Change text color to white
                backgroundColor: AppColors.secondary, // Change background color to red
              ),
              child: const Text(AppConstants.logout),
            ),
          ],
        );
      },
    );
  }


}
