import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/core/utils/app_exports.dart';

class StockDetailsPage extends StatelessWidget {
  final String name;
  final String symbol;
  final double price;
  final double change;
  final String assetPath;

  StockDetailsPage({
    Key? key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.assetPath,
  }) : super(key: key);


  // Fetch news list from AppData
  final List<Map<String, String>> newsList = AppData.getNewsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:AppConstants.heightZero,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          AppConstants.stockdetail,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppTheme.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stock Header
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(assetPath), // Dynamic image
                    radius: AppConstants.heightTwenty,
                  ),
                  const SizedBox(width: AppConstants.heightTen),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(symbol, style: AppTheme.stockTitle), // Dynamic symbol
                      Text(name, style: AppTheme.stockSubtitle), // Dynamic name
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$${price.toStringAsFixed(AppConstants.two)}", style: AppTheme.stockPrice), // Dynamic price
                      Text(
                        "${change.toStringAsFixed(AppConstants.two)}%",
                        style: TextStyle(color: change >= AppConstants.heightZero ? Colors.greenAccent : Colors.redAccent),
                      ), // Dynamic change
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppConstants.heightThirty),

              // Stock Chart (Placeholder)
        Container(
          height: AppConstants.onefifty,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(AppConstants.pointOne),
            borderRadius: BorderRadius.circular(AppConstants.heightTwelve),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.eight),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text('Mon', style: TextStyle(color: Colors.white));
                          case 1:
                            return Text('Tue', style: TextStyle(color: Colors.white));
                          case 2:
                            return Text('Wed', style: TextStyle(color: Colors.white));
                          case 3:
                            return Text('Thu', style: TextStyle(color: Colors.white));
                          case 4:
                            return Text('Fri', style: TextStyle(color: Colors.white));
                          default:
                            return Text('', style: TextStyle(color: Colors.white));
                        }
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  border: Border.all(color: Colors.grey),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 120),
                      FlSpot(1, 125),
                      FlSpot(2, 110),
                      FlSpot(3, 140),
                      FlSpot(4, 135),
                    ],
                    isCurved: true,
                    color: change >= AppConstants.heightZero? Colors.greenAccent : Colors.redAccent,  // ✅ Dynamic Color Change
                    barWidth:AppConstants.heightThree,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),

          ),
        ),


        const SizedBox(height: AppConstants.heightTwenty),

              // Investment Tip
              Container(
                padding: const EdgeInsets.all(AppConstants.heightTwelve),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.heightTwelve),
                  color: AppColors.navigationBackground, // Use solid color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(AppConstants.pointOne), // Lower opacity
                      blurRadius: AppConstants.heightTwo, // Minimal blur effect
                      spreadRadius: AppConstants.heightOne, // Minimal spread
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.white, size: AppConstants.heightThirty),
                    const SizedBox(width: AppConstants.heightTen),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppConstants.tips, style: AppTheme.tipText),
                          const SizedBox(height: AppConstants.four),
                          Text(
                            AppConstants.tips,
                            style: TextStyle(fontSize: AppConstants.heightFourteen, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),



              const SizedBox(height: AppConstants.heightTwenty),

              // About Section
              Text(AppConstants.about, style: AppTheme.sectionTitle),
              const SizedBox(height: AppConstants.heightFive),
              Text(
                AppConstants.aboutDesc,
                style: AppTheme.sectionDescription,
              ),
              const SizedBox(height: AppConstants.heightTwenty),

              // News Section
              Text(AppConstants.news, style: AppTheme.sectionTitle),
              const SizedBox(height: AppConstants.heightTen),

              // News List
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(), // To prevent double scrolling
                shrinkWrap: true, // Important to fit inside Column
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return _buildNewsItem(
                    title: newsList[index][AppConstants.title]!,
                    date: newsList[index][AppConstants.date]!,
                    image: newsList[index][AppConstants.image]!,
                  );
                },
              ),

              const SizedBox(height: AppConstants.heightThirty),

              // Buy & Sell Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: AppConstants.heightfourteen),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.heightThirty),
                          side: const BorderSide(color: Colors.white, width: AppConstants.heightTwo), // Add border
                        ),
                      ),
                      child: const Text(
                        AppConstants.buy,
                        style: TextStyle(fontSize: AppConstants.heightEighteen, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.heightTen),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: AppConstants.heightfourteen),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.heightThirty),
                          side: const BorderSide(color: Colors.white, width: AppConstants.heightTwo), // Add border
                        ),
                      ),
                      child: const Text(
                        AppConstants.sell,
                        style: TextStyle(fontSize: AppConstants.heightEighteen, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.heightTwenty),
            ],
          ),
        ),
      ),
    );
  }

  // Build News Item
  Widget _buildNewsItem({required String title, required String date, required String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.heightFive),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.eight),
            child: Image.asset(image, width: AppConstants.eighty, height: AppConstants.eighty, fit: BoxFit.cover),
          ),
          const SizedBox(width: AppConstants.heightTen),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: AppTheme.newsDate),
                const SizedBox(height: AppConstants.heightFive),
                Text(title, style: AppTheme.newsTitle, maxLines: AppConstants.two, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
