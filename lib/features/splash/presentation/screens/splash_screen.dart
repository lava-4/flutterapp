import '/core/utils/app_exports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    final bool isLoggedIn = await SharedPrefHelper.isLoggedIn();

    await Future.delayed(const Duration(seconds: AppConstants.heightThreee));

    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/welcome');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppData.backgroundWrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConstants.splashHeading,
              textAlign: TextAlign.center,
              style: AppTheme.splashHeading,
            ),
            const SizedBox(height: AppConstants.heightTwenty),
            const Text(
              AppConstants.splashDes,
              textAlign: TextAlign.center,
              style: AppTheme.splashDescription,
            ),
          ],
        ),
      ),
    );
  }
}
