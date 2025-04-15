import 'package:stockmarketflutter/features/portofolio/presentation/PortfolioScreen.dart';

import '../../../account/presentation/screens/account.dart';
import '../../../discover/presentation/screens/discover_page.dart';
import '/core/utils/app_exports.dart';

class BeginnerPage extends StatefulWidget {
  final List<BottomNavigationBarItem> bottomNavItems;
  final List<Map<String, dynamic>> gridItems;

  const BeginnerPage({
    super.key,
    required this.bottomNavItems,
    required this.gridItems,
  });

  @override
  _BeginnerPageState createState() => _BeginnerPageState();
}

class _BeginnerPageState extends State<BeginnerPage> {
  int _selectedIndex = 2;

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.heightTwenty,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.getStartedTitle,
                    style: AppTheme.getStartedTheme,
                  ),
                  const SizedBox(height: AppConstants.heightEight),
                  Text(
                    AppConstants.getStartedDescription,
                    style: AppTheme.getStartedDescTheme,
                  ),
                  const SizedBox(height: AppConstants.heightTwenty),
                  _buildKnowledgeTestCard(),
                  const SizedBox(height: AppConstants.heightTwentyFive),
                  Text(
                    AppConstants.learnTitle,
                    style: TextStyle(
                      fontSize: AppConstants.heightTwentyTwo,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppConstants.heightEight),
                  Text(
                    AppConstants.learnDescription,
                    style: TextStyle(
                      fontSize: AppConstants.heightSixteen,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.heightTwenty),
                  _buildGrid(context),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppData.buildBottomNavBar( selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppConstants.heightThreee,
        crossAxisSpacing: AppConstants.heightTen,
        mainAxisSpacing: AppConstants.heightTen,
        childAspectRatio: AppConstants.heightOne,
      ),
      itemCount: widget.gridItems.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> item = widget.gridItems[index];
        final icon = item["icon"] as Widget;
        final label = item["label"] as String;
        return _buildGridItem(context, icon, label);
      },
    );
  }

  Widget _buildGridItem(BuildContext context, Widget icon, String label) {
    return GestureDetector(
      onTap: () {

        if (label.toUpperCase() == 'PODCASTS') {

          Navigator.pushNamed(context, '/podcasts');
        }

        if (label.toUpperCase() == 'VIDEO TUTORIALS') {

          Navigator.pushNamed(context, '/videoTutorials');
        }
        if (label.toUpperCase() == 'MARKET NEWS') {

          Navigator.pushNamed(context, '/marketNews');
        }
        if (label.toUpperCase() == 'BLOGS & ARTICLES') {

          Navigator.pushNamed(context, '/blogsArticles');
        }
        if (label.toUpperCase() == 'PRACTICE') {

          Navigator.pushNamed(context, '/practice');
        }
        if (label.toUpperCase() == 'MORE') {

          Navigator.pushNamed(context, '/learn');
        }
      },
      child: Container(
        width: AppConstants.heightNinety,
        height: AppConstants.heightNinety,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(AppConstants.heightTwelve),
          border: Border.all(
            color: AppColors.textSecondary,
            width: AppConstants.heightTwo,
          ),
        ),
        padding: const EdgeInsets.all(AppConstants.heightEight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: icon, // The icon/image for the grid item
              ),
            ),
            const SizedBox(height: AppConstants.heightFive),
            Text(
              label, // The text label below the icon
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppConstants.heightTwelve,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildKnowledgeTestCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.heightSixteen),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.heightFifteen),
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppConstants.knowledgeTestDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppConstants.heightSixteen,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.heightFifteen),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textSecondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.heightTwenty),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.heightThirty,
                vertical: AppConstants.heightTwelve,
              ),
            ),
            child: Text(AppConstants.letsDoItButton),
          ),
          const SizedBox(height: AppConstants.heightEight),
          TextButton(
            onPressed: () {},
            child: Text(
              AppConstants.skipButton,
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}


