import 'package:flutter/material.dart';
import 'package:pokemon/onboarding/presentation/screens/splash_screen.dart';
import 'package:pokemon/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen()
    );
  }
}
