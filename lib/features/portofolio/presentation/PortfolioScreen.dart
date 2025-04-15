import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:stockmarketflutter/core/utils/app_exports.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:stockmarketflutter/features/beginner/presentation/screens/beginner_page.dart';
import 'package:stockmarketflutter/features/stock_detail/presentation/ui/StockDetail.dart';

import '../../account/presentation/screens/account.dart';
import '../../discover/presentation/screens/discover_page.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _selectedIndex = AppConstants.zero; // Set Portfolio as the default selected tab
  List<FlSpot> stockData = [];
  bool isLoading = false;
  double latestStockPrice = AppConstants.heightZero;
  String stockSymbol = AppConstants.stockSymbol;
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
  Future<void> fetchStockData() async {
    setState(() => isLoading = true);
    final apiKey = AppConstants.apiKeyStock;
    final url =
        AppConstants.stockApiUrl;

  //  print("Fetching data from: $url");

    try {
      final response = await http.get(Uri.parse(url));
     // print("Response Status Code: ${response.statusCode}"); // Log status code

      if (response.statusCode == AppConstants.twoHundred) {
        final data = json.decode(response.body);
       // print("Response Body: $data"); // Log full response

        final timeSeries = data[AppConstants.timeseries];

        if (timeSeries != null) {
          List<FlSpot> tempData = [];
          int i = AppConstants.zero;

          for (var entry in timeSeries.entries.take(AppConstants.thirty)) {
            double price = double.parse(entry.value[AppConstants.close]);
            tempData.add(FlSpot(i.toDouble(), price));
            i++;
          }

          setState(() {
            stockData = tempData.reversed.toList();
            latestStockPrice =
                double.parse(timeSeries.entries.first.value[AppConstants.close]);
          });

       //  print("Parsed Stock Data: $stockData"); // Log parsed stock data
        } else {
       //  print("Error: 'Time Series (Daily)' not found in response.");
        }
      } else {
       // print("Error: Failed to fetch data. Response: ${response.body}");
      }
    } catch (e) {
     // print("Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }



  @override
  void initState() {
    super.initState();
    fetchStockData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(AppConstants.portfolioLabel),
        backgroundColor: Colors.black,
        elevation: AppConstants.heightZero,
        actions: [
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.heightSixteen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Account Balance",
                style: TextStyle(color: Colors.white70, fontSize: AppConstants.heightEighteen)),
            SizedBox(height: 5),
            Text("\$${latestStockPrice.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("+ 8.10%",
                style: TextStyle(color: Colors.greenAccent, fontSize: 16)),
            SizedBox(height: 15),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : LineChart(
                LineChartData(
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: stockData,
                      isCurved: true,
                      color: Colors.greenAccent,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildTimeRangeSelector(),
            SizedBox(height: 15),
            _buildPortfolioSection(),
          ],
        ),
      ), bottomNavigationBar: AppData.buildBottomNavBar( selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,),
    );
  }

  Widget _buildTimeRangeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _timeRangeButton("1W"),
        _timeRangeButton("1M"),
        _timeRangeButton("3M"),
        _timeRangeButton("1Y"),
        _timeRangeButton("All"),
      ],
    );
  }

  Widget _timeRangeButton(String label) {
    return TextButton(
      onPressed: () {},
      child: Text(label, style: TextStyle(color: Colors.white70)),
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Portfolio",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text("View all →",
                style: TextStyle(color: Colors.greenAccent, fontSize: 16))
          ],
        ),
        SizedBox(height: 10),
        _portfolioItem(
            "Apple Inc", "AAPL", 123456, 2.5, "assets/images/apple.png"),
        _portfolioItem(
            "Microsoft Corp", "MSFT", 12345, -3.7, "assets/images/microsoft.png"),
        _portfolioItem(
            "Alphabet Inc", "GOOG", 123456, 2.5, "assets/images/google.png"),
      ],
    );
  }

  Widget _portfolioItem(String name, String symbol, double price, double change, String assetPath) {
    return Card(
      color: Colors.grey[AppConstants.nineHundred],
      child: ListTile(
        leading: Image.asset(assetPath, width: AppConstants.fourty),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text(symbol, style: TextStyle(color: Colors.white60)),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$${price.toStringAsFixed(AppConstants.two)}",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text(
              "${change.toStringAsFixed(AppConstants.one)}%",
              style: TextStyle(color: change >= AppConstants.zero ? Colors.greenAccent : Colors.redAccent),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StockDetailsPage(
                name: name,
                symbol: symbol,
                price: price,
                change: change,
                assetPath: assetPath,
              ),
            ),
          );
        },
      ),
    );
  }


}




