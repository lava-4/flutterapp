import 'package:flutter/material.dart';
import 'app_fonts.dart';
import 'colour.dart';

class AppTheme {
  // **Background Decoration**
  static const BoxDecoration backgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.png'),
      fit: BoxFit.cover,
    ),
  );

  // **Padding for Options**
  static const EdgeInsets optionPadding = EdgeInsets.all(16);

  // **Splash Screen Styles**
  static const TextStyle splashHeading = TextStyle(
    fontSize: 40.0,
    color: AppColors.primary,
    fontFamily: AppFonts.avenir,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle splashDescription = TextStyle(
    fontSize: 16.0,
    fontFamily: AppFonts.avenir,
    color: AppColors.white,
  );

  // **Login Screen Styles**
  static const TextStyle loginTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: AppFonts.avenir,
  );

  static const TextStyle textFieldStyle = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.avenir,
  );

  static const InputDecoration inputDecoration = InputDecoration(
    labelStyle: TextStyle(color: AppColors.white),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
    border: OutlineInputBorder(),
  );

  // **Button Styles**
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: const TextStyle(
      fontSize: 16, // Set the font size
      color: AppColors.textSecondary,
      fontFamily: AppFonts.avenir,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blue,
    cardColor: Colors.grey[900],
    textTheme: TextTheme(
      titleLarge: TextStyle(  // Updated from headline6
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(  // Updated from bodyText1
        color: Colors.white70,
        fontSize: 14,
      ),
      labelLarge: TextStyle(  // Updated from button
        color: Colors.blue,
      ),
    ),
  );

// Text Styles
  static const TextStyle titleStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleStyle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
  );

  static const TextStyle iconStyle = TextStyle(
    fontSize: 24,
  );

  // Card Style
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.secondary,
    borderRadius: BorderRadius.circular(12),
  );

  // **Learn Page Styles**

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 20.0);
  static const TextStyle learnPageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: AppFonts.avenir,
  );

  static const TextStyle learnPageDescription = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontFamily: AppFonts.avenir,
  );

  static const TextStyle learnOptionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: AppFonts.avenir,
  );

  static const TextStyle learnOptionDescription = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontFamily: AppFonts.avenir,
  );

  static final BoxDecoration optionBoxDecoration = BoxDecoration(
    color: Colors.black54,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );

  static const EdgeInsets pagePaddingStock = EdgeInsets.symmetric(horizontal: 20);

  // Stock Details Page Styles
  static const TextStyle stockTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle stockSubtitle = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle stockPrice = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle stockChange = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle chartPlaceholder = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  // Investment Tip Box
  static BoxDecoration tipBoxDecoration = BoxDecoration(
    color: AppColors.textSecondary,
    borderRadius: BorderRadius.circular(12),
  );

  static const TextStyle tipText = TextStyle(
    fontSize: 14,
    color: AppColors.white,
  );

  // Section Titles
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle sectionDescription = TextStyle(
    fontSize: 14,
    color: AppColors.white,
  );

  // News Section
  static const TextStyle newsTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle newsDate = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  // Button Styles
  static ButtonStyle buyButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  static ButtonStyle sellButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.textSecondary,
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  // **Welcome Screen Styles**
  static const TextStyle welcomeHeading = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: AppFonts.avenir,
  );

  static const TextStyle welcomeDescription = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontFamily: AppFonts.avenir,
  );


  static const TextStyle beginnerTitle= TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontFamily: AppFonts.avenir,
    fontWeight: FontWeight.bold,
  );

  static final BoxDecoration welcomeOptionDecoration = BoxDecoration(
    color: Colors.black54,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black45,
        blurRadius: 5,
        spreadRadius: 2,
      ),
    ],
  );


 static const TextStyle getStartedTheme = TextStyle(
   fontFamily: AppFonts.avenir,
   fontSize: 24,
   color: AppColors.white,
   fontWeight: FontWeight.bold,
 );


  static const TextStyle getStartedDescTheme = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );
  static const TextStyle gridText = TextStyle(
      color :AppColors.white,
     fontSize: 12,
  );


  // **Gradient Background Decoration**
  static const BoxDecoration backgroundDecorations = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF0F161B), // Dark bluish-black
        Color(0xFF112E2C), // Dark greenish tint
      ],
    ),
  );


  // ✅ Define AppBarTheme as a static constant
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: Colors.blue, // AppBar background color
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // AppBar icon color
    ),
  );

  // ✅ Define ListView background color as a static constant
  static const Color listViewBackgroundColor = Colors.black87;

  static final ThemeData darkThemeForBlog = ThemeData(
    scaffoldBackgroundColor: AppColors.textPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.textPrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
    ),

  );
}

class BackgroundCurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.greenAccent, Colors.lightGreenAccent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Adjusted Path 1: Moved upward by reducing Y-coordinates
    final Path path1 = Path();
    path1.moveTo(size.width * 0.1, size.height * 0.1); // Start point moved up
    path1.cubicTo(
      size.width * 0.3, size.height * 0.05,  // Control Point 1 moved up
      size.width * 0.7, size.height * 0.3,  // Control Point 2 moved up
      size.width * 1.1, size.height * 0.1,  // End Point moved up
    );

    // Adjusted Path 2: Moved upward by reducing Y-coordinates
    final Path path2 = Path();
    path2.moveTo(size.width * 0.05, size.height * 0.2); // Start point moved up
    path2.cubicTo(
      size.width * 0.2, size.height * 0.1, // Control Point 1 moved up
      size.width * 0.65, size.height * 0.25, // Control Point 2 moved up
      size.width * 1.2, size.height * 0.2,  // End Point moved up
    );

    // Adjusted Path 3: Moved upward by reducing Y-coordinates
    final Path path3 = Path();
    path3.moveTo(size.width * 0.15, size.height * 0.05); // Start point moved up
    path3.cubicTo(
      size.width * 0.4, size.height * 0.15,  // Control Point 1 moved up
      size.width * 0.8, size.height * 0.1,  // Control Point 2 moved up
      size.width * 1.1, size.height * 0.2,  // End Point moved up
    );

    // Draw the paths
    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}






class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.backgroundDecoration,
      child: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: BackgroundCurvesPainter(),
          ),
          child,
        ],
      ),
    );
  }
}
