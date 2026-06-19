import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const OrientBeninApp()); 
}

class OrientBeninApp extends StatelessWidget {
  const OrientBeninApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrientBénin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

String nomApp = "Orient-Bénin";
