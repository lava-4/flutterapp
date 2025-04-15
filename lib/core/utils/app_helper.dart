import 'package:flutter/material.dart';

import '/core/utils/app_exports.dart';

class AppData {

  // Bottom Navigation Items
  static List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: AppConstants.portfolioLabel),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: AppConstants.discoverLabel),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: AppConstants.learnLabel),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: AppConstants.accountLabel),
  ];

  static final List<Map<String, dynamic>> gridItems = [
    {"icon": Icon(Icons.mic, color: AppColors.primary, size: 30), "label": "PODCASTS"},
    {"icon": Icon(Icons.play_circle_fill, color: AppColors.primary, size: 30), "label": "VIDEO TUTORIALS"},
    {"icon": Icon(Icons.menu_book, color: AppColors.primary, size: 30), "label": "MARKET NEWS"},
    {"icon": Icon(Icons.article, color: AppColors.primary, size: 30), "label": "BLOGS & ARTICLES"},
    {"icon": Icon(Icons.science, color: AppColors.primary, size: 30), "label": "PRACTICE"},
    {"icon": Icon(Icons.grid_view, color: AppColors.primary, size: 30), "label": "MORE"},
  ];

  static final List<Map<String, dynamic>> gridItemsList = [
    {
      "icon": Icons.mic,
      "label": AppConstants.podcastsLabel,
      "description": AppConstants.podcastsDescription,
    },
    {
      "icon": Icons.play_circle_fill,
      "label": AppConstants.videoTutorialsLabel,
      "description": AppConstants.videoTutorialsDescription,
    },
    {
      "icon": Icons.article,
      "label": AppConstants.blogsArticlesLabel,
      "description": AppConstants.blogsDescription,
    },
    {
      "icon": Icons.menu_book,
      "label": AppConstants.glossaryLabel,
      "description": AppConstants.glossaryDescription,
    },
    {
      "icon": Icons.science,
      "label": AppConstants.practiceLabel,
      "description": AppConstants.practiceDescription,
    },
    {
      "icon": Icons.help_outline,
      "label": AppConstants.faq,
      "description": AppConstants.faqDescription,
    },
    {
      "icon": Icons.support_agent,
      "label": AppConstants.support,
      "description": AppConstants.supportDescription,
    },
  ];

  // Helper method to build Grid Items
  static Widget _buildGridItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 30),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTheme.gridText,
          ),
        ],
      ),
    );
  }

  // Method to get BottomNavItems
  static List<BottomNavigationBarItem> getBottomNavItems() {
    return bottomNavItems;
  }

  // Method to get Grid Items
  static List<Map<String, dynamic>> getGridItems() {
    return gridItems;
  }

  // Background Wrapper Method
  static Widget backgroundWrapper({required Widget child}) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppTheme.backgroundDecorations,
          ),
          CustomPaint(
            size: Size.infinite,
            painter: BackgroundCurvesPainter(),
          ),
          child,
        ],
      ),
    );
  }

/*

  static Widget buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.navigationBackground,
        borderRadius: BorderRadius.circular(AppConstants.heightThirty),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.heightThirty),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          elevation: AppConstants.heightZero,
          items: AppData.bottomNavItems,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
*/
  static Widget buildBottomNavBar({
    required int selectedIndex,
    required Function(int) onItemTapped,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.navigationBackground,
        borderRadius: BorderRadius.circular(AppConstants.heightThirty),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.heightThirty),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          elevation: AppConstants.heightZero,
          items: AppData.bottomNavItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,  // Set the current index
          onTap: onItemTapped,  // Handle clicks
        ),
      ),
    );
  }

  static List<Map<String, String>> getVideoTutorials() {
    return [
      {
        'title': 'Introduction to Stock Market',
        'description': 'Learn the basics of how the stock market operates.',
        'url': 'https://www.youtube.com/watch?v=0exQWnXJX-I',
      },
      {
        'title': 'Advanced Trading Strategies',
        'description': 'Explore advanced techniques for stock trading.',
        'url': 'https://www.youtube.com/watch?v=someVideoId2',
      },
      {
        'title': 'Reading Stock Charts',
        'description': 'Understand charts and indicators to make better decisions.',
        'url': 'https://www.youtube.com/watch?v=someVideoId3',
      },
    ];
  }

  static List<Map<String, String>> getPodcasts() {
    return [
      {
        "title": "Market Insights",
        "description": "Latest trends in stock market investments.",
        "icon": "🎙️"
      },
      {
        "title": "Trading Strategies",
        "description": "Learn new strategies from expert traders.",
        "icon": "📈"
      },
      {
        "title": "Crypto & Stocks",
        "description": "Understanding crypto and stock investments.",
        "icon": "💹"
      },
    ];
  }

  static const List<Map<String, String>> articles = [
    {
      "title": "Introduction to Investing",
      "content":
      "Investing is the process of putting money into assets like stocks, bonds, or real estate with the goal of generating profit over time. The stock market is one of the most popular places for investment, allowing individuals and institutions to buy shares of companies. Successful investing requires understanding risk management, market trends, and having a long-term strategy. Many beginners start by investing in index funds or mutual funds to minimize risk."
    },
    {
      "title": "Stock Market Basics",
      "content":
      "The stock market operates as a marketplace where investors buy and sell company shares. The price of a stock fluctuates based on demand, company performance, and economic conditions. The two primary stock exchanges are the NYSE and NASDAQ. Investors analyze company reports, earnings, and market trends before making a decision. Understanding terms like bull market, bear market, and market capitalization is crucial for new investors."
    },
    {
      "title": "Investment Strategies",
      "content":
      "Investment strategies vary based on risk tolerance and financial goals. Some popular strategies include growth investing, value investing, and dividend investing. Growth investors focus on companies with high potential for revenue expansion, while value investors look for undervalued stocks. Diversifying a portfolio is one of the key strategies to reduce risks and maximize returns."
    },
    {
      "title": "Market Trends & Analysis",
      "content":
      "Reading stock charts, analyzing trends, and staying informed with global economic news are essential for investors. Key indicators like moving averages, RSI, and MACD help predict stock movement. Technical analysis helps short-term traders, while fundamental analysis focuses on long-term potential. Investors must also track inflation, interest rates, and political events that affect the market."
    },
    {
      "title": "Beginner Tips",
      "content":
      "For new investors, it’s important to start small, avoid emotional decision-making, and have a long-term perspective. Diversifying investments, staying patient, and continuously learning about market behavior can lead to successful investing. Avoid common mistakes like panic selling, following market hype, and ignoring risk management."
    },
  ];

  static final List<Map<String, dynamic>> discoverItemList = [
    {
      "icon": Icons.trending_up,
      "label": "Trending Stocks",
      "description": "Stay updated with the latest market trends.",
      "route": "/trendingStocks",
    },
    {
      "icon": Icons.business,
      "label": "Market Insights",
      "description": "Get insights from experts about the stock market.",
      "route": "/marketInsights",
    },
    {
      "icon": Icons.pie_chart,
      "label": "Investment Strategies",
      "description": "Learn different strategies to maximize your investments.",
      "route": "/investmentStrategies",
    },
    {
      "icon": Icons.lightbulb,
      "label": "Trading Tips",
      "description": "Proven tips to improve your trading skills.",
      "route": "/tradingTips",
    },
    {
      "icon": Icons.new_releases,
      "label": "Stock Market News",
      "description": "Stay informed with the latest stock market news.",
      "route": "/stockMarketNews",
    },
  ];

  static final List<Map<String, dynamic>> accountItemList = [
    {
      "icon": Icons.person,
      "label": "Profile",
      "description": "View and edit your profile details.",
      "route": "/profile",
    },
    {
      "icon": Icons.security,
      "label": "Security",
      "description": "Manage security settings and passwords.",
      "route": "/security",
    },
    {
      "icon": Icons.notifications,
      "label": "Notifications",
      "description": "Manage your notification preferences.",
      "route": "/notifications",
    },
    {
      "icon": Icons.support,
      "label": "Help & Support",
      "description": "Contact support for any issues or queries.",
      "route": "/support",
    },
    {
      "icon": Icons.logout,
      "label": "Logout",
      "description": "Sign out from your account securely.",
      "route": "/logout",
    },
  ];

  static List<Map<String, String>> getNewsList() {
    return [
      {
        "title": "Apple Stock: Insiders Sell Their Shares, Future Prospects Not Promising",
        "date": "April 5, 2023",
        "image": "assets/images/news1.png",
      },
      {
        "title": "Apple Stock: Is Mixed-Reality Headset Apple’s Next Big Thing?",
        "date": "April 1, 2023",
        "image": "assets/images/news2.png",
      },
    ];
  }

}



