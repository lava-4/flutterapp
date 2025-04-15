import '/core/utils/app_exports.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

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
            Text(
              AppConstants.learnTitle,
              style: AppTheme.learnPageTitle,
            ),
            const SizedBox(height: AppConstants.heightTwenty),
            Text(
              AppConstants.learnPageDescription,
              style: AppTheme.learnPageDescription,
            ),
            const SizedBox(height: AppConstants.heightThirty),
            Expanded(
              child: ListView(
                children: AppData.gridItemsList.map((item) {
                  return _buildLearnOption(
                    icon: Icon(
                      item["icon"],
                      color: AppColors.primary,
                      size: AppConstants.heightThirty,
                    ),
                    title: item["label"],
                    description: item["description"],
                    onTap: () {

                      if (item["label"] == "VIDEO TUTORIALS") {
                        Navigator.pushNamed(context, '/videoTutorials');
                      }
                      if (item["label"] == "MARKET NEWS") {
                      Navigator.pushNamed(context, '/marketNews');
                      }

                      if (item["label"] == "FAQ") {
                        Navigator.pushNamed(context, '/faq');
                      }

                      if (item["label"] == "SUPPORT") {
                        Navigator.pushNamed(context, '/support');
                      }
                      if (item["label"] == "PODCASTS") {
                        Navigator.pushNamed(context, '/podcasts');
                      }
                      if (item["label"] == "BLOGS & ARTICLES") {
                        Navigator.pushNamed(context, '/blogsArticles');
                      }
                      if (item["label"] == "PRACTICE") {
                        Navigator.pushNamed(context, '/practice');
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    //  bottomNavigationBar: AppData.buildBottomNavBar(context,_selectedIndex),
    );
  }

  Widget _buildLearnOption({
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
