import 'package:stockmarketflutter/features/account/presentation/screens/account.dart';

import '../../../beginner/presentation/screens/beginner_page.dart';
import '../../../portofolio/presentation/PortfolioScreen.dart';
import '/core/utils/app_exports.dart';
import 'package:stockmarketflutter/features/discover/presentation/screens/discover_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _selectedIndex = 1;

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
            Text("Discover", style: AppTheme.learnPageTitle),
            const SizedBox(height: AppConstants.heightTwenty),
            Expanded(
              child: ListView(
                children: AppData.discoverItemList.map((item) {
                  return _buildListItem(
                    icon: Icon(item["icon"], color: AppColors.primary),
                    title: item["label"],
                    description: item["description"],
                    onTap: () => Navigator.pushNamed(context, item["route"]),
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
        onTap: onTap,
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
}
