import 'package:stockmarketflutter/features/account/presentation/screens/account.dart';
import 'package:stockmarketflutter/features/beginner/presentation/screens/beginner_page.dart';
import 'package:stockmarketflutter/features/blog_and_articles/presentation/screens/BlogsArticlesPage.dart';
import 'package:stockmarketflutter/features/discover/presentation/screens/discover_page.dart';
import 'package:stockmarketflutter/features/learn/presentation/screens/LearnPage.dart';
import 'package:stockmarketflutter/features/login/presentation/screens/login_page.dart';
import 'package:stockmarketflutter/features/notification/presentation/screens/NotificationScreen.dart';
import 'package:stockmarketflutter/features/portofolio/presentation/PortfolioScreen.dart';
import 'package:stockmarketflutter/features/practice/presentation/screens/PracticePage.dart';
import 'package:stockmarketflutter/features/profile/presentations/screens/ProfilePage.dart';
import 'package:stockmarketflutter/features/security/presentation/screens/SecurityScreen.dart';
import 'package:stockmarketflutter/features/splash/presentation/screens/splash_screen.dart';
import 'package:stockmarketflutter/features/welcome_screen/presentation/screens/welcomePage.dart';
import 'package:flutter/material.dart';
import '../../features/faq/presentation/screens/faq_screen.dart';
import '../../features/market_news/presentation/screens/market_news_screen.dart';
import '../../features/podcasts/presentation/screens/PodcastsScreen.dart';
import '../../features/support/presentation/screens/support_screen.dart';
import '../../features/video_tutorials/screens/VideoTutorialPage.dart';
import 'app_helper.dart';



class RouterClass{
  // Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String beginner = '/beginner';
  static const String learn = '/learn';
  static const String videoTutorials = '/videoTutorials';
  static const String marketNews = '/marketNews';
  static const String faq = '/faq';
  static const String support = '/support';
  static const String podcasts = '/podcasts';
  static const String blogsArticles = '/blogsArticles';
  static const String practice = '/practice';
  static const String portofolio = '/portofolio';
  static const String discover = '/discover';
  static const String account = '/account';
  static const String profile = '/profile';
  static const String security = '/security';
  static const String notification = '/notification';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const Splash());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case welcome:
        final userName = settings.arguments as String? ?? "Default User";
        return MaterialPageRoute(builder: (_) => WelcomePage(userName: userName));

      case beginner:
        return MaterialPageRoute(
          builder: (_) => BeginnerPage(
            bottomNavItems: AppData.getBottomNavItems(),
            gridItems: AppData.getGridItems(),
          ),
        );

      case learn:
        return MaterialPageRoute(builder: (_) =>   LearnPage());

      case videoTutorials:
        return MaterialPageRoute(builder: (_) => VideoTutorialsPage());
      case marketNews:
        return MaterialPageRoute(builder: (_) => MarketNewsScreen());
      case faq:
        return MaterialPageRoute(builder: (_) => FAQScreen());
      case support:
        return MaterialPageRoute(builder: (_) => SupportScreen());
      case podcasts:
        return MaterialPageRoute(builder: (_) => PodcastsScreen());
      case blogsArticles:
        return MaterialPageRoute(builder: (_) => BlogsArticlesPage());

      case practice:
        return MaterialPageRoute(builder: (_) => PracticePage());

      case portofolio:
        return MaterialPageRoute(builder: (_) => PortfolioScreen());
      case discover:
        return MaterialPageRoute(builder: (_) => DiscoverPage());
      case account:
        return MaterialPageRoute(builder: (_) => AccountPage());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case security:
        return MaterialPageRoute(builder: (_) => SecurityScreen());
      case notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      default:
        return null;
    }
  }

}