import 'package:flutter/material.dart';
import 'package:task/apple_product_detail_screen.dart';
import 'package:task/home_screen.dart';
import 'package:task/sign_in_screen.dart';
import 'package:task/sign_up_screen.dart';
import 'package:task/splashscreen.dart';
import 'package:task/onboarding.dart'; // Import the OnBoarding screen

import 'log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Use the Navigator to handle navigation to the SplashScreen
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoarding(),
        '/home': (context) => const HomeScreen(), // Add other routes if needed
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/log_in': (context) => const LogInScreen(),
      },
    );
  }
}
