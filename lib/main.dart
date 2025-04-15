import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'core/utils/app_helper.dart';
import '/core/utils/app_exports.dart';
import 'features/login/presentation/providers/login_provider.dart'; // Update the import to match the file path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouterClass.splash,
        onGenerateRoute: RouterClass.generateRoute,
      ),
    );
  }
}
