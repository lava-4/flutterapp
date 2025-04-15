import '/core/utils/app_exports.dart';

class WelcomePage extends StatelessWidget {
  final String userName;
  const WelcomePage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppData.backgroundWrapper(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.heightTwenty),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              AppConstants.expertiseLevel,
              style: AppTheme.welcomeHeading,
            ),
            const SizedBox(height: AppConstants.heightTen),
            const Text(
              AppConstants.expertiseDescription,
              textAlign: TextAlign.center,
              style: AppTheme.welcomeDescription,
            ),
            const SizedBox(height: AppConstants.heightfourty),
            ExpertiseOption(
              title: AppConstants.beginnerTitle,
              description: AppConstants.beginnerDescription,
              onTap: () {
                Navigator.pushNamed(context, '/beginner');
              },
            ),
            const SizedBox(height: AppConstants.heightTwenty),
            ExpertiseOption(
              title: AppConstants.intermediateTitle,
              description: AppConstants.intermediateDescription,
              onTap: () {
                Navigator.pushNamed(context, '/portofolio');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Add back the missing ExpertiseOption widget
class ExpertiseOption extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ExpertiseOption({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppTheme.optionPadding,
        decoration: AppTheme.welcomeOptionDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTheme.beginnerTitle,
            ),
            const SizedBox(height: AppConstants.heightFive),
            Text(
              description,
              style: AppTheme.welcomeDescription,
            ),
          ],
        ),
      ),
    );
  }
}
